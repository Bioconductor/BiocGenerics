### =========================================================================
### The xtabs() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "stats" would dispatch on all its arguments. Here we set dispatch
### on the 2nd arg (the 'data' arg) only!

setGeneric("xtabs", signature="data")

