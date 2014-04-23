### =========================================================================
### The rownames() and colnames() generics
### -------------------------------------------------------------------------
###

### Dispatch on the 1st arg (the 'x' arg) only!
setGeneric("rownames", signature="x")

setGeneric("rownames<-")

### Dispatch on the 1st arg (the 'x' arg) only!
setGeneric("colnames", signature="x")

setGeneric("colnames<-")

