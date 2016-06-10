### =========================================================================
### The which(), which.max() and which.min() generics
### -------------------------------------------------------------------------
###
### The default methods (defined in the base package) only take a
### fixed set of arguments.  We add the ... argument to the generic
### functions defined here so they can be called with an arbitrary
### number of effective arguments. This was motivated by the desire to
### optionally return global subscripts from methods on List.

### These generics are slated to be internalized in base R. When that
### happens, these calls will effectively be no-ops.

.which.useAsDefault <- function(x, arr.ind = FALSE, useNames = TRUE, ...)
    base::which(x, arr.ind, useNames, ...)
.which.max.useAsDefault <- function(x, ...) base::which.max(x, ...)
.which.min.useAsDefault <- function(x, ...) base::which.min(x, ...)

setGeneric("which",
           function(x, arr.ind = FALSE, useNames = TRUE, ...)
               standardGeneric("which"),
           useAsDefault=.which.useAsDefault,
           signature="x"
           )

setGeneric("which.max",
           function(x, ...) standardGeneric("which.max"),
           useAsDefault=.which.max.useAsDefault
           )

setGeneric("which.min",
           function(x, ...) standardGeneric("which.min"),
           useAsDefault=.which.min.useAsDefault
           )

