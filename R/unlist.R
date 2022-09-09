### =========================================================================
### The unlist() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on all its arguments. Here we set dispatch
### on the 1st arg (the 'x' arg) only!

setGeneric("unlist", signature="x")

