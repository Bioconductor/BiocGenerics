### =========================================================================
### Miscellaneous low-level utils
### -------------------------------------------------------------------------
###

### Like toString() but also injects names(x) in the returned string.
### For example with:
###   x <- alist(b = 99, 98:96, zz)
### to_string(x) returns:
###   "b = 99, 98:96, zz"
to_string <- function(x)
{
    x_names <- names(x)
    x <- as.character(x)
    if (!is.null(x_names)) {
        x_names <- paste0(x_names, ifelse(x_names == "", "", " = "))
        x <- paste0(x_names, x)
    }
    paste(x, collapse=", ")
}

unused_arguments_msg <- function(dots)
{
    msg <- "unused argument"
    if (length(dots) >= 2L)
        msg <- c(msg, "s")
    c(msg, " (", to_string(dots), ")")
}

