setGeneric("plotMA", function(object, ...) {
    standardGeneric("plotMA")
})

setMethod("plotMA", signature="ANY", 
  definition = function(object, ...) {
     msg = sprintf("Error from the generic function 'plotMA' defined in package 'BiocGenerics': no S4 method definition for argument '%s' of class '%s' was found. Did you perhaps mean calling the function 'plotMA' from another package, e.g. 'limma'? In that case, please use the syntax 'limma::plotMA'.",
         deparse(substitute(object)), class(object))
     stop(msg)
 })
