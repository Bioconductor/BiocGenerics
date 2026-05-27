\name{rotate}

\alias{rotate}

\title{Rotate an object}

\description{
  An S4 generic function to rotate an object.
}

\usage{
rotate(x, ...)
}

\arguments{
  \item{x}{
    The object to be rotated.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  The rotated object.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
rotate
showMethods("rotate")
}

\keyword{methods}
