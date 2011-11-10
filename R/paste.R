### =========================================================================
### The paste() generic
### -------------------------------------------------------------------------

setGeneric("paste", signature="...",
    function(..., sep=" ", collapse=NULL) standardGeneric("paste")
)

