\name{relist}

\alias{relist}

\title{Re-listing an unlist()ed object}

\description{
  \code{relist} is a generic function with a few methods in order to allow
  easy inversion of \code{unlist(x)}.

  NOTE: This man page is for the \code{relist} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?utils::\link[utils]{relist}} for the default method
  (defined in the \pkg{utils} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
relist(flesh, skeleton)
}

\arguments{
  \item{flesh}{
    A vector-like object.
  }
  \item{skeleton}{
    A list-like object. Only the "shape" (i.e. the lengths of the individual
    list elements) of \code{skeleton} matters. Its exact content is ignored.
  }
}

\value{
  A list-like object with the same "shape" as \code{skeleton} and that would
  give \code{flesh} back if unlist()ed.
}

\seealso{
  \itemize{
    \item \code{utils::\link[utils]{relist}} for the default \code{relist}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{relist,ANY,List-method} in the \pkg{IRanges}
          package for an example of a specific \code{relist} method (defined
          for when \code{skeleton} is a \link[S4Vectors]{List} object).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
relist
showMethods("relist")
selectMethod("relist", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
