### =========================================================================
### Utility functions for checking/fixing user-supplied arguments
### -------------------------------------------------------------------------

### NOTE: The stuff in this file (not exported) is a copy/paste of some of
### the functions in S4Vectors but it doesn't really belong to BiocGenerics.
### It seems that the only reason for having it duplicated here is that it's
### used by the stuff in the update-utils.R file. However the stuff in
### update-utils.R doesn't really belong to BiocGenerics either!
###
### TODO: This stuff would need to be moved to a more appropriate place (when
### we have one), and then we should get rid of the duplication between the
### functions below and the same functions in S4Vectors.

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
