### =========================================================================
### The start(), end(), width(), and pos() generic getters and setters
### -------------------------------------------------------------------------
###
### stats::start and stats::end are S3 generics.
###

setGeneric("start")

setGeneric("start<-", signature="x",
    function(x, ..., value) standardGeneric("start<-")
)

setGeneric("end")

setGeneric("end<-", signature="x",
    function(x, ..., value) standardGeneric("end<-")
)

setGeneric("width", function(x) standardGeneric("width"))

setGeneric("width<-", signature="x",
    function(x, ..., value) standardGeneric("width<-")
)

### No pos() setter for now.
setGeneric("pos", function(x) standardGeneric("pos"))

