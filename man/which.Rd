\name{which}

\alias{which}

\title{Which values in an object are considered TRUE?}

\description{
  Give the indices of the values in a vector-, array-, or list-like object
  that are considered \code{TRUE}, allowing for array indices in the case
  of an array-like object.

  NOTE: This man page is for the \code{which} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{which}} for the default method (defined
  in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects (typically
  vector-, array-, or list-like) not supported by the default methods.
}

\usage{
which(x, arr.ind=FALSE, useNames=TRUE)
}

\arguments{
  \item{x}{
    An object, typically with a vector-, array-, or list-like semantic.
  }
  \item{arr.ind, useNames}{
    See \code{?base::\link[base]{which}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{which}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{which}} for the default \code{which} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{which,DelayedArray-method} in the
          \pkg{DelayedArray} package for an example of a specific
          \code{which} method (defined for \link[DelayedArray]{DelayedArray}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
which
showMethods("which")
selectMethod("which", "ANY")  # the default method

library(DelayedArray)
showMethods("which")
## The which() method for DelayedArray objects:
selectMethod("which", "DelayedArray")
}

\keyword{methods}
