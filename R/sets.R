### =========================================================================
### The union(), intersect() and setdiff() generics
### -------------------------------------------------------------------------
###
### The default methods (defined in the base package) only take 2 arguments.
### We add the ... argument to the generic functions defined here so they can
### be called with an arbitrary number of effective arguments. See the \note
### section in ?BiocGenerics::union for the motivations.

.union.useAsDefault <- function(x, y, ...) base::union(x, y, ...)
.intersect.useAsDefault <- function(x, y, ...) base::intersect(x, y, ...)
.setdiff.useAsDefault <- function(x, y, ...) base::setdiff(x, y, ...)

setGeneric("union",
    function(x, y, ...) standardGeneric("union"),
    useAsDefault=.union.useAsDefault
)

setGeneric("intersect",
    function(x, y, ...) standardGeneric("intersect"),
    useAsDefault=.intersect.useAsDefault

)

setGeneric("setdiff",
    function(x, y, ...) standardGeneric("setdiff"),
    useAsDefault=.setdiff.useAsDefault
)

