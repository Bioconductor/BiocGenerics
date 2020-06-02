\name{which.min}

\alias{which.min}
\alias{which.max}

\title{What's the index of the first min or max value in an object?}

\description{
  Determines the location (i.e. index) of the (first) minimum or
  maximum value in an object.

  NOTE: This man page is for the \code{which.min} and \code{which.max}
  \emph{S4 generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{which.min}} for the default methods (defined
  in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects (typically
  vector-, array-, or list-like) not supported by the default methods.
}

\usage{
which.min(x, ...)
which.max(x, ...)
}

\arguments{
  \item{x}{
    An object, typically with a vector-, array-, or list-like semantic.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?base::\link[base]{which.min}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default methods.
}

\note{
  The default methods (defined in the \pkg{base} package) only take a
  single argument.  We've added the \code{...} argument to the generic
  functions defined in the \pkg{BiocGenerics} package so they
  can be called with an arbitrary number of effective arguments.
  This typically allows methods to add extra arguments for
  controlling/altering the behavior of the operation.  Like for
  example the \code{global} argument supported by the \code{which.max}
  method for \link[IRanges]{NumericList} objects (defined in the
  \pkg{IRanges} package).
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{which.min}} for the default \code{which.min}
          and \code{which.max} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{which.max,NumericList-method} in the \pkg{IRanges}
          package for an example of a specific \code{which.max} method
          (defined for \link[IRanges]{NumericList} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
which.min
showMethods("which.min")
selectMethod("which.min", "ANY")  # the default method

which.max
showMethods("which.max")
selectMethod("which.max", "ANY")  # the default method

library(IRanges)
showMethods("which.max")
## The which.max() method for NumericList objects:
selectMethod("which.max", "NumericList")
}

\keyword{methods}
