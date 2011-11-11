### =========================================================================
### The updateObject() generic and related utilities
### -------------------------------------------------------------------------
###
### An "updateObject" default method + methods for some standard types are
### also provided.
###


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Utilities.
###

getObjectSlots <- function(object)  # object, rather than class defn, slots
{
    if (!is.object(object) || isVirtualClass(class(object)))
        return(NULL)
    value <- attributes(object)
    value$class <- NULL
    if (is(object, "vector")) {
        .Data <- as.vector(object)
        attr(.Data, "class") <- NULL
        attrNames <- c("comment", "dim", "dimnames",
                       "names", "row.names", "tsp")
        for (nm in names(value)[names(value) %in% attrNames])
            attr(.Data, nm) <- value[[nm]]
        value <- value[!names(value) %in% attrNames]
        value$.Data <- .Data
    }
    value
}

updateObjectFromSlots <- function(object, objclass=class(object),
                                  ..., verbose=FALSE)
{
    if (is(object, "environment")) {
        if (verbose)
            message("returning original object of class 'environment'")
        return(object)
    }
    classSlots <- slotNames(objclass)
    if (is.null(classSlots)) {
        if (verbose)
            message("definition of '", objclass, "' has no slots; ",
                    "returning original object")
        return(object)
    }
    errf <- function(...)
    {
        function(err) {
            if (verbose)
                message(..., ":\n    ", conditionMessage(err),
                        "\n    trying next method...")
            NULL
        }
    }
    if (verbose)
        message("updateObjectFromSlots(object = '", class(object),
                "' class = '", objclass, "')")
    objectSlots <- getObjectSlots(object)
    ## de-mangle and remove NULL
    nulls <- sapply(names(objectSlots),
                    function(slt) is.null(slot(object, slt)))
    objectSlots[nulls] <- NULL
    joint <- intersect(names(objectSlots), classSlots)
    toUpdate <- joint[joint!=".Data"]
    objectSlots[toUpdate] <- lapply(objectSlots[toUpdate],
                                    updateObject, ..., verbose=verbose)
    toDrop <- which(!names(objectSlots) %in% classSlots)
    if (length(toDrop) > 0L) {
        warning("dropping slot(s) ",
                paste(names(objectSlots)[toDrop],collapse=", "),
                " from object = '", class(object), "'")
        objectSlots <- objectSlots[-toDrop]
    }
    ## ad-hoc methods for creating new instances
    res <- NULL
    if (is.null(res)) {
        if (verbose)
            message("heuristic updateObjectFromSlots, method 1")
        res <- tryCatch({
                   do.call(new, c(objclass, objectSlots[joint]))
               }, error=errf("'new(\"", objclass,
                             "\", ...)' from slots failed"))
    }
    if (is.null(res)) {
        if (verbose)
            message("heuristic updateObjectFromSlots, method 2")
        res <- tryCatch({
                   obj <- do.call(new, list(objclass))
                   for (slt in joint)
                       slot(obj, slt) <- updateObject(objectSlots[[slt]],
                                                      ..., verbose=verbose)
                   obj
               }, error=errf("failed to add slots to 'new(\"", objclass,
                             "\", ...)'"))
    }
    if (is.null(res))
        stop("could not updateObject to class '", objclass, "'",
             "\nconsider defining an 'updateObject' method for class '",
             class(object), "'")
    res
}


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### updateObject()
###

setGeneric("updateObject", signature="object",
    function(object, ..., verbose=FALSE)
    {
        result <- standardGeneric("updateObject")
        validObject(result)
        result
    }
)

setMethod("updateObject", "ANY",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject(object=\"ANY\") default for object ",
                    "of class '", class(object), "'")
        if (length(getObjectSlots(object)) > 0L &&
            !any(class(object) %in% c("data.frame")))
        {
            updateObjectFromSlots(object, ..., verbose=verbose)
        } else {
            object
        }
    }
)

setMethod("updateObject", "list",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject(object = 'list')")
        if ("class" %in% names(attributes(object)))
            callNextMethod() # old-style S4
        else {
            result <- lapply(object, updateObject, ..., verbose=verbose)
            attributes(result) <- attributes(object)
            result
        }
    }
)

setMethod("updateObject", "environment",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject(object = 'environment')")
        envLocked <- environmentIsLocked(object)
        if (verbose) {
            if (envLocked)
                warning("updateObject duplicating locked environment")
            else
                warning("updateObject modifying environment")
        }
        env <- if (envLocked) new.env() else object
        lapply(ls(object, all=TRUE),
               function(elt) {    # side-effect!
                   bindingLocked <- bindingIsLocked(elt, object)
                   if (!envLocked && bindingLocked)
                       stop("updateObject object = 'environment' ",
                            "cannot modify locked binding '", elt, "'")
                   else {
                       env[[elt]] <<- updateObject(object[[elt]],
                                                   ..., verbose=verbose)
                       if (bindingLocked) lockBinding(elt, env)
                   }
                   NULL
               })
        attributes(env) <- attributes(object)
        if (envLocked)
            lockEnvironment(env)
        env
    }
)

