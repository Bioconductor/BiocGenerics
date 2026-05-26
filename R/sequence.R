### =========================================================================
### The sequence() generic
### -------------------------------------------------------------------------
###
### Note that base::sequence is an S3 generic.
###
### Only reason we define this S4 generic is to replace base::sequence's
### first argument 'nvec' with 'x'. This allows the SpatialData package,
### and possibly other packages, to define sequence() methods with a more
### conventional first argument. So yeah, it's just cosmetics! Is this a
### good enough reason for all this? Not sure about that...

.default_sequence <- function(x, ...) base::sequence(x, ...)

setGeneric("sequence",
    function(x, ...) standardGeneric("sequence"),
    useAsDefault=.default_sequence
)

