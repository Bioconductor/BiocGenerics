### =========================================================================
### The sort() generic
### -------------------------------------------------------------------------
###
### Note that base::sort is an S3 generic.
###
### Need to explicitly define this generic otherwise the implicit generic
### in package "base" would dispatch on ('x', 'decreasing'). Here we set
### dispatch on the 1st arg (the 'x' arg) only!

setGeneric("sort", signature="x")

