\name{which}

\alias{which}
\alias{which.max}
\alias{which.min}

\title{Subscript generators}

\description{
  These functions all return a vector of subscripts into their input.
  
  NOTE: This man page is for the \code{which}, \code{which.max} and
  \code{which.min} \emph{S4 generic functions} defined in the
  \pkg{BiocGenerics} package.  See \code{?base::\link[base]{which}} and
  \code{?base::\link[base]{which.min}} for the default methods (defined
  in the \pkg{base} package).  Bioconductor packages can define specific
  methods for objects (typically vector-like) not supported by the
  default methods.
}

\usage{
which(x, arr.ind = FALSE, useNames = TRUE, ...)
which.max(x, ...)
which.min(x, ...)
}

\arguments{
  \item{x}{
    Vector-like object, logical for \code{which}, numeric for the others.
  }
  \item{arr.ind, useNames}{
    See \code{?base::\link[base]{which}} for a description of these
    arguments.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?base::\link[base]{which}} and
  \code{?base::\link[base]{which.min}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\note{
  The default methods (defined in the \pkg{base} package) only take a
  fixed set of arguments. We've added the \code{...} argument to the
  generic functions defined in the \pkg{BiocGenerics} package so they
  can be called with an arbitrary number of effective arguments.  This
  typically allows methods to add extra arguments for
  controlling/altering the behavior of the operation.  Like for example
  the \code{global} argument supported by the \code{which.max}
  method for \link[IRanges]{NumericList} objects (defined in the
  \pkg{IRanges} package).
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{which}} for the default \code{which},
          \code{base::\link[base]{which.min}} for the others.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{which.max,NumericList-method} in the
          \pkg{IRanges} package for an example of a specific
          \code{which.max} method (defined for
          \link[IRanges]{NumericList} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
which
showMethods("which")
selectMethod("which", c("ANY", "ANY"))  # the default method

which.max
showMethods("which.max")
selectMethod("which.max", c("ANY", "ANY"))  # the default method

which.min
showMethods("which.min")
selectMethod("which.min", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
