\name{density}

\alias{density}

\title{Kernel density estimation}

\description{
  The generic function \code{density} computes kernel density
  estimates.

  NOTE: This man page is for the \code{density} S4 generic function
  defined in the BiocGenerics package.
  See \code{?stats::\link[stats]{density}} for the default method
  (defined in the stats package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
density(x, ...)
}

\arguments{
  \item{x, ...}{
    See \code{?stats::\link[stats]{density}}.
  }
}

\value{
  See \code{?stats::\link[stats]{density}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \code{stats::\link[stats]{density}} for the default \code{density}
  method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[flowClust]{density,flowClust-method} in the flowClust package
  for the method defined for \link[flowClust]{flowClust} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
density
showMethods("density")
selectMethod("density", "ANY")  # the default method
}

\keyword{methods}
