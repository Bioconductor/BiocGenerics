\name{paste}

\alias{paste}

\title{Concatenate strings}

\description{
  \code{paste} concatenates vectors of strings or vector-like R
  objects containing strings.

  NOTE: This man page is for the \code{paste} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{paste}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like objects containing strings) not supported by
  the default method.
}

\usage{
paste(..., sep=" ", collapse=NULL)
}

\arguments{
  \item{...}{
    One or more vector-like R objects containing strings.
  }
  \item{sep, collapse}{
    See \code{?base::\link[base]{paste}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{paste}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \code{base::\link[base]{paste}} for the default \code{paste} method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{paste,Rle-method} in the IRanges package
  for the method defined for \link[IRanges]{Rle} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
paste
showMethods("paste")
selectMethod("paste", "ANY")  # the default method
}

\keyword{methods}
