### =========================================================================
### The grep() and grepl() generics
### -------------------------------------------------------------------------
###
### Need to explicitly define those generics otherwise the implicit generics
### in package "base" would dispatch on all their arguments. Here we set
### dispatch on the first 2 args ('pattern', 'x').

setGeneric("grep",
           function (pattern, x, ignore.case = FALSE, perl = FALSE,
                     value = FALSE, fixed = FALSE, useBytes = FALSE,
                     invert = FALSE) standardGeneric("grep"),
           signature = c("pattern", "x"))

setGeneric("grepl",
           function (pattern, x, ignore.case = FALSE, perl = FALSE,
                     fixed = FALSE, useBytes = FALSE) standardGeneric("grepl"),
           signature = c("pattern", "x"))

