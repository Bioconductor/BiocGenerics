\name{matrix-summary}

\alias{rowSums}
\alias{colSums}
\alias{rowMeans}
\alias{colMeans}

\title{Form Row and Column Sums and Means}

\description{
  Form row and column sums and means for rectangular objects..

  NOTE: This man page is for the \code{rowSums}, \code{colSums},
  \code{rowMeans}, and \code{colMeans} \emph{S4 generic functions}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{colSums}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically array-like) not supported by the default method.
}

\usage{
     colSums (x, na.rm = FALSE, dims = 1)
     rowSums (x, na.rm = FALSE, dims = 1)
     colMeans(x, na.rm = FALSE, dims = 1)
     rowMeans(x, na.rm = FALSE, dims = 1)
}

\arguments{
  \item{x}{
    a rectangular object, like a matrix or data frame
  }
  \item{na.rm, dims}{see \link[base]{colSums}}
}

\value{
  See \code{?base::\link[base]{colSums}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{colSums}} for the default
    \code{colSums}, \code{rowSums}, \code{colMeans}, and \code{colSums}
    methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
colSums
showMethods("colSums")
selectMethod("colSums", "ANY")  # the default method
}

\keyword{methods}
