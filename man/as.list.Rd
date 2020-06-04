\name{as.list}

\alias{as.list}

\title{Coerce to a list}

\description{
  Generic function to coerce to a list, if possible.

  NOTE: This man page is for the \code{as.list} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{as.list}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
as.list(x, ...)
}

\arguments{
  \item{x}{
    The object to coerce.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  An ordinary list.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{as.list}} for the default \code{as.list}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{as.list,List-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{as.list} method
          (defined for \link[S4Vectors]{List} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
as.list
showMethods("as.list")
selectMethod("as.list", "ANY")  # the default method

library(S4Vectors)
showMethods("as.list")
## The as.list() method for List objects:
selectMethod("as.list", "List")
}

\keyword{methods}
