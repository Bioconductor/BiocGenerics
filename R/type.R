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

### Works on any data-frame-like object for which:
### - A zero-row object can be extracted via the single-bracket operator (see
###   below). This includes DataFrame, data.table, and tibble (tbl_df) objects.
### - as.vector() works on all columns.
### Note however that the type() method for DataFrame objects (which is
### defined in the S4Arrays package) does not call .get_data_frame_type()
### directly on the object. See the S4Arrays package for the details.
.get_data_frame_type <- function(x)
{
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

