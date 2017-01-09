\name{rank}

\alias{rank}

\title{Ranks the values in a vector-like object}

\description{
  Returns the ranks of the values in a vector-like object.
  Ties (i.e., equal values) and missing values can be handled in several ways.

  NOTE: This man page is for the \code{rank}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{rank}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
rank(x, na.last=TRUE,
     ties.method=c("average", "first", "last", "random", "max", "min"),
     ...)
}

\arguments{
  \item{x}{
    A vector-like object.
  }
  \item{na.last, ties.method}{
    See \code{?base::\link[base]{rank}} for a description of
    these arguments.
  }
  \item{...}{
    Additional arguments, for use in specific methods.

    Note that \code{base::\link[base]{rank}} (the default method) only
    takes the \code{x}, \code{na.last}, and \code{ties.method} arguments.
  }
}

\value{
  See \code{?base::\link[base]{rank}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\note{
  TO DEVELOPERS:

  See note in \code{?BiocGenerics::\link[BiocGenerics]{order}} 
  about "stable" order.

  \code{\link[BiocGenerics]{order}}, \code{\link[BiocGenerics]{sort}},
  and \code{\link[BiocGenerics]{rank}} methods for specific vector-like
  objects should adhere to the same underlying order that should be
  conceptually defined as a binary relation on the set of all possible
  vector values. For completeness, this binary relation should also be
  incarnated by a \link{<=} method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{rank}} for the default \code{rank} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{rank,Vector-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{rank} method (defined for
          \link[S4Vectors]{Vector} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
rank  # note the dispatch on the 'x' arg only
showMethods("rank")
selectMethod("rank", "ANY")  # the default method
}

\keyword{methods}
