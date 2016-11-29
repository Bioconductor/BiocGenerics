\name{mean}

\alias{mean}

\title{Arithmetic Mean}

\description{
  Generic function for the (trimmed) arithmetic mean.
  
  NOTE: This man page is for the \code{mean} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{mean}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
mean(x, ...)
}

\arguments{
  \item{x}{
    typically a vector-like object
  }
  \item{...}{
    see \code{\link[base]{mean}}
  }
}

\value{
  See \code{?base::\link[base]{mean}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{mean}} for the default \code{mean} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{mean,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{mean} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
mean
showMethods("mean")
selectMethod("mean", "ANY")  # the default method
}

\keyword{methods}
