### =========================================================================
### The type() getter and setter
### -------------------------------------------------------------------------
###


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Getter
###

setGeneric("type", function(x) standardGeneric("type"))

setMethod("type", "vector", function(x) typeof(x))

setMethod("type", "array", function(x) typeof(x))

setMethod("type", "factor", function(x) "character")

### Works on a data.frame object for which as.vector() can be applied to
### all its columns.
### Additionally, note that .get_data_frame_type() would also work
### out-of-the-box on any data-frame-like object granted that the object
### supports x[0L, , drop=FALSE]. This includes DataFrame, data.table,
### and tibble (tbl_df) objects. However this is not how the type() method
### for DataFrame objects is implemented. See the S4Arrays package (where
### this method is implemented) for the details.
.get_data_frame_type <- function(x)
{
    if (ncol(x) == 0L)
        return("logical")
    x0 <- x[0L, , drop=FALSE]
    ## Apply as.vector() on each column to turn them into ordinary vectors.
    ## In particular this will turn columns that are factors into character
    ## vectors, and columns that are Rle objects into atomic vectors of the
    ## corresponding types.
    ## Note that as.vector() is not guaranteed to work on all columns. For
    ## example 'x' could be a data.frame or DataFrame object where some
    ## columns are S4 objects that don't support as.vector(), in which
    ## case 'type(x)' will fail.
    x0 <- lapply(x0, as.vector)
    type(unlist(x0, recursive=FALSE, use.names=FALSE))
}

setMethod("type", "data.frame", .get_data_frame_type)


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Setter
###

setGeneric("type<-", signature="x",
    function(x, value) standardGeneric("type<-")
)

setReplaceMethod("type", "vector",
    function(x, value) `storage.mode<-`(x, value=value)
)

setReplaceMethod("type", "array",
    function(x, value) `storage.mode<-`(x, value=value)
)

