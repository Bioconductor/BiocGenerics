\name{weights}

\alias{weights}

\title{Extract model weights}

\description{
  \code{weights} is a generic function which extracts fitting weights
  from objects returned by modeling functions.

  NOTE: This man page is for the \code{weights} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{weights}} for the default method
  (defined in the \pkg{stats} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
weights(object, ...)
}

\arguments{
  \item{object, ...}{
    See \code{?stats::\link[stats]{weights}}.
  }
}

\value{
  Weights extracted from the object \code{object}.

  See \code{?stats::\link[stats]{weights}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{stats::\link[stats]{weights}} for the default \code{weights}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[affyPLM]{weights,PLMset-method} in the \pkg{affyPLM} package
          for an example of a specific \code{weights} method (defined for
          \link[affyPLM]{PLMset} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
weights
showMethods("weights")
selectMethod("weights", "ANY")  # the default method
}

\keyword{methods}
