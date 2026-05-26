\name{scale}

\alias{scale}

\title{Scaling and centering of matrix-like objects}

\description{
  \code{scale} is a generic function whose default method centers and/or
  scales the columns of a numeric matrix.

  NOTE: This man page is for the \code{scale} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{scale}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
scale(x, ...)
}

\arguments{
  \item{x}{
    A matrix-like object.
  }
  \item{...}{
    Additional arguments (e.g. \code{center}, \code{scale}), for use
    in specific methods. See \code{?base::\link[base]{scale}} for
    more information.
  }
}

\value{
  See \code{?base::\link[base]{scale}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{scale}} for the default \code{scale} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{scale,DelayedMatrix-method} in the
          \pkg{DelayedArray} package for an example of a specific \code{scale}
	  method (defined for \link[DelayedArray]{DelayedMatrix} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
scale
showMethods("scale")
selectMethod("scale", "ANY")  # the default method

library(DelayedArray)
showMethods("scale")
## The scale() method for DelayedMatrix objects:
selectMethod("scale", "DelayedMatrix")
}

\keyword{methods}
