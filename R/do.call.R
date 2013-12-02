### =========================================================================
### The do.call() generic
### -------------------------------------------------------------------------

setGeneric("do.call",
           function (what, args, quote = FALSE, envir = parent.frame())
           standardGeneric("do.call"),
           signature = c("what", "args"))

