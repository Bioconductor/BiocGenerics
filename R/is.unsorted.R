### =========================================================================
### The is.unsorted() generic
### -------------------------------------------------------------------------

### base::is.unsorted() doesn't have the ellipsis. We add it to the generic
### function defined below so methods can support additional arguments (e.g.
### the 'ignore.strand' argument for the method for GenomicRanges objects).

.is.unsorted.useAsDefault <- function(x, na.rm=FALSE, strictly=FALSE, ...)
    base::is.unsorted(x, na.rm=na.rm, strictly=strictly, ...)

setGeneric("is.unsorted", signature="x",
    function(x, na.rm=FALSE, strictly=FALSE, ...)
        standardGeneric("is.unsorted"),
    useAsDefault=.is.unsorted.useAsDefault
)

