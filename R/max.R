### =========================================================================
### The pmax(), pmin(), pmax.int() and pmin.int() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on 'na.rm'.
###
### Note that dispatching on '...' is supported starting with R 2.8.0 only.

### setGeneric() cannot be used on "max" and "min":
###   > setGeneric("max", signature="...",
###   +     function (..., na.rm=FALSE) standardGeneric("max")
###   + )
###   Error in setGeneric("max", signature = "...",
###   function(..., na.rm = FALSE) standardGeneric("max")) : 
###     ‘max’ is a primitive function;  methods can be defined, but the
###   generic function is implicit, and cannot be changed.
#setGeneric("max", signature="...",
#    function (..., na.rm=FALSE) standardGeneric("max")
#)
#setGeneric("min", signature="...",
#    function (..., na.rm=FALSE) standardGeneric("min")
#)

setGeneric("pmax", signature="...",
    function (..., na.rm=FALSE) standardGeneric("pmax")
)

setGeneric("pmin", signature="...",
    function (..., na.rm=FALSE) standardGeneric("pmin")
)

setGeneric("pmax.int", signature="...",
    function (..., na.rm=FALSE) standardGeneric("pmax.int")
)

setGeneric("pmin.int", signature="...",
    function (..., na.rm=FALSE) standardGeneric("pmin.int")
)

