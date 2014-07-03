\name{Extremes}

\alias{Extremes}
\alias{pmax}
\alias{pmin}
\alias{pmax.int}
\alias{pmin.int}

\title{Maxima and minima}

\description{
  \code{pmax}, \code{pmin}, \code{pmax.int} and \code{pmin.int} return the
  parallel maxima and minima of the input values.

  NOTE: This man page is for the \code{pmax}, \code{pmin}, \code{pmax.int}
  and \code{pmin.int} \emph{S4 generic functions} defined in the
  \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{pmax}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or matrix-like) not supported by the default
  methods.
}

\usage{
pmax(..., na.rm=FALSE)
pmin(..., na.rm=FALSE)
     
pmax.int(..., na.rm=FALSE)
pmin.int(..., na.rm=FALSE)
}

\arguments{
  \item{...}{
    One or more vector-like or matrix-like objects.
  }
  \item{na.rm}{
    See \code{?base::\link[base]{pmax}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{pmax}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input objects.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{pmax}} for the default \code{pmax},
          \code{pmin}, \code{pmax.int} and \code{pmin.int} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{pmax,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{pmax} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
pmax
showMethods("pmax")
selectMethod("pmax", "ANY")  # the default method

pmin
showMethods("pmin")
selectMethod("pmin", "ANY")  # the default method

pmax.int
showMethods("pmax.int")
selectMethod("pmax.int", "ANY")  # the default method

pmin.int
showMethods("pmin.int")
selectMethod("pmin.int", "ANY")  # the default method
}

\keyword{methods}
