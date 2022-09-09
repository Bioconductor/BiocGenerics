### =========================================================================
### The aperm() generic
### -------------------------------------------------------------------------
###
### Note that base::aperm is an S3 generic.
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on ('a', 'perm'). Here we set dispatch on
### the 1st arg (the 'a' arg) only!

setGeneric("aperm", signature="a")

