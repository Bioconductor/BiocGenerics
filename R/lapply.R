### =========================================================================
### The lapply() and sapply() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all their arguments. Here we set
### dispatch on the 1st arg (the 'X' arg) only!

setGeneric("lapply", signature="X",
    function(X, FUN, ...) standardGeneric("lapply")
)

setGeneric("sapply", signature="X",
    function(X, FUN, ..., simplify=TRUE, USE.NAMES=TRUE)
        standardGeneric("sapply")
)

