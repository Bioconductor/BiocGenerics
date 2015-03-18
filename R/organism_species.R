### =========================================================================
### The organism(), `organism<-`(), species(), and `species<-`() generics
### -------------------------------------------------------------------------

setGeneric("organism", function(object) standardGeneric("organism"))

setGeneric("organism<-", signature="object",
    function(object, value) standardGeneric("organism<-")
)

setGeneric("species", function(object) standardGeneric("species"))

setGeneric("species<-", signature="object",
    function(object, value) standardGeneric("species<-")
)

