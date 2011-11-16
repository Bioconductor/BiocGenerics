### =========================================================================
### The eval() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on all the arguments. Here we set dispatch
### on the first two args (the 'expr' and 'envir' args) only!

setGeneric("eval", signature("expr", "envir"),
    function(expr, envir=parent.frame(),
                   enclos=if (is.list(envir) || is.pairlist(envir))
                          parent.frame() else baseenv())
    {
        force(envir)
        force(enclos)
        standardGeneric("eval")
    }
)

