\name{type}

\alias{type}
\alias{type,vector-method}
\alias{type,array-method}
\alias{type,factor-method}
\alias{type,data.frame-method}

\alias{type<-}
\alias{type<-,vector-method}
\alias{type<-,array-method}

\title{Accessing the type of an object}

\description{
  Get or set the \emph{type} of an object.

  Note that \code{type} and \code{type<-} are defined as \emph{S4 generic
  functions} and what \emph{type} means exactly (and what \code{type()}
  returns) depends on the objects for which the \code{type} and/or
  \code{type<-} methods are defined.
}

\usage{
type(x)
type(x) <- value

## Methods defined in the BiocGenerics package:

\S4method{type}{vector}(x)
\S4method{type}{array}(x)
\S4method{type}{factor}(x)  # returns "character"
\S4method{type}{data.frame}(x)

\S4method{type}{vector}(x) <- value
\S4method{type}{array}(x) <- value
}

\arguments{
  \item{x}{
    Any object for which the \code{type()} getter or setter is defined.
    Note that objects will either: not support the getter or setter at all,
    or support only the getter, or support both the getter and setter.
  }
  \item{value}{
    The type to set on \code{x} (assuming \code{x} supports the \code{type()}
    setter). \code{value} is typically (but not necessarily) expected to be
    a single string (i.e. a character vector of length 1).
  }
}

\details{
  On an ordinary vector, matrix, or array \code{x}, \code{type(x)} returns
  \code{typeof(x)}.

  On a data frame \code{x} where all the columns are ordinary vectors
  or factors, \code{type(x)} is \emph{semantically equivalent} to
  \code{typeof(as.matrix(x))}. However, the actual implementation is
  careful to avoid turning the full data frame \code{x} into a matrix,
  as this would tend to be very inefficient in general.

  Note that for a matrix-like or array-like object, \code{type(x)}
  returns the type of the \emph{elements} in the object.
  See \code{?S4Arrays::\link[S4Arrays]{type}} for more information.
}

\value{
  \code{type(x)} is expected to return the type of \code{x} as a single
  string i.e. as a character vector of length 1.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{type,ANY-method} in the \pkg{DelayedArray}
          package for the default \code{type} method.

    \item \link[S4Arrays]{type,DataFrame-method} in the \pkg{S4Arrays}
          package, and \link[Biostrings]{type,PairwiseAlignments-method} in
          the \pkg{Biostrings} package, for examples of specific \code{type}
          methods (defined for \link[S4Vectors]{DataFrame} and
          \link[Biostrings]{PairwiseAlignments} objects, respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
type
showMethods("type")

`type<-`
showMethods("type<-")

## The BiocGenerics package defines methods for ordinary vectors, arrays,
## and data frames:
m <- matrix(11:22, nrow=3)
type(m)           # equivalent to 'typeof(m)' or 'storage.mode(m)'
type(m) <- "raw"  # equivalent to 'storage.mode(m) <- "raw"'
m
type(m)

selectMethod("type", "array")

selectMethod("type<-", "array")

df <- data.frame(a=44:49, b=letters[1:6], c=c(TRUE, FALSE))
stopifnot(identical(type(df), typeof(as.matrix(df))))

## Examples of methods defined in other packages:

library(DelayedArray)
showMethods("type")
selectMethod("type", "ANY")  # the default "type" method

library(Biostrings)
showMethods("type")
## The type() method for PairwiseAlignments objects:
selectMethod("type", "PairwiseAlignments")
}

\keyword{methods}
