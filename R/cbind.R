### =========================================================================
### The cbind() and rbind() generics
### -------------------------------------------------------------------------

setGeneric("cbind", signature="...",
    function(..., deparse.level=1) standardGeneric("cbind")
)

setGeneric("rbind", signature="...",
    function(..., deparse.level=1) standardGeneric("rbind")
)

