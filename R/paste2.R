### =========================================================================
### The paste2() generic and add_prefix()/add_suffix() wrappers
### -------------------------------------------------------------------------
###


### A binary paste0() that behaves like the arithmetic binary operations
### (+, *, etc...) in terms of:
###   1. recycling;
###   2. propagation of NAs;
###   3. propagation of names;
###   4. propagation of dimensions and dimnames.
### Recycling: The longer argument wins i.e. the shorter argument is
### recycled to the length of the longer with a warning if the length of the
### latter is not a multiple of the length of the former. Exception: if one
### of the two arguments has length 0 then no recycling is performed and a
### zero-length vector is returned.
### Name propagation: The longer argument also wins. If the 2 arguments
### have the same length, then:
### - the names on the first argument are propagated, if any;
### - otherwise the names on the second argument are propagated, if any.
setGeneric("paste2", function(x, y) standardGeneric("paste2"))

.paste2_vector_vector <- function(x, y)
{
    stopifnot(is.character(x), is.character(y))

    x_len <- length(x)
    y_len <- length(y)

    ## Zero-length case.
    if (x_len == 0L) {
        if (y_len == 0L && is.null(names(x)))
            names(x) <- names(y)  # NULL or character(0)
        return(x)
    }
    if (y_len == 0L)
        return(y)

    ## Non zero-length case.
    ans <- paste0(x, y)
    ans[is.na(x) | is.na(y)] <- NA_character_
    if (x_len > y_len) {
        ans_names <- names(x)
    } else if (x_len < y_len) {
        ans_names <- names(y)
    } else {
        ans_names <- names(x)
        if (is.null(ans_names))
            ans_names <- names(y)
    }
    setNames(ans, ans_names)
}

### Returns an array of same dimensions and dimnames as 'x' **except** when
### length(y) == 0 and length(x) != 0.
.paste2_array_vector <- function(x, y, switch=FALSE)
{
    stopifnot(is.array(x), is.character(y))

    x_len <- length(x)
    y_len <- length(y)

    ## Zero-length case.
    if (x_len == 0L) {
        if (storage.mode(x) != "character")
            storage.mode(x) <- "character"
        return(x)
    }
    if (y_len == 0L)
        return(y)  # only case where we don't return an array

    ## Non zero-length case.
    if (y_len > x_len)
        stop("non-array object is longer than array object")
    ans <- if (switch) paste0(y, x) else paste0(x, y)
    ans[is.na(x) | is.na(y)] <- NA_character_
    dim(ans) <- dim(x)
    dimnames(ans) <- dimnames(x)
    ans
}

.paste2_array_array <- function(x, y)
{
    stopifnot(is.array(x), is.array(y))

    x_dim <- dim(x)
    y_dim <- dim(y)
    if (!(length(x_dim) == length(y_dim) && all(x_dim == y_dim)))
        stop("non-conformable arrays")

    x_len <- length(x)  # same as length(y)

    ## Zero-length case.
    if (x_len == 0L) {
        if (storage.mode(x) != "character")
            storage.mode(x) <- "character"
        if (is.null(dimnames(x)))
            dimnames(x) <- dimnames(y)
        return(x)
    }

    ## Non zero-length case.
    ans <- paste0(x, y)
    ans[is.na(x) | is.na(y)] <- NA_character_
    dim(ans) <- x_dim
    ans_dimnames <- dimnames(x)
    if (is.null(ans_dimnames))
        ans_dimnames <- dimnames(y)
    dimnames(ans) <- ans_dimnames
    ans
}

setMethod("paste2", c("ANY", "ANY"),
    function(x, y)
    {
        ## Turn both arguments into character vectors.
        if (!is.character(x))
            x <- setNames(as.character(x), names(x))
        if (!is.character(y))
            y <- setNames(as.character(y), names(y))
        .paste2_vector_vector(x, y)
    }
)

setMethod("paste2", c("array", "ANY"),
    function(x, y)
    {
        if (!is.character(y))
            y <- setNames(as.character(y), names(y))
        .paste2_array_vector(x, y)
    }
)

setMethod("paste2", c("ANY", "array"),
    function(x, y)
    {
        if (!is.character(x))
            x <- setNames(as.character(x), names(x))
        .paste2_array_vector(y, x, switch=TRUE)
    }
)

setMethod("paste2", c("array", "array"),
    function(x, y) .paste2_array_array(x, y)
)


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### add_prefix(), add_suffix()
###

add_prefix <- function(x, prefix="") paste2(prefix, x)

add_suffix <- function(x, suffix="") paste2(x, suffix)

