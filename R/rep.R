### =========================================================================
### The rep() and rep.int() generics
### -------------------------------------------------------------------------

### A more natural (and cleaner) thing to do for this generic would be to
### use the same arguments as base::rep.int() (i.e. 'x', 'times') but then
### 'R CMD check' would get confused and think that we are trying to define
### an S3 method for base::rep and would complain (observed with R <= 2.12):
###
###   * checking S3 generic/method consistency ... WARNING
###   rep:
###     function(x, ...)
###   rep.int:
###     function(x, times)
###
### so we use the arguments of base::rep() (i.e. 'x', '...') just to make
### 'R CMD check' happy :-) ... Kind of an ugly/silly hack though :-(

.rep.int.useAsDefault <- function(x, ...) base::rep.int(x, ...)

setGeneric("rep.int",
    function(x, ...) standardGeneric("rep.int"),
    useAsDefault=.rep.int.useAsDefault
)

