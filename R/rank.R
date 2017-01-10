### =========================================================================
### The rank() generic
### -------------------------------------------------------------------------
###

### base::rank() doesn't have the ellipsis. We add it to the generic
### function defined below so methods can support additional arguments (e.g.
### the 'ignore.strand' argument for the method for GenomicRanges objects).

.is.rank.useAsDefault <- function(x, na.last=TRUE,
    ties.method=c("average", "first", "last", "random", "max", "min"), ...)
{
    base::rank(x, na.last=na.last, ties.method=ties.method, ...)
}

setGeneric("rank", signature="x",
    function(x, na.last=TRUE,
        ties.method=c("average", "first", "last", "random", "max", "min"), ...)
        standardGeneric("rank"),
    useAsDefault=.is.rank.useAsDefault
)

