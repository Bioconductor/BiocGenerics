### =========================================================================
### The unique() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on ('x', 'incomparables'). Here we set
### dispatch on the 1st arg (the 'x' arg) only!

setGeneric("unique", signature="x")

