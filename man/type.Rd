\name{type}

\alias{type}
\alias{type<-}

\title{Accessing the type of an object}

\description{
  Get or set the \emph{type} of an object.

  Note that \code{type} and \code{type<-} are defined as \emph{S4 generic
  functions} and what \emph{type} means exactly (and what \code{type()}
  returns) depends on the objects for which \code{type} and/or \code{type<-}
  methods are defined.
}

\usage{
type(x)
type(x) <- value
}

\arguments{
  \item{x}{
    Any object for which the \code{type()} getter or setter is defined.
    Note that objects will either: not support the getter or setter at all,
    or support only the getter, or support the getter and setter.
  }
  \item{value}{
    The type to set on \code{x} (assuming \code{x} supports the \code{type()}
    setter). \code{value} is typically (but not necessarily) expected to be
    a single string (i.e. a character vector of length 1).
  }
}

\value{
  \code{type(x)} returns the type of \code{x}, typically (but not necessarily)
  as a single string (i.e. as a character vector of length 1).
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{type,ANY-method} in the \pkg{DelayedArray}
          package for the default \code{type} method.

    \item \link[Biostrings]{type,PairwiseAlignments-method} in the
          \pkg{Biostrings} package for an example of a specific
          \code{type} method (defined for \link[Biostrings]{PairwiseAlignments}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
type
showMethods("type")

`type<-`
showMethods("type<-")

library(DelayedArray)
showMethods("type")
selectMethod("type", "ANY")  # the default "type" method

library(Biostrings)
showMethods("type")
selectMethod("type", "PairwiseAlignments")
}

\keyword{methods}
