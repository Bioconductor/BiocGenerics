### =========================================================================
### The combine() generic
### -------------------------------------------------------------------------
###
### A "combine" default method + methods for some standard types are
### also provided.
###

setGeneric("combine",
    function(x, y, ...)
    {
        if (length(list(...)) > 0L) {
            callGeneric(x, do.call(callGeneric, list(y, ...)))
        } else {
            standardGeneric("combine")
        }
    }
)

setMethod("combine", c("ANY", "missing"), function(x, y, ...) x)

setMethod("combine", c("data.frame", "data.frame"),
    function(x, y, ...)
    {
        if (all(dim(x) == 0L) && all(dim(y) == 0L))
                return(x)
        else if (all(dim(x) == 0L)) return(y)
        else if (all(dim(y) == 0L)) return(x)

        uniqueRows <- unique(c(row.names(x), row.names(y)))
        uniqueCols <- unique(c(names(x), names(y)))
        sharedCols <- intersect(names(x), names(y))

        ## check possible to combine
        alleq <- function(x, y) {
            res <- all.equal(x, y, check.attributes=FALSE)
            if (!is.logical(res)) {
                warning(res)
                FALSE
            } else TRUE
        }
        sharedRows <- intersect(row.names(x), row.names(y))
        ok <- sapply(sharedCols,
            function(nm) {
                if (!all(class(x[[nm]]) == class(y[[nm]])))
                    return(FALSE)
                switch(class(x[[nm]])[[1L]],
                       factor={
                           if (!alleq(levels(x[[nm]]), levels(y[[nm]]))) {
                               warning("data frame column '", nm,
                                       "' levels not all.equal",
                                       call.=FALSE)
                               TRUE
                           } else if (!alleq(x[sharedRows, nm, drop=FALSE],
                                             y[sharedRows, nm, drop=FALSE])) {
                               warning("data frame column '", nm,
                                       "' shared rows not all equal",
                                       call.=FALSE)
                               FALSE
                           } else TRUE
                       },
                       ## ordered and non-factor columns need to
                       ## satisfy the following identity; it seems
                       ## possible that ordered could be treated
                       ## differently, but these have not been
                       ## encountered.
                       ordered=,
                       if (!alleq(x[sharedRows, nm, drop=FALSE],
                                  y[sharedRows, nm, drop=FALSE])) {
                           warning("data frame column '", nm,
                                   "' shared rows not all equal")
                           FALSE
                       } else TRUE)
              })
        if (!all(ok))
            stop("data.frames contain conflicting data:",
                 "\n\tnon-conforming colname(s): ",
                 paste(sharedCols[!ok], collapse=", "))

        ## x or y with zero rows -- make palatable to merge, but drop
        ## before return
        if (length(uniqueRows) == 0L) {
            x <- x["tmp",,drop=FALSE]
            y <- y["tmp",,drop=FALSE]
        } else if (nrow(x) == 0L) {
            x <- x[row.names(y),,drop=FALSE]
            row.names(x) <- row.names(y)
        } else if (nrow(y) == 0L) {
            y <- y[row.names(x),,drop=FALSE]
            row.names(y) <- row.names(x)
        }

        ## make colnames of merged data robust
        if (length(uniqueCols) > 0L)
            extLength <- max(nchar(sub(".*\\.", "", uniqueCols))) + 1L
        else extLength <- 1L
        extX <- paste(c(".", rep("x", extLength)), collapse="")
        extY <- paste(c(".", rep("y", extLength)), collapse="")
        z <- merge(x, y, by="row.names", all=TRUE, suffixes=c(extX, extY))

        ## shared cols
        for (nm in sharedCols) {
            nmx <- paste(nm, extX, sep="")
            nmy <- paste(nm, extY, sep="")
            z[[nm]] <-
              switch(class(z[[nmx]])[[1]],
                     AsIs=I(ifelse(is.na(z[[nmx]]), z[[nmy]], z[[nmx]])),
                     factor={
                         col <- ifelse(is.na(z[[nmx]]),
                                       as.character(z[[nmy]]),
                                       as.character(z[[nmx]]))
                         if (!identical(levels(z[[nmx]]), levels(z[[nmy]])))
                             factor(col)
                         else
                             factor(col, levels=levels(z[[nmx]]))
                     },
                     {
                         col <- ifelse(is.na(z[[nmx]]), z[[nmy]], z[[nmx]])
                         class(col) <- class(z[[nmx]])
                         col
                     })
        }

        ## tidy
        row.names(z) <- if (is.integer(attr(x, "row.names")) &&
                            is.integer(attr(y, "row.names")))
                            as.integer(z$Row.names)
                        else
                            z$Row.names
        z$Row.names <- NULL
        z[uniqueRows, uniqueCols, drop=FALSE]
    }
)

setMethod("combine", c("matrix", "matrix"),
    function(x, y, ...)
    {
        if (length(y) == 0L)
            return(x)
        else if (length(x) == 0L)
            return(y)
        if (mode(x) != mode(y))
            stop("matrix modes ", mode(x), ", ", mode(y), " differ")
        if (typeof(x) != typeof(y))
            warning("matrix typeof ", typeof(x), ", ", typeof(y), " differ")
        xdim <- dimnames(x)
        ydim <- dimnames(y)
        if (is.null(xdim) || is.null(ydim) ||
            any(sapply(xdim, is.null)) ||
            any(sapply(ydim, is.null)))
            stop("matricies must have dimnames for 'combine'")
        sharedRows <- intersect(xdim[[1L]], ydim[[1L]])
        sharedCols <- intersect(xdim[[2L]], ydim[[2L]])
        ok <- all.equal(x[sharedRows, sharedCols], y[sharedRows, sharedCols])
        if (!isTRUE(ok))
            stop("matrix shared row and column elements differ: ", ok)
        unionRows <- union(xdim[[1L]], ydim[[1L]])
        unionCols <- union(xdim[[2L]], ydim[[2L]])

        m <- matrix(new(class(as.vector(x))),
                    nrow=length(unionRows), ncol=length(unionCols),
                    dimnames=list(unionRows, unionCols))
        m[rownames(x), colnames(x)] <- x
        m[rownames(y), colnames(y)] <- y
        m
    }
)

