### =========================================================================
### The detail() generic
### -------------------------------------------------------------------------


setGeneric("detail", function(object) standardGeneric("detail"))

setMethod("detail", "ANY", function(object) show(object))

