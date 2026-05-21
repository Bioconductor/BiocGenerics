### =========================================================================
### The table() generic
### -------------------------------------------------------------------------


### It's... complicated! and ugly :-(

setGeneric("table", signature="x", function(x, ...) standardGeneric("table"))

.default_table <- function(x, ...)
{
    sys_call <- sys.call()
    sys_call[[1L]] <- quote(base::table)
    base::eval(sys_call, envir=parent.frame())
}

setMethod("table", "ANY", .default_table)

### EXPERIMENTAL! Not exported yet.
setGeneric("nary_table", function(...) standardGeneric("nary_table"))
setMethod("nary_table", "ANY",
    function(...)
        stop("Passing more than one S4 object to BiocGenerics::table() ",
             "only works if the S4 objects are supported via a dedicated ",
             "BiocGenerics:::nary_table() method. Couldn't find such method.")
)

setMethod("table", "missing",
    function(x, ...)
    {
        dotargs <- list(...)
        dotargs_names <- names(dotargs)
        if (is.null(dotargs_names)) {
            ## Should never happen when the "missing" method is called thru
            ## method dispatch. Can only happen when method dispatch is
            ## bypassed and the method called directly with something like:
            ##   FUN <- selectMethod("table", "missing")
            ##   FUN(-5, sample(4, 99, replace=TRUE))
            return(base::table(...))
        }
        S4_idx <- which(vapply(dotargs, isS4, logical(1)))
        if (length(S4_idx) == 0L)
            return(base::table(...))
        if (length(S4_idx) == 1L) {
            ## Forward to appropriate method.
            x <- dotargs[[S4_idx]]
            args <- c(list(x), dotargs[-S4_idx])
            return(do.call("table", args))
        }
        nary_table(...)
    }
)

