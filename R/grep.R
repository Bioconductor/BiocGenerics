### =========================================================================
### The grep() and grepl() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all their arguments. Here we set
### dispatch on the first 2 args ('pattern', 'x').

setGeneric("grep", signature = c("pattern", "x"))

setGeneric("grepl", signature = c("pattern", "x"))
