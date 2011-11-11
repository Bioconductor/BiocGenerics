### =========================================================================
### The rep() and rep.int() generics
### -------------------------------------------------------------------------

### Actually, rep() seems to be already a generic function (that's what the
### man page claims) but the reality is confusing. On a fresh R session (this
### is with R-2.14.0):
###
###   > isGeneric("rep")
###   [1] FALSE
###   > showMethods("rep")
###   Function: rep (package base)
###
###   > isGeneric("rep")
###   [1] TRUE
###
### Also trying to make it a generic "again" fails:
###
###   > setGeneric("rep", function(x, ...) standardGeneric("rep"))
###   Error in setGeneric("rep", function(x, ...) standardGeneric("rep")) :
###      ‘rep’ is a primitive function;  methods can be defined, but the
###   generic function is implicit, and cannot be changed.
###
#setGeneric("rep", function(x, ...) standardGeneric("rep"))

### A more natural (and cleaner) thing to do for this generic would be to
### use the same arguments as base::rep.int() (i.e. 'x', 'times') but then
### 'R CMD check' would get confused and think that we are trying to define
### an S3 method for base::rep() and would complain (observed with R <=
### 2.12):
###
###   * checking S3 generic/method consistency ... WARNING
###   rep:
###     function(x, ...)
###   rep.int:
###     function(x, times)
###
### so we use the arguments of base::rep() (i.e. 'x', '...') just to make
### 'R CMD check' happy :-) ... Kind of an ugly hack though :-(
setGeneric("rep.int",
    function(x, ...) standardGeneric("rep.int"),
    useAsDefault = function(x, ...) base::rep.int(x, ...)
)

