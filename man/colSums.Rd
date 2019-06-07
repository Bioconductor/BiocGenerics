\name{colSums}

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
  (typically array-like) not supported by the default methods.
}

\usage{
colSums (x, na.rm=FALSE, dims=1, ...)
rowSums (x, na.rm=FALSE, dims=1, ...)
colMeans(x, na.rm=FALSE, dims=1, ...)
rowMeans(x, na.rm=FALSE, dims=1, ...)
}

\arguments{
  \item{x}{
    A rectangular object, like a matrix or data frame.
  }
  \item{na.rm, dims}{
    See \code{?base::\link[base]{colSums}} for a description of these
    arguments.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?base::\link[base]{colSums}} for the value returned by the
  default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{colSums}} for the default
          \code{colSums}, \code{rowSums}, \code{colMeans},
          and \code{colSums} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{colSums,DelayedMatrix-method} in the
          \pkg{DelayedArray} package for an example of a specific
          \code{colSums} method (defined for
          \link[DelayedArray]{DelayedMatrix} objects).

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
