\name{lengths}

\alias{lengths}

\title{Lengths of List or Vector Elements}

\description{
  Get the length of each element of a \code{List} or \code{Vector}
  object or the number of rows for a matrix-like object.

  NOTE: This man page is for the \code{lengths} \emph{S4 generic
  function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{lengths}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (list-like or environment-like) not supported by the default methods.
}

\usage{
lengths(x, use.names=TRUE)
}

\arguments{
  \item{x}{
    A \code{List}, \code{Vector} or matrix-like object.
  }
  \item{use.names}{
    A \code{logical} indicating if the result should inherit the \code{names}
    from \code{x}.
  }
}

\details{
  Equivalent to \code{sapply(x, NROW)}.

  \code{lengths} is functionally equivalent to its predecessor
  S4Vectors::elementLengths and will eventually replace it.

  See \code{?base::\link[base]{lengths}} for details about the default methods.
}

\value{
  A non-negative \code{integer} of length \code{length(x)}. When \code{x}
  has an element of length greater than 2^31 - 1 a double vector is returned.
  When \code{names=TRUE}, names are propagated from \code{x}.

  See \code{?base::\link[base]{lengths}} for the value returned by the
  default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{lengths}} for the default \code{lengths} 
          methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
lengths  # note the dispatch on the 'x' args only
showMethods("lengths")
selectMethod("lengths", "ANY")  # the default method
}

\keyword{methods}
