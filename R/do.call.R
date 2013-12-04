### =========================================================================
### The do.call() generic
### -------------------------------------------------------------------------

### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on all its arguments. Here we set dispatch
### on the 1st and 2nd args only!

setGeneric("do.call", signature=c("what", "args"))

