\name{BiocGenerics-package}

\alias{BiocGenerics-package}
\alias{BiocGenerics}
\docType{package}

\title{Generic functions for Bioconductor}

\description{
  Generic functions that are needed by many other packages.
}

\details{
  Standard R functions explicitely promoted to generics:
  \itemize{
    \item \code{\link[BiocGenerics]{cbind}}
    \item \code{\link[BiocGenerics]{rbind}}
  }

  Bioconductor specific generics:
  \itemize{
    \item \code{\link[BiocGenerics]{updateObject}}
  }
}

\author{The Bioconductor Dev Team}

\seealso{
  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \code{\link[methods]{setGeneric}} and \code{\link[methods]{setMethod}}
  for defining generics and methods.
}

\examples{
## List all the symbols defined in this package:
ls('package:BiocGenerics')
}

\keyword{package}
