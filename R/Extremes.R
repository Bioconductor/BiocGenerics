### =========================================================================
### The pmax(), pmin(), pmax.int() and pmin.int() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on 'na.rm'.
###
### Note that dispatching on '...' is supported starting with R 2.8.0 only.

### setGeneric() cannot be used on "max" and "min":
###   > setGeneric("max", signature="...")
###   Error in setGeneric("max", signature = "...") : 
###     ‘max’ is a primitive function;  methods can be defined, but the
###   generic function is implicit, and cannot be changed.
#setGeneric("max", signature="...")
#setGeneric("min", signature="...")

setGeneric("pmax", signature="...")

setGeneric("pmin", signature="...")

setGeneric("pmax.int", signature="...")

setGeneric("pmin.int", signature="...")

