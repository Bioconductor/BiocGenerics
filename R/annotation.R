### =========================================================================
### The annotation() and `annotation<-`() generics
### -------------------------------------------------------------------------

setGeneric("annotation", 
    function(object, ...) standardGeneric("annotation"))

setGeneric("annotation<-", 
    function(object, ..., value) standardGeneric("annotation<-"))
