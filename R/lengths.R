### =========================================================================
### The lengths() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on all its arguments. Here we set dispatch
### on the first arg ('x') only.

setGeneric("lengths", signature="x")

