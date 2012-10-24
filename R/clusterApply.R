### =========================================================================
### The clusterApply() and related generics
### -------------------------------------------------------------------------

### The corresponding functions are ordinary functions defined in the
### parallel package.

setGeneric("clusterCall", signature="cl")

setGeneric("clusterApply", signature=c("cl", "x"))

setGeneric("clusterApplyLB", signature=c("cl", "x"))

setGeneric("clusterEvalQ", signature="cl")

setGeneric("clusterExport", signature="cl")

setGeneric("clusterMap", signature="cl")

setGeneric("clusterSplit")  # dispatch on all arguments ('cl' and 'seq')

setGeneric("parLapply", signature=c("cl", "X"))

setGeneric("parSapply", signature=c("cl", "X"))

setGeneric("parApply", signature=c("cl", "X"))

setGeneric("parRapply", signature=c("cl", "x"))

setGeneric("parCapply", signature=c("cl", "x"))

setGeneric("parLapplyLB", signature=c("cl", "X"))

setGeneric("parSapplyLB", signature=c("cl", "X"))

