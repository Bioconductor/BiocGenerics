### =========================================================================
### The format() generic
### -------------------------------------------------------------------------
###
### Note that base::format is an S3 generic.

setGeneric("format")

### The base package doesn't define a specific format() method for list
### objects and format.default() does a poor job on a list:
###
###   > format(list(1:10))
###   [1] "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
###   > library(IRanges)
###   > format(list(IRanges(1, 8:9)))
###   Error in h(simpleError(msg, call)) :
###     error in evaluating the argument 'obj' in selecting a method for
###     function 'unname': IRanges objects don't support [[, as.list(),
###     lapply(), or unlist() at the moment
###
### OTOH format.AsIs() does a good job with lists:
###
###   > format.AsIs(list(1:10))
###   [1] "1, 2, 3,...."
###   > format.AsIs(list(IRanges(1, 8:9)))
###   [1] "1-8, 1-9"
###
### So we define a format() **S3** method for list objects that does that.
format.list <- base::format.AsIs

