### =========================================================================
### The type() getter and setter
### -------------------------------------------------------------------------
###


setGeneric("type", function(x) standardGeneric("type"))

setGeneric("type<-", signature="x",
    function(x, value) standardGeneric("type<-")
)

setMethod("type", "vector", function(x) typeof(x))
setMethod("type", "array", function(x) typeof(x))

setReplaceMethod("type", "vector",
    function(x, value) `storage.mode<-`(x, value=value)
)
setReplaceMethod("type", "array",
    function(x, value) `storage.mode<-`(x, value=value)
)

