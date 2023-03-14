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

### NOT exported but used in S4Arrays.
### Return a list with one list element per column in data frame 'x', with
### the exception that a length-1 list is returned when 'x' has zero column.
### All the list elements in the returned list are guaranteed to be ordinary
### vectors (atomic or list) of length 0.
### Note that:
### - extract_data_frame_slice0() works on a data.frame object only if
###   as.vector() can be applied to all its columns.
### - Additionally, extract_data_frame_slice0() would also work out-of-the-box
###   on any data-frame-like object granted that the object supports
###   x[0L, , drop=FALSE]. This includes DataFrame, data.table, and
###   tibble (tbl_df) objects.
extract_data_frame_slice0 <- function(x)
{
    if (ncol(x) == 0L)
        return(list(logical(0)))
    x0 <- x[0L, , drop=FALSE]
    ## Apply as.vector() on each column to turn them into ordinary vectors.
    ## In particular this will turn columns that are factors into character
    ## vectors, and columns that are Rle objects into atomic vectors of the
    ## corresponding types.
    ## Note that as.vector() is not guaranteed to work on all columns. For
    ## example 'x' could be a data.frame or DataFrame object where some
    ## columns are S4 objects that don't support as.vector(), in which
    ## case 'type(x)' will fail.
    lapply(x0, as.vector)
}

.get_data_frame_type <- function(x)
{
    slice0 <- extract_data_frame_slice0(x)
    type(unlist(slice0, recursive=FALSE, use.names=FALSE))
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

