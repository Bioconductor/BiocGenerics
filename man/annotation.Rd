\name{annotation}

\alias{annotation}
\alias{annotation<-}

\title{Accessing annotation information}

\description{
    Get or set the annotation information contained in an object.
}

\usage{
annotation(object, ...)
annotation(object, ...) <- value
}

\arguments{
  \item{object}{
    An object containing annotation information.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
  \item{value}{
    The annotation information to set on \code{object}.
  }
}

\seealso{
  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[Biobase]{annotation,eSet-method} in the Biobase 
  package for the method defined for \link[Biobase]{eSet}
  objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
annotation
showMethods("annotation")

library(Biobase)
showMethods("annotation")
selectMethod("annotation", "eSet")
}

\keyword{methods}
