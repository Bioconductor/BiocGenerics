\name{rep}

\alias{rep.int}

\title{Replicate elements of a vector-like object}

\description{
  \code{rep.int} replicates the elements in \code{x}.

  NOTE: This man page is for the \code{rep.int} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{rep.int}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
rep.int(x, times)
}

\arguments{
  \item{x}{
    The object to replicate (typically vector-like).
  }
  \item{times}{
    See \code{?base::\link[base]{rep.int}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{rep.int}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{rep.int}} for the default \code{rep.int},
          \code{intersect}, and \code{setdiff} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{rep.int,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{rep.int} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
rep.int
showMethods("rep.int")
selectMethod("rep.int", "ANY")  # the default method
}

\keyword{methods}
