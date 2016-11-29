### =========================================================================
### The var() and sd() generics
### -------------------------------------------------------------------------
###
### Dispatches only on 'x' (and 'y' for var)
###

setGeneric("var", signature=c("x", "y"))

setGeneric("sd", signature="x")
