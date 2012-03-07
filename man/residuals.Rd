\name{residuals}

\alias{residuals}

\title{Extract model residuals}

\description{
  \code{residuals} is a generic function which extracts model residuals
  from objects returned by modeling functions.

  NOTE: This man page is for the \code{residuals} S4 generic function
  defined in the BiocGenerics package.
  See \code{?stats::\link[stats]{residuals}} for the default method
  (defined in the stats package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
residuals(object, ...)
}

\arguments{
  \item{object, ...}{
    See \code{?stats::\link[stats]{residuals}}.
  }
}

\value{
  Residuals extracted from the object \code{object}.
}

\seealso{
  \code{stats::\link[stats]{residuals}} for the default \code{residuals}
  method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[affyPLM]{residuals,PLMset-method} in the affyPLM package
  for the method defined for \link[affyPLM]{PLMset} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
residuals
showMethods("residuals")
selectMethod("residuals", "ANY")  # the default method
}

\keyword{methods}
