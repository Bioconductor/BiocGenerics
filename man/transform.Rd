\name{transform}

\alias{transform}

\title{Transform an object}

\description{
  An S4 generic function to transform an object.

  NOTE: This man page is for the \code{transform} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{transform}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
transform(x, ...)
}

\arguments{
  \item{x}{
    The object to be transformed.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  The modified value of \code{x}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{transform}} for the default \code{transform}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
transform
showMethods("transform")
selectMethod("transform", "ANY")  # the default method
}

\keyword{methods}
