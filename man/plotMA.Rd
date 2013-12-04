\name{plotMA}

\alias{plotMA}
\alias{plotMA,ANY-method}

\title{MA-plot: plot differences versus averages for high-throughput data}

\description{
  A generic function which produces an MA-plot for an object containing microarray, RNA-Seq
  or other data.
}

\usage{
plotMA(object, ...)
}

\arguments{
  \item{object}{
    A data object, typically containing count values from an RNA-Seq experiment or microarray intensity values.
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

    \item \code{\link[limma]{plotMA}} in the \pkg{limma} package
          for a function with the same name that is not dispatched through this generic function.

    \item \code{\link{BiocGenerics}} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
showMethods("plotMA")

suppressWarnings(
  if(require("DESeq2"))
    example("plotMA", package="DESeq2", local=TRUE)
)
}

\keyword{methods}
