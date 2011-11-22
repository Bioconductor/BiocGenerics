### =========================================================================
### The Reduce(), Filter(), Find(), Map() and Position() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all their arguments. Here we set
### dispatch on the 2nd arg (the 'x' or '...' arg) only!

setGeneric("Reduce", signature="x")

setGeneric("Filter", signature="x")

setGeneric("Find", signature="x")

### Note that dispatching on '...' is supported starting with R 2.8.0 only.
setGeneric("Map", signature="...")

setGeneric("Position", signature="x")

