\name{dims}

\alias{dims}

\title{Get the dimensions of all elements in a list-like object}

\description{
  Get the dimensions of all elements in a list-like object.
}

\usage{
dims(x)
}

\arguments{
  \item{x}{
    List-like object (or environment) containing one or several array-like
    objects with the same number of dimensions.
  }
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[Biobase]{dims,eSet-method} in the
          \pkg{Biobase} package for an example of a specific
          \code{dims} method (defined for \link[Biobase]{eSet}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
dims
showMethods("dims")

library(Biobase)
showMethods("dims")
selectMethod("dims", "eSet")
}

\keyword{methods}
