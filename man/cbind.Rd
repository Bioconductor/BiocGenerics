\name{cbind}

\alias{cbind}
\alias{rbind}

\title{Combine R objects by rows or columns}

\description{
  \code{cbind} and \code{rbind} take a sequence of R objects arguments
  and combine them by columns or rows, respectively.

  NOTE: This man page is for the \code{cbind} and \code{rbind}
  S4 generic functions defined in the BiocGenerics package.
  See \code{?base::\link[base]{cbind}} for the default methods
  (defined in the base package).
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
    One or more vector-like or matrix-like R objects. These can be given as
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

  Specific methods defined in other Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \code{base::\link[base]{cbind}} for the default \code{cbind} and
  \code{rbind} methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{cbind,DataFrame-method} in the IRanges package
  for the \code{cbind} method defined for \link[IRanges]{DataFrame}
  objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
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
