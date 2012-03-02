\name{unique}

\alias{unique}

\title{Extract unique elements}

\description{
  \code{unique} returns an object of the same class as \code{x} (typically
  a vector-like, data-frame-like, or array-like R object) but with duplicate
  elements/rows removed.

  NOTE: This man page is for the \code{unique} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{unique}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or data-frame-like) not supported by the
  default method.
}

\usage{
unique(x, incomparables=FALSE, ...)
}

\arguments{
  \item{x}{
    A vector-like, data-frame-like, or array-like R object.
  }
  \item{incomparables, ...}{
    See \code{?base::\link[base]{unique}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{unique}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages will typically
  return an object of the same class as the input object.

  \code{unique} should always behave consistently with
  \code{BiocGenerics::\link[BiocGenerics]{duplicated}}.
}

\seealso{
  \code{base::\link[base]{unique}} for the default \code{unique} method.

  \code{BiocGenerics::\link[BiocGenerics]{duplicated}} for determining
  duplicate elements.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{unique,Ranges-method} in the IRanges package
  for the method defined for \link[IRanges]{Ranges} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
unique
showMethods("unique")
selectMethod("unique", "ANY")  # the default method
}

\keyword{methods}
