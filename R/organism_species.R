### =========================================================================
### The organism(), `organism<-`(), species(), and `species<-`() generics
### -------------------------------------------------------------------------

setGeneric("organism", function(x, ...) standardGeneric("organism"))

setGeneric("organism<-", signature="x",
    function(x, ..., value) standardGeneric("organism<-")
)

setGeneric("species", function(x, ...) standardGeneric("species"))

setGeneric("species<-", signature="x",
    function(x, ..., value) standardGeneric("species<-")
)

