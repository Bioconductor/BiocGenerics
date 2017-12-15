\name{path}

\alias{path}
\alias{path<-}

\alias{basename}
\alias{basename<-}

\alias{dirname}
\alias{dirname<-}

\alias{basename,ANY-method}
\alias{dirname,ANY-method}

\alias{basename<-,character-method}
\alias{basename<-,ANY-method}
\alias{dirname<-,character-method}
\alias{dirname<-,ANY-method}

\title{Accessing the path of an object}

\description{
  Get or set the path of an object.
}

\usage{
path(object, ...)
path(object, ...) <- value

basename(path, ...)
basename(path, ...) <- value

dirname(path, ...)
dirname(path, ...) <- value

## The purpose of the following methods is to make the basename() and
## dirname() getters work out-of-the-box on any object for which the
## path() getter works.

\S4method{basename}{ANY}(path, ...)

\S4method{dirname}{ANY}(path, ...)

## The purpose of the following replacement methods is to make the
## basename() and dirname() setters work out-of-the-box on any object
## for which the path() getter and setter work.

\S4method{basename}{character}(path, ...) <- value

\S4method{basename}{ANY}(path, ...) <- value

\S4method{dirname}{character}(path, ...) <- value

\S4method{dirname}{ANY}(path, ...) <- value
}

\arguments{
  \item{object}{
    An object containing paths. Even though it will typically contain
    a single path, \code{object} can actually contain an arbitrary
    number of paths.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
  \item{value}{
    For \code{path<-}, the paths to set on \code{object}.

    For \code{basename<-} or \code{dirname<-}, the basenames or dirnames
    to set on \code{path}.
  }
  \item{path}{
    A character vector \emph{or an object containing paths}.
  }
}

\value{
  A character vector for \code{path(object)}, \code{basename(path)},
  and \code{dirname(path)}. Typically of length 1 but not necessarily.
  Possibly with names on it for \code{path(object)}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{basename}} for the functions the
          \code{basename} and \code{dirname} generics are based on.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[Rsamtools]{path,RsamtoolsFile-method} in the
          \pkg{Rsamtools} package for an example of a specific
          \code{path} method (defined for \link[Rsamtools]{RsamtoolsFile}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
## ---------------------------------------------------------------------
## GENERIC FUNCTIONS AND DEFAULT METHODS
## ---------------------------------------------------------------------

path
showMethods("path")

`path<-`
showMethods("path<-")

basename
showMethods("basename")

`basename<-`
showMethods("basename<-")

dirname
showMethods("dirname")

`dirname`
showMethods("dirname<-")


## Default basename() and dirname() getters:
selectMethod("basename", "ANY")
selectMethod("dirname", "ANY")

## Default basename() and dirname() setters:
selectMethod("basename<-", "character")
selectMethod("basename<-", "ANY")
selectMethod("dirname<-", "character")
selectMethod("dirname<-", "ANY")

## ---------------------------------------------------------------------
## OBJECTS CONTAINING PATHS
## ---------------------------------------------------------------------

## Let's define a simple class to represent objects that contain paths:
setClass("A", slots=c(stuff="ANY", path="character"))

a <- new("A", stuff=runif(5),
              path=c(one="path/to/file1", two="path/to/file2"))

## path() getter:
setMethod("path", "A", function(object) object@path)

path(a)

## Because the path() getter works on 'a', now the basename() and
## dirname() getters also work:
basename(a)
dirname(a)

## path() setter:
setReplaceMethod("path", "A",
    function(object, ..., value)
    {
        if (length(list(...)) != 0L) {
            dots <- match.call(expand.dots=FALSE)[[3L]]
            stop(BiocGenerics:::unused_arguments_msg(dots))
        }
        object@path <- value
        object
    }
)

a <- new("A", stuff=runif(5))
path(a) <- c(one="path/to/file1", two="path/to/file2")
path(a)

## Because the path() getter and setter work on 'a', now the basename()
## and dirname() setters also work:
basename(a) <- toupper(basename(a))
path(a)
dirname(a) <- "~/MyDataFiles"
path(a)
}

\keyword{methods}
