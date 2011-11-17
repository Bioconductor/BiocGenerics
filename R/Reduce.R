### =========================================================================
### The Reduce(), Filter(), Find(), Map() and Position() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all the arguments. Here we set
### dispatch on the 2nd arg (the 'x' or '...' arg) only!

setGeneric("Reduce", signature="x",
    function(f, x, init, right=FALSE, accumulate=FALSE)
        standardGeneric("Reduce")
)

setGeneric("Filter", signature="x",
    function(f, x) standardGeneric("Filter")
)

setGeneric("Find", signature="x",
    function(f, x, right=FALSE, nomatch=NULL) standardGeneric("Find")
)

setGeneric("Map", signature="...",
    function(f, ...) standardGeneric("Map")
)

setGeneric("Position", signature="x",
    function(f, x, right=FALSE, nomatch=NA_integer_)
        standardGeneric("Position")
)

