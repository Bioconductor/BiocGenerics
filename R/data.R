### =========================================================================
### The data() generic
### -------------------------------------------------------------------------


### Modeled after the table() generic, but with one additional complication:
### utils::data() uses non-standard evaluation! This means that our generic
### below must also support it i.e. it must accept datasets specified by name
### without quotes.

setGeneric("data", signature="x",
    function(x, ...)
    {
        ## Need this to support non-standard evaluation. The consequence
        ## of adding our own body to the definition of this generic function
        ## is that it makes it a nonstandardGenericFunction.
        if (!missing(x)) {
            name <- substitute(x)
            if (is.name(name) && !exists(name, envir=parent.frame()))
                x <- as.character(name)
        }
        standardGeneric("data")
    }
)

.default_data <- function(x, ...)
{
    sys_call <- sys.call()
    sys_call[[1L]] <- quote(utils::data)
    base::eval(sys_call, envir=parent.frame())
}

setMethod("data", "ANY", .default_data)

### EXPERIMENTAL! Not exported yet.
setGeneric("nary_data", function(...) standardGeneric("nary_data"))
setMethod("nary_data", "ANY",
    function(...)
        stop("Passing more than one S4 object to BiocGenerics::data() ",
             "only works if the S4 objects are supported via a dedicated ",
             "BiocGenerics:::nary_data() method. Couldn't find such method.")
)

setMethod("data", "missing",
    function(x, ...)
    {
        dotargs <- list(...)
        dotargs_names <- names(dotargs)
        if (is.null(dotargs_names)) {
            ## Should never happen when the "missing" method is called thru
            ## method dispatch. Can only happen when method dispatch is
            ## bypassed and the method called directly with something like:
            ##   FUN <- selectMethod("data", "missing")
            ##   FUN(-5, sample(4, 99, replace=TRUE))
            return(utils::data(...))
        }
        S4_idx <- which(vapply(dotargs, isS4, logical(1)))
        if (length(S4_idx) == 0L)
            return(utils::data(...))
        if (length(S4_idx) == 1L) {
            ## Forward to appropriate method.
            x <- dotargs[[S4_idx]]
            args <- c(list(x), dotargs[-S4_idx])
            return(do.call("data", args))
        }
        nary_data(...)
    }
)

