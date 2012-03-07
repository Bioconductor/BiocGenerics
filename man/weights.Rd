\name{weights}

\alias{weights}

\title{Extract model weights}

\description{
  \code{weights} is a generic function which extracts fitting weights
  from objects returned by modeling functions.

  NOTE: This man page is for the \code{weights} S4 generic function
  defined in the BiocGenerics package.
  See \code{?stats::\link[stats]{weights}} for the default method
  (defined in the stats package).
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

  Specific methods defined in other Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \code{stats::\link[stats]{weights}} for the default \code{weights}
  method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[affyPLM]{weights,PLMset-method} in the affyPLM package
  for the method defined for \link[affyPLM]{PLMset} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
weights
showMethods("weights")
selectMethod("weights", "ANY")  # the default method
}

\keyword{methods}
