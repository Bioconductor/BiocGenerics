### =========================================================================
### The path(), basename(), and dirname() getters/setters
### -------------------------------------------------------------------------
###


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### path() getter and setter
###

setGeneric("path", function(object, ...) standardGeneric("path"))
setGeneric("path<-", signature="object",
    function(object, ..., value) standardGeneric("path<-")
)


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### basename() and dirname() getters and setters
###
### The basename() and dirname() functions defined in the base package
### only take 1 argument. We add the ... argument to the generic functions
### defined here so they can be called with additional arguments.
###

.basename.useAsDefault <- function(path, ...) base::basename(path, ...)
setGeneric("basename",
    function(path, ...) standardGeneric("basename"),
    useAsDefault=.basename.useAsDefault
)
setGeneric("basename<-", signature="path",
    function(path, ..., value) standardGeneric("basename<-")
)

.dirname.useAsDefault <- function(path, ...) base::dirname(path, ...)
setGeneric("dirname",
    function(path, ...) standardGeneric("dirname"),
    useAsDefault=.dirname.useAsDefault
)
setGeneric("dirname<-", signature="path",
    function(path, ..., value) standardGeneric("dirname<-")
)


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Default basename() and dirname() getters
###
### The purpose of these methods is to make the basename() and dirname()
### getters work out-of-the-box on any object for which the path()
### getter works.
###

setMethod("basename", "ANY",
    function(path, ...)
    {
        if (is.object(path)) {
            path <- path(path, ...)
            base::basename(path)
        } else {
            ## We intentionally pass ... to cause failure if additional
            ## arguments were supplied.
            base::basename(path, ...)
        }
    }
)

setMethod("dirname", "ANY",
    function(path, ...)
    {
        if (is.object(path)) {
            path <- path(path, ...)
            base::dirname(path)
        } else {
            ## We intentionally pass ... to cause failure if additional
            ## arguments were supplied.
            base::dirname(path, ...)
        }
    }
)


### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Default basename() and dirname() setters
###
### The purpose of these replacement methods is to make the basename() and
### dirname() setters work out-of-the-box on any object for which the path()
### getter and setter work.
###

setReplaceMethod("basename", "character",
    function(path, ..., value)
    {
        if (length(list(...)) != 0L) {
            dots <- match.call(expand.dots=FALSE)[[3L]]
            stop(unused_arguments_msg(dots))
        }
        path_len <- length(path)
        path <- setNames(file.path(dirname(path), value), names(path))
        if (length(path) != path_len)
            stop("number of supplied basenames is incompatible ",
                 "with number of paths")
        path
    }
)

setReplaceMethod("basename", "ANY",
    function(path, ..., value)
    {
        ppath <- path(path)
        basename(ppath, ...) <- value
        path(path) <- ppath
        path
    }
)

setReplaceMethod("dirname", "character",
    function(path, ..., value)
    {
        if (length(list(...)) != 0L) {
            dots <- match.call(expand.dots=FALSE)[[3L]]
            stop(unused_arguments_msg(dots))
        }
        path_len <- length(path)
        path <- setNames(file.path(value, basename(path)), names(path))
        if (length(path) != path_len)
            stop("number of supplied dirnames is incompatible ",
                 "with number of paths")
        path
    }
)

setReplaceMethod("dirname", "ANY",
    function(path, ..., value)
    {
        ppath <- path(path)
        dirname(ppath, ...) <- value
        path(path) <- ppath
        path
    }
)

