### =========================================================================
### The mad() generic
### -------------------------------------------------------------------------
###
### Dispatches only on 'x'
###

setGeneric("mad", function(x, center = median(x), constant = 1.4826,
                           na.rm = FALSE, low = FALSE, high = FALSE)
    standardGeneric("mad"), signature="x")
