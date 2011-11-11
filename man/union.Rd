\name{union}

\alias{union}
\alias{intersect}
\alias{setdiff}

\title{Set operations}

\description{
  Performs \emph{set} union, intersection and (asymmetric!) difference
  on two vector-like R objects.

  This man page is for the \code{union}, \code{intersect} and
  \code{setdiff} S4 generic functions defined in the BiocGenerics package.
  See \code{?base::\link[base]{union}} for the default methods (defined
  in the base package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default methods.
}

\usage{
## Unlike the standard functions defined in base (default methods),
## the generic functions described here have a '...' argument.
union(x, y, ...)
intersect(x, y, ...)
setdiff(x, y, ...)
}

\arguments{
  \item{x, y}{
    R objects of the same class (typically a vector-like class).
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?base::\link[base]{union}} for the value returned by the
  default methods.

  Specific methods defined in other Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \code{\link[base]{union}} for the default \code{union},
  \code{intersect}, and \code{setdiff} methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{union,IRanges,IRanges-method} in the IRanges package
  for the method defined for \link[IRanges]{IRanges} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
union
showMethods("union")
selectMethod("union", c("ANY", "ANY"))  # the default method

intersect
showMethods("intersect")
selectMethod("intersect", c("ANY", "ANY"))  # the default method

setdiff
showMethods("setdiff")
selectMethod("setdiff", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
