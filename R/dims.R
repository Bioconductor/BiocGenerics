### =========================================================================
### The dims(), nrows() and ncols() generics
### -------------------------------------------------------------------------
###

setGeneric("dims", signature="x",
    function(x, use.names=TRUE) standardGeneric("dims")
)

setGeneric("nrows", signature="x",
    function(x, use.names=TRUE) standardGeneric("nrows")
)

setGeneric("ncols", signature="x",
    function(x, use.names=TRUE) standardGeneric("ncols")
)

