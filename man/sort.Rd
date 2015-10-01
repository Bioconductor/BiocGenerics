\name{sort}

\alias{sort}

\title{Sorting a vector-like object}

\description{
  Sort a vector-like object into ascending or descending order.

  NOTE: This man page is for the \code{sort}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{sort}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
sort(x, decreasing=FALSE, ...)
}

\arguments{
  \item{x}{
    A vector-like object.
  }
  \item{decreasing, ...}{
    See \code{?base::\link[base]{sort}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{sort}} for the value returned
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
    \item \code{base::\link[base]{sort}} for the default
          \code{sort} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{sort,Vector-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{sort} method (defined for
          \link[S4Vectors]{Vector} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
sort  # note the dispatch on the 'x' arg only
showMethods("sort")
selectMethod("sort", "ANY")  # the default method
}

\keyword{methods}
