\name{rep}

\alias{rep.int}

\title{Replicate elements of a vector-like R object}

\description{
  \code{rep.int} replicates the elements in \code{x}.

  NOTE: This man page is for the \code{rep.int} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{rep.int}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
## Unlike the standard rep.int() function defined in base (default method),
## the generic function described here have a '...' argument (instead of
## 'times').
rep.int(x, ...)
}

\arguments{
  \item{x}{
    R object (typically vector-like).
  }
  \item{...}{
    Additional arguments, for use in specific \code{rep.int} methods.
  }
}

\value{
  See \code{?base::\link[base]{rep.int}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \code{base::\link[base]{rep.int}} for the default \code{rep.int},
  \code{intersect}, and \code{setdiff} methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{rep.int,Rle-method} in the IRanges package
  for the method defined for \link[IRanges]{Rle} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
rep.int
showMethods("rep.int")
selectMethod("rep.int", "ANY")  # the default method
}

\keyword{methods}
