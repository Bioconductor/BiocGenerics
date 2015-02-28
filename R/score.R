### =========================================================================
### The score() and `score<-`() generics
### -------------------------------------------------------------------------

setGeneric("score", function(x, ...) standardGeneric("score"))

setGeneric("score<-", signature="x",
    function(x, ..., value) standardGeneric("score<-")
)

