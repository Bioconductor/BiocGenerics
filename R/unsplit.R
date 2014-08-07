### =========================================================================
### The unsplit() generic
### -------------------------------------------------------------------------
###
### unsplit should not dispatch on 'drop'

setGeneric("unsplit",
           function (value, f, drop = FALSE) standardGeneric("unsplit"),
           signature=c("value", "f"))

