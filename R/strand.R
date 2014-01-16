### =========================================================================
### The strand() and `strand<-`() generics
### -------------------------------------------------------------------------

setGeneric("strand", function(x, ...) standardGeneric("strand"))

setGeneric("strand<-", function(x, ..., value) standardGeneric("strand<-"))

unstrand <- function(x)
{
    strand(x) <- "*"
    x
}

