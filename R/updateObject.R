### =========================================================================
### The updateObject() generic and related utilities
### -------------------------------------------------------------------------
###
### An "updateObject" default method + methods for some standard types are
### also provided.
###
### Most of the code in this file originally by Martin Morgan in Biobase,
### and moved to BiocGenerics in November 2011.
###


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Utilities.
###

updateObjectFrom_errf <- function(..., verbose=FALSE) {
    function(err) {
        if (verbose)
            message(..., ":\n    ", conditionMessage(err),
                    "\n    trying next method...")
        NULL
    }
}

getObjectSlots <- function(object)  # object, rather than class defn, slots
{
    if (!is.object(object) || isVirtualClass(class(object)[[1L]]))
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

updateObjectFromSlots <- function(object, objclass=class(object)[[1L]],
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
    if (verbose)
        message("updateObjectFromSlots(object = '", class(object)[[1L]],
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
        warning("dropping slot(s) '",
                paste(names(objectSlots)[toDrop], collapse="', '"),
                "' from object = '", class(object)[[1L]], "'")
        objectSlots <- objectSlots[-toDrop]
    }
    ## ad-hoc methods for creating new instances
    res <- NULL
    if (is.null(res)) {
        if (verbose)
            message("heuristic updateObjectFromSlots, method 1")
        res <- tryCatch({
                   do.call(new, c(objclass, objectSlots[joint]))
               }, error=updateObjectFrom_errf(
                      "'new(\"", objclass, "\", ...)' from slots failed",
                      verbose=verbose))
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
               }, error=updateObjectFrom_errf(
                      "failed to add slots to 'new(\"", objclass, "\", ...)'",
                      verbose=verbose))
    }
    if (is.null(res))
        stop("could not updateObject to class '", objclass, "'",
             "\nconsider defining an 'updateObject' method for class '",
             class(object)[[1L]], "'")
    res
}

getObjectFields <- function(object)
{
    value <- object$.refClassDef@fieldClasses
    for (field in names(value))
        value[[field]] <- object$field(field)
    value
}

updateObjectFromFields <-
    function(object, objclass=class(object)[[1L]], ..., verbose=FALSE)
{
    if (verbose)
        message("updateObjectFromFields(object = '", class(object)[[1L]],
                "' objclass = '", objclass, "')")

    classFields <- names(getRefClass(objclass)$fields())
    if (is.null(classFields)) {
        if (verbose)
            message("definition of '", objclass, "' has no fields; ",
                    "regurning original object")
        return(object)
    }

    objectFields <- getObjectFields(object)

    toUpdate <- joint <- intersect(names(objectFields), classFields)
    objectFields[toUpdate] <-
        lapply(objectFields[toUpdate], updateObject, ..., verbose=verbose)
    toDrop <- which(!names(objectFields) %in% classFields)
    if (length(toDrop) > 0L) {
        warning("dropping fields(s) '",
                paste(names(objectFields)[toDrop], collapse="', '"),
                "' from object = '", class(object)[[1L]], "'")
        objectFields <- objectFields[-toDrop]
    }

        ## ad-hoc methods for creating new instances

    if (verbose)
        message("heuristic updateObjectFromFields, method 1")
    res <- tryCatch({
        do.call(new, c(objclass, objectFields[joint]))
    }, error = updateObjectFrom_errf(
           "'new(\"", objclass, "\", ...' from slots failed",
           verbose=verbose)
    )

    if (is.null(res))
        stop("could not updateObject to class '", objclass, "'",
             "\nconsider defining an 'updateObject' method for class '",
             class(object)[[1L]], "'")
    res
}


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### attach_classdef_and_updateobjdef_pkgs()
###

### Known invalid packages found in 'attr(class(x), "package")' as of
### Nov 17, 2021.
.KNOWN_INVALID_CLASSDEF_PKGS <- c(
  ## For some serialized S4 instances in the hubs 'attr(class(x), "package")'
  ## is set to ".GlobalEnv"! This is the case for example for CellMapperList
  ## instances EH170 to EH175 in ExperimentHub. Not sure how that's allowed
  ## but let's just deal with it.
    ".GlobalEnv",
  ## SimResults class (e.g.
  ## "iCOBRA/inst/extdata/cobradata_example_simres.Rdata") is defined in the
  ## benchmarkR package which is not part of CRAN or Bioconductor (GitHub-only
  ## package).
    "benchmarkR",
  ## The galgo.Obj class (e.g. "GSgalgoR/inst/extdata/results/final_1.rda")
  ## used to be defined in galgoR but this package no longer exists (has
  ## been renamed GSgalgoR).
    "galgoR",
  ## The MutationFeatureData class (e.g.
  ## decompTumor2Sig/inst/extdata/Nik-Zainal_PMID_22608084-pmsignature-G.Rdata)
  ## is defined in the pmsignature package which is not part of CRAN or
  ## Bioconductor (GitHub-only package).
    "pmsignature",
  ## The QCStats class (e.g. "arrayMvout/inst/simpleaffy/afxsubQC.rda")
  ## was defined in simpleaffy which got removed in BioC 3.13.
    "simpleaffy",
  ## The YAQCStats class (e.g. "qcmetrics/inst/extdata/yqc.rda")
  ## was defined in yaqcaffy which got removed in BioC 3.14.
    "yaqcaffy"
)

### A wrapper around attachNamespace() that tries to attach the package only
### if it's not already attached.
.attach_namespace <- function(pkg)
{
    if (!(paste0("package:", pkg) %in% search())) {
        suppressMessages(suppressWarnings(suppressPackageStartupMessages(
            attachNamespace(pkg)
        )))
    }
}

### For some unclear reasons, updateObject(x) will fail sometimes if the
### package where class(x) is defined ("classdef" pkg) is loaded but not
### attached, or if the package where the updateObject() method for objects
### of class class(x) is defined ("updateobjdef" pkg) is loaded but not
### attached.
### This happens for example if 'x' is of class enrichResult (the enrichResult
### class is defined in the DOSE package) and if the DOSE package was
### indirectly loaded with library(TimiRGeN).
### This helper function will make sure that the "classdef" and "updateobjdef"
### packages gets attached.
### NOT exported but used in the updateObject package (in addition to being
### used in the updateObject() generic function below).
attach_classdef_and_updateobjdef_pkgs <- function(x_class)
{
    classdef_pkg <- attr(x_class, "package")
    if (is.null(classdef_pkg) || classdef_pkg %in% .KNOWN_INVALID_CLASSDEF_PKGS)
        return()
    .attach_namespace(classdef_pkg)
    updateobjdef <- selectMethod(updateObject, x_class)
    updateobjdef_pkg <- environmentName(environment(updateobjdef))
    if (updateobjdef_pkg == "R_GlobalEnv")
        return()
    .attach_namespace(updateobjdef_pkg)
}


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### updateObject()
###

### TODO: Would be cleaner if 'check' was a formal argument.
setGeneric("updateObject", signature="object",
    function(object, ..., verbose=FALSE)
    {
        if (!isTRUEorFALSE(verbose))
            stop("'verbose' must be TRUE or FALSE")
        if (isTRUE(getOption("updateObject.can.attach.packages"))) {
            ## We silently try to **attach** (loading is not enough) the
            ## packages where class(object) and
            ## selectMethod(updateObject, class(object)) are defined.
            ## This increases the chances of success of updateObject(object).
            ## See attach_classdef_and_updateobjdef_pkgs() above for the
            ## details.
            ## Note that we don't do this by default, only if global
            ## option "updateObject.can.attach.packages" is set to TRUE.
            ## Problem with doing this by default (i.e. for regular use of
            ## updateObject()) is that many packages call updateObject()
            ## internally e.g. analyzeSNPhood() in the SNPhood package calls
            ## the estimateSizeFactors() method for DESeqDataSet objects,
            ## which in turn calls updateObject(). As a result, calling
            ## analyzeSNPhood() will attach DESeq2 to the search path if
            ## it's not already attached. Which is not good. See
            ## https://stat.ethz.ch/pipermail/bioc-devel/2023-October/020024.html
            ## for the full story.
            ## Generally speaking, package functionalities should not have
            ## the side effect of altering the search path.
            ## The one place where we actually set global option
            ## "updateObject.can.attach.packages" to TRUE is in
            ## updateObject:::.update_object().
            try(attach_classdef_and_updateobjdef_pkgs(class(object)),
                silent=TRUE)
        }
        result <- standardGeneric("updateObject")
        check <- list(...)$check
        if (is.null(check)) {
            check <- TRUE
        } else if (!isTRUEorFALSE(check)) {
            stop("'check' must be TRUE or FALSE")
        }
        if (check) {
            if (inherits(object, "S7_object")) {
                ## validObject() is broken on S7 objects!
                if (verbose)
                    message("[updateObject] Skipping validation of S7 object")
            } else {
                if (verbose)
                    message("[updateObject] Validating the updated object ... ",
                            appendLF=FALSE)
                validObject(result)
                if (verbose)
                    message("OK")
            }
        }
        result
    }
)

### We replicate the hack that base R uses to internally represent automatic
### row names in a compact way. See base::.set_row_names for what they use
### exactly. Note that this internal hack is revealed by dput() e.g.
###   > dput(data.frame(a=6:2))
###   structure(list(a=6:2), class="data.frame", row.names=c(NA, -5L))
.hack_row.names_attr <- function(x)
{
    row.names <- attr(x, "row.names")
    if (is.integer(row.names)) {
        rn_len <- length(row.names)
        if (rn_len != 0L && identical(row.names, seq_len(rn_len)))
            attr(x, "row.names") <- c(NA, -rn_len)
    }
    x
}

setMethod("updateObject", "ANY",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject(object=\"ANY\") default for object ",
                    "of class '", class(object)[[1L]], "'")
        if (length(getObjectSlots(object)) > 0L &&
            !any(class(object) %in% c("data.frame", "factor")))
        {
            return(updateObjectFromSlots(object, ..., verbose=verbose))
        }
        if (is.list(object)) {
            ans <- lapply(object, updateObject, ..., verbose=verbose)
            attributes(ans) <- attributes(object)
            return(.hack_row.names_attr(ans))
        }
        object
    }
)

setMethod("updateObject", "environment",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject(object = 'environment')")
        ## This is a trick to avoid infinite recursion. See comment below
        ## for more information.
        attrname <- "__updateObject_please_dont_touch_me__"
        dont_touch <- isTRUE(attr(object, attrname, exact=TRUE))
        if (dont_touch)
            return(object)
        envLocked <- environmentIsLocked(object)
        if (verbose) {
            if (envLocked)
                warning("updateObject duplicating locked environment")
            else
                warning("updateObject modifying environment")
        }
        if (envLocked) {
            ans <- new.env()
            attributes(ans) <- attributes(object)
        } else {
            ans <- object
        }
        ## Note that an environment can contain itself so we temporarily set
        ## an attribute on 'object' to mark it as being under the process of
        ## being updated. This allows us to avoid infinite recursion
        ## if 'object' contains itself.
        attr(object, attrname) <- TRUE
        on.exit({attr(object, attrname) <- NULL})
        for (elt in ls(object, all.names=TRUE)) {
            bindingLocked <- bindingIsLocked(elt, object)
            if (!envLocked && bindingLocked)
                stop("updateObject object = 'environment' ",
                     "cannot modify locked binding '", elt, "'")
            ans[[elt]] <- updateObject(object[[elt]], ..., verbose=verbose)
            if (bindingLocked) lockBinding(elt, ans)
        }
        if (envLocked)
            lockEnvironment(ans)
        ans
    }
)

setMethod("updateObject", "formula",
    function(object, ..., verbose=FALSE)
{
    if (verbose)
        ## object@.Environment could be too general, e.g,. R_GlobalEnv
        message("updateObject(object = 'formula'); ignoring .Environment")
    object
})

setMethod("updateObject", "envRefClass",
    function(object, ..., verbose=FALSE)
{
    msg <- sprintf("updateObject(object= '%s')", class(object)[[1L]])
    if (verbose)
        message(msg)
    updateObjectFromFields(object, ..., verbose=verbose)
})
