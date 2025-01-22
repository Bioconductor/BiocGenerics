\name{longForm}

\alias{longForm}

\title{Turn object into long form}

\description{
  A generic function that returns the \emph{long form} of an object.
}

\usage{
longForm(object, ...)
}

\arguments{
  \item{object}{
    A data object.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  The \emph{long form} version of the original object. This is typically
  a data-frame-like object.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[MultiAssayExperiment]{longForm,MultiAssayExperiment-method}
          in the \pkg{MultiAssayExperiment} package for an example of a
          specific \code{longForm} method (defined for
          \link[MultiAssayExperiment]{MultiAssayExperiment} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
longForm
showMethods("longForm")

library(MultiAssayExperiment)
showMethods("MultiAssayExperiment")
## Method not ready yet (2025/01/21), uncomment when it's ready
#selectMethod("longForm", "MultiAssayExperiment")
}

\keyword{methods}
