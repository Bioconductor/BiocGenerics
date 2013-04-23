### =========================================================================
### The append() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on ('x', 'values', 'after'). Here we set
### dispatch on the first two args (the 'x' and 'values' args) only!

setGeneric("append", signature=c("x", "values"))

