### =========================================================================
### The as.vector() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on ('x', 'mode'). Here we set dispatch on
### the 1st arg (the 'x' arg) only!

setGeneric("as.vector", signature="x")

