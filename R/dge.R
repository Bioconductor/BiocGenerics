# Currently, these are for DESeq and DEXSeq. Could be extended to a more general
#  infrastructure for count datasets.
setGeneric("counts",        function(object, ...)        standardGeneric("counts"))
setGeneric("counts<-",      function(object, ..., value) standardGeneric("counts<-"))
setGeneric("dispTable",     function(object, ...)        standardGeneric("dispTable"))
setGeneric("dispTable<-",   function(object, ..., value) standardGeneric("dispTable<-"))
setGeneric("sizeFactors",   function(object, ...)        standardGeneric("sizeFactors"))
setGeneric("sizeFactors<-", function(object, ..., value) standardGeneric("sizeFactors<-"))

setGeneric("conditions",    function(object, ...)        standardGeneric("conditions"))
setGeneric("conditions<-",  function(object, ..., value) standardGeneric("conditions<-"))
setGeneric("design",        function(object, ...)        standardGeneric("design"))
setGeneric("design<-",      function(object, ..., value) standardGeneric("design<-"))

setGeneric("estimateSizeFactors", function(object, ...) standardGeneric("estimateSizeFactors"))
setGeneric("estimateDispersions", function(object, ...) standardGeneric("estimateDispersions"))
setGeneric("plotDispEsts", function(object, ...) standardGeneric("plotDispEsts"))

