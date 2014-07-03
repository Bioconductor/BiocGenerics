\name{mapply}

\alias{mapply}

\title{Apply a function to multiple list-like or vector-like arguments}

\description{
  \code{mapply} is a multivariate version of
  \code{\link[BiocGenerics]{sapply}}. \code{mapply} applies
  \code{FUN} to the first elements of each \code{...} argument,
  the second elements, the third elements, and so on. Arguments
  are recycled if necessary.

  NOTE: This man page is for the \code{mapply} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{mapply}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically list-like or vector-like) not supported by the
  default methods.
}

\usage{
mapply(FUN, ..., MoreArgs=NULL, SIMPLIFY=TRUE, USE.NAMES=TRUE)
}

\arguments{
  \item{FUN, MoreArgs, SIMPLIFY, USE.NAMES}{
    See \code{?base::\link[base]{mapply}} for a description of
    these arguments.
  }
  \item{...}{
    One or more list-like or vector-like objects of strictly
    positive length, or all of zero length.
  }
}

\value{
  See \code{?base::\link[base]{mapply}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should 
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{mapply}} for the default \code{mapply}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
mapply  # note the dispatch on the '...' arg only
showMethods("mapply")
selectMethod("mapply", "ANY")  # the default method
}

\keyword{methods}
