\name{fileName}

\alias{fileName}

\title{Accessing the file name of an object}

\description{
  Get the file name of an object.
}

\usage{
fileName(object, ...)
}

\arguments{
  \item{object}{
    An object with a file name.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[MSnbase]{fileName,MSmap-method} in the
          \pkg{MSnbase} package for an example of a specific
          \code{fileName} method (defined for \link[MSnbase]{MSmap}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
fileName
showMethods("fileName")

library(MSnbase)
showMethods("fileName")
selectMethod("fileName", "MSmap")
}

\keyword{methods}
