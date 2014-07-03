\name{duplicated}

\alias{duplicated}
\alias{anyDuplicated}

\title{Determine duplicate elements}

\description{
  Determines which elements of a vector-like or data-frame-like object
  are duplicates of elements with smaller subscripts, and returns a
  logical vector indicating which elements (rows) are duplicates.

  NOTE: This man page is for the \code{duplicated} and \code{anyDuplicated}
  \emph{S4 generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{duplicated}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or data-frame-like) not supported by the
  default method.
}

\usage{
duplicated(x, incomparables=FALSE, ...)
anyDuplicated(x, incomparables=FALSE, ...)
}

\arguments{
  \item{x}{
    A vector-like or data-frame-like object.
  }
  \item{incomparables, ...}{
    See \code{?base::\link[base]{duplicated}} for a description of
    these arguments.
  }
}

\value{
  The default \code{duplicated} method (see
  \code{?base::\link[base]{duplicated}}) returns a logical vector
  of length N where N is:
  \itemize{
    \item \code{length(x)} when \code{x} is a vector;
    \item \code{nrow(x)} when \code{x} is a data frame.
  }

  Specific \code{duplicated} methods defined in Bioconductor
  packages must also return a logical vector of the same length
  as \code{x} when \code{x} is a vector-like object, and a logical
  vector with one element for each row when \code{x} is a
  data-frame-like object.

  The default \code{anyDuplicated} method (see
  \code{?base::\link[base]{duplicated}}) returns a single
  non-negative integer and so must the specific \code{anyDuplicated}
  methods defined in Bioconductor packages.

  \code{anyDuplicated} should always behave consistently with
  \code{duplicated}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{duplicated}} for the default
          \code{duplicated} and \code{anyDuplicated} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{duplicated,Rle-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{duplicated} method
          (defined for \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
duplicated
showMethods("duplicated")
selectMethod("duplicated", "ANY")  # the default method

anyDuplicated
showMethods("anyDuplicated")
selectMethod("anyDuplicated", "ANY")  # the default method
}

\keyword{methods}
