\name{sets}

\alias{sets}
\alias{union}
\alias{intersect}
\alias{setdiff}

\title{Set operations}

\description{
  Performs \emph{set} union, intersection and (asymmetric!) difference
  on two vector-like objects.

  NOTE: This man page is for the \code{union}, \code{intersect} and
  \code{setdiff} \emph{S4 generic functions} defined in the \pkg{BiocGenerics}
  package.
  See \code{?base::\link[base]{union}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default methods.
}

\usage{
union(x, y, ...)
intersect(x, y, ...)
setdiff(x, y, ...)
}

\arguments{
  \item{x, y}{
    Vector-like objects (typically of the same class, but not necessarily).
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?base::\link[base]{union}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\note{
  The default methods (defined in the \pkg{base} package) only take 2
  arguments. We've added the \code{...} argument to the generic functions
  defined in the \pkg{BiocGenerics} package so they can be called with an
  arbitrary number of effective arguments.
  For \code{union} or \code{intersect}, this typically allows Bioconductor
  packages to define methods that compute the union or intersection of more
  than 2 objects. However, for \code{setdiff}, which is conceptually a
  binary operation, this typically allows methods to add extra arguments
  for controlling/altering the behavior of the operation.
  Like for example the \code{ignore.strand} argument supported by the
  \code{setdiff} method for \link[GenomicRanges]{GenomicRanges} objects
  (defined in the \pkg{GenomicRanges} package). (Note that the \code{union}
  and \code{intersect} methods for those objects also support the
  \code{ignore.strand} argument.)
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{union}} for the default \code{union},
          \code{intersect}, and \code{setdiff} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[GenomicRanges]{union,GenomicRanges,GenomicRanges-method} in
          the \pkg{GenomicRanges} package for examples of specific
          \code{union}, \code{intersect}, and \code{setdiff} methods (defined
          for \link[GenomicRanges]{GenomicRanges} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
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
