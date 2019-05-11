\name{t}

\alias{t}

\title{Matrix Transponse}

\description{
  Given a rectangular object \code{x}, \code{t} returns the
  transpose of \code{x}.

  NOTE: This man page is for the \code{t} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{t}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically array-like) not supported by the default method.
}

\usage{
t(x)
}

\arguments{
  \item{x}{
    a rectangular object, like a matrix or data frame
  }
}

\value{
  See \code{?base::\link[base]{t}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{t}} for the default \code{t} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{t,Hits-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{t} method (defined for
          \link[S4Vectors]{Hits} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
t
showMethods("t")
selectMethod("t", "ANY")  # the default method
}

\keyword{methods}
