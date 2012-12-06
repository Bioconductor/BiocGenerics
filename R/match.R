### =========================================================================
### The match() generic
### -------------------------------------------------------------------------
###
### base::match() doesn't have the ... argument. We add it to the generic
### function defined here. We also set dispatch on the first two args (the
### 'x' and 'table' args) only!

.match.useAsDefault <-
    function(x, table, nomatch=NA_integer_, incomparables=NULL, ...)
        base::match(x, table, nomatch=nomatch, incomparables=incomparables, ...)

setGeneric("match", signature=c("x", "table"),
    function(x, table, nomatch=NA_integer_, incomparables=NULL, ...)
        standardGeneric("match"),
    useAsDefault=.match.useAsDefault
)

