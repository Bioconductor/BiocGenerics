\name{append}

\alias{append}

\title{Append elements to a vector-like object}

\description{
  Append (or insert) elements to (in) a vector-like object.

  NOTE: This man page is for the \code{append} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{append}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like or data-frame-like) not supported by the
  default method.
}

\usage{
append(x, values, after=length(x))
}

\arguments{
  \item{x}{
    The vector-like object to be modified.
  }
  \item{values}{
    The vector-like object containing the values to be appended to \code{x}.
    \code{values} would typically be of the same class as \code{x}, but not
    necessarily.
  }
  \item{after}{
    A subscript, after which the values are to be appended.
  }
}

\value{
  See \code{?base::\link[base]{append}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as \code{x} and of length
  \code{length(x) + length(values)}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{append}} for the default \code{append}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{append,Vector,Vector-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{append} method (defined
          for \link[S4Vectors]{Vector} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
append  # note the dispatch on the 'x' and 'values' args only
showMethods("append")
selectMethod("append", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
