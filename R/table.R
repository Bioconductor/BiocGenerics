### =========================================================================
### The table() generic
### -------------------------------------------------------------------------

setGeneric("table", signature="...",
    function(..., exclude = if (useNA == "no") c(NA, NaN),
                  useNA = c("no", "ifany", "always"),
                  dnn = list.names(...),
                  deparse.level = 1)
        standardGeneric("table")
)

