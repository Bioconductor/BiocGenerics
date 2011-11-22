### =========================================================================
### The mapply() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on all its arguments. Here we set dispatch
### on the 2nd arg (the '...' arg) only!
###
### Note that dispatching on '...' is supported starting with R 2.8.0 only.

setGeneric("mapply", signature="...")

