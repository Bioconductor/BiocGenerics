### =========================================================================
### The xtabs() generic
### -------------------------------------------------------------------------

setGeneric("xtabs", signature="data",
    function(formula=~., data=parent.frame(), subset, sparse=FALSE,
             na.action, exclude=c(NA, NaN), drop.unused.levels=FALSE)
        standardGeneric("xtabs")
)

