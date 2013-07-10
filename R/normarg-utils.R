### =========================================================================
### Utility functions for checking/fixing user-supplied arguments
### -------------------------------------------------------------------------

### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### For checking only.
###

isTRUEorFALSE <- function(x)
{
  is.logical(x) && length(x) == 1L && !is.na(x)
}

### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Handling variadic calls
###

extraArgsAsList <- function(.valid.argnames, ...)
{
  args <- list(...)
  argnames <- names(args)
  if (length(args) != 0L
      && (is.null(argnames) || any(argnames %in% c("", NA))))
    stop("all extra arguments must be named")
  if (!is.null(.valid.argnames) && !all(argnames %in% .valid.argnames))
    stop("valid extra argument names are ",
         paste("'", .valid.argnames, "'", sep="", collapse=", "))
  if (anyDuplicated(argnames))
    stop("argument names must be unique")
  args
}
