\name{paste}

\alias{paste}

\title{Concatenate strings}

\description{
  \code{paste} concatenates vectors of strings or vector-like
  objects containing strings.

  NOTE: This man page is for the \code{paste} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{paste}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like objects containing strings) not supported by
  the default method.
}

\usage{
paste(..., sep=" ", collapse=NULL)
}

\arguments{
  \item{...}{
    One or more vector-like objects containing strings.
  }
  \item{sep, collapse}{
    See \code{?base::\link[base]{paste}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{paste}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{paste}} for the default \code{paste} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{paste,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{paste} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
paste
showMethods("paste")
selectMethod("paste", "ANY")  # the default method
}

\keyword{methods}
