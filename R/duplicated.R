### =========================================================================
### The duplicated() and anyDuplicated() generics
### -------------------------------------------------------------------------
###
### Note that base::duplicated and base::anyDuplicated are S3 generics.
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on ('x', 'incomparables'). Here we set
### dispatch on the 1st arg (the 'x' arg) only!

setGeneric("duplicated", signature="x")

setGeneric("anyDuplicated", signature="x")

