### =========================================================================
### The detail() generic
### -------------------------------------------------------------------------


setGeneric("detail", function(object, ...) standardGeneric("detail"))

### Passing extra arguments should trigger an error. We don't want them to be
### silently ignored. Passing them to show() achieves that.
setMethod("detail", "ANY", function(object, ...) show(object, ...))

