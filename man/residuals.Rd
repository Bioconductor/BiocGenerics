\name{residuals}

\alias{residuals}

\title{Extract model residuals}

\description{
  \code{residuals} is a generic function which extracts model residuals
  from objects returned by modeling functions.

  NOTE: This man page is for the \code{residuals} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{residuals}} for the default method
  (defined in the \pkg{stats} package).
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
  \itemize{
    \item \code{stats::\link[stats]{residuals}} for the default
          \code{residuals} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[affyPLM]{residuals,PLMset-method} in the \pkg{affyPLM} package
          for an example of a specific \code{residuals} method (defined for
          \link[affyPLM]{PLMset} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
residuals
showMethods("residuals")
selectMethod("residuals", "ANY")  # the default method
}

\keyword{methods}
