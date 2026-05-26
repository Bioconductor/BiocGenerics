### =========================================================================
### The transform() generic
### -------------------------------------------------------------------------
###
### Note that base::transform is an S3 generic.
###
### Only reason we define this S4 generic is to replace base::transform's
### first argument 'nvec' with 'x'. This allows the SpatialData package,
### and possibly other packages, to define transform() methods with a more
### conventional first argument. So yeah, it's just cosmetics! Is this a
### good enough reason for all this? Not sure about that...

.default_transform <- function(x, ...) base::transform(x, ...)

setGeneric("transform",
    function(x, ...) standardGeneric("transform"),
    useAsDefault=.default_transform
)

