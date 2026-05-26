### =========================================================================
### The scale() generic
### -------------------------------------------------------------------------
###
### Note that base::scale is an S3 generic.
###
### We choose the most accomodating interface (the scale(x, ...) interface)
### for the S4 generic so that the SpatialData package, and possibly other
### packages, can define scale() getters for their objects.

.default_scale <- function(x, ...) base::scale(x, ...)

setGeneric("scale",
    function(x, ...) standardGeneric("scale"),
    useAsDefault=.default_scale
)

