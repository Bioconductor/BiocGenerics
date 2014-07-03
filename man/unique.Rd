\name{unique}

\alias{unique}

\title{Extract unique elements}

\description{
  \code{unique} returns an object of the same class as \code{x} (typically
  a vector-like, data-frame-like, or array-like object) but with duplicate
  elements/rows removed.

  NOTE: This man page is for the \code{unique} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{unique}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or data-frame-like) not supported by the
  default method.
}

\usage{
unique(x, incomparables=FALSE, ...)
}

\arguments{
  \item{x}{
    A vector-like, data-frame-like, or array-like object.
  }
  \item{incomparables, ...}{
    See \code{?base::\link[base]{unique}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{unique}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.

  \code{unique} should always behave consistently with
  \code{BiocGenerics::\link[BiocGenerics]{duplicated}}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{unique}} for the default \code{unique}
          method.

    \item \code{BiocGenerics::\link[BiocGenerics]{duplicated}} for determining
          duplicate elements.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{unique,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{unique} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
unique
showMethods("unique")
selectMethod("unique", "ANY")  # the default method
}

\keyword{methods}
