\name{plotPCA}

\alias{plotPCA}
\alias{plotPCA,ANY-method}

\title{PCA-plot: Principal Component Analysis plot}

\description{
  A generic function which produces a PCA-plot.
}

\usage{
plotPCA(object, ...)
}

\arguments{
  \item{object}{
    
    A data object, typically containing gene expression information.

  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  Undefined. The function exists for its side effect, producing a plot.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \code{\link[DESeq2]{plotPCA}} in the \pkg{DESeq2} package
          for an example method that uses this generic.

    \item \code{\link{BiocGenerics}} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
showMethods("plotPCA")

suppressWarnings(
  if(require("DESeq2"))
    example("plotPCA", package="DESeq2", local=TRUE)
)
}

\keyword{methods}
