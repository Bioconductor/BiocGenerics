### =========================================================================
### The get() and mget() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all their arguments. Here we set
### dispatch on the first 3 args ('x', 'pos', 'envir') for get(), and on the
### first 2 args ('x', 'envir') for mget().

setGeneric("get", signature=c("x", "pos", "envir"))

setGeneric("mget", signature=c("x", "envir"))

