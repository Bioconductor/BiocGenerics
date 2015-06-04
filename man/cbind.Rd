\name{cbind}

\alias{cbind}
\alias{rbind}

\title{Combine objects by rows or columns}

\description{
  \code{cbind} and \code{rbind} take one or more objects and combine them
  by columns or rows, respectively.

  NOTE: This man page is for the \code{cbind} and \code{rbind}
  \emph{S4 generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{cbind}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or matrix-like) not supported by the default
  methods.
}

\usage{
cbind(..., deparse.level=1)
rbind(..., deparse.level=1)
}

\arguments{
  \item{...}{
    One or more vector-like or matrix-like objects. These can be given as
    named arguments.
  }
  \item{deparse.level}{
    See \code{?base::\link[base]{cbind}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{cbind}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{cbind}} for the default \code{cbind} and
          \code{rbind} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{cbind,DataFrame-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{cbind} method (defined
          for \link[S4Vectors]{DataFrame} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
cbind  # note the dispatch on the '...' arg only
showMethods("cbind")
selectMethod("cbind", "ANY")  # the default method

rbind  # note the dispatch on the '...' arg only
showMethods("rbind")
selectMethod("rbind", "ANY")  # the default method
}

\keyword{methods}
