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

setGeneric("invertStrand", function(x) standardGeneric("invertStrand"))

setMethod("invertStrand", "ANY",
    function(x)
    {
        strand(x) <- invertStrand(strand(x))
        x
    }
)

