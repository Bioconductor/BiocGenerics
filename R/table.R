### =========================================================================
### The table() generic
### -------------------------------------------------------------------------

### base::table() has a broken signature (list.names() is a function
### defined *inside* the body of base::table() so the default value for the
### 'dnn' arg is an expression that cannot be evaluated *outside* the
### base::table environment, this is poor design), we cannot keep all the
### extra arguments in the table() generic (those extra arguments are ugly
### and nobody uses them anyway).
#setGeneric("table", signature="...",
#    function(..., exclude = if (useNA == "no") c(NA, NaN),
#                  useNA = c("no", "ifany", "always"),
#                  dnn = list.names(...),
#                  deparse.level = 1)
#        standardGeneric("table")
#)

### So we use this instead.
setGeneric("table", signature="...",
    function(...) standardGeneric("table"),
    useAsDefault = function(...) base::table(...)
)

