### =========================================================================
### The union(), intersect() and setdiff() generics
### -------------------------------------------------------------------------
###
### We add the '...' arg to the generics.

setGeneric("union",
    function(x, y, ...) standardGeneric("union"),
    useAsDefault = function(x, y, ...) base::union(x, y)
)

setGeneric("intersect",
    function(x, y, ...) standardGeneric("intersect"),
    useAsDefault = function(x, y, ...) base::intersect(x, y)
)

setGeneric("setdiff",
    function(x, y, ...) standardGeneric("setdiff"),
    useAsDefault = function(x, y, ...) base::setdiff(x,y)
)

