### =========================================================================
### The rownames() and colnames() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on 'do.NULL' and 'prefix'. Here we set
### dispatch on the 1st arg (the 'x' arg) only!

setGeneric("rownames", signature="x")

setGeneric("colnames", signature="x")

