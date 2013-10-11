\name{is.unsorted}

\alias{is.unsorted}

\title{Test if an Object is Not Sorted}

\description{
  Test if an object is not sorted, without the cost of sorting it.

  NOTE: This man page is for the \code{is.unsorted}
  \emph{S4 generic function} defined in the BiocGenerics package.
  See \code{?base::\link[base]{is.unsorted}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
is.unsorted(x, na.rm = FALSE, strictly = FALSE)
}

\arguments{
  \item{x}{
    A vector-like object.
  }
  \item{na.rm, strictly}{
    See \code{?base::\link[base]{is.unsorted}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{is.unsorted}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\note{
  TO DEVELOPPERS:

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
    \item \code{base::\link[base]{is.unsorted}} for the default
          \code{is.unsorted} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{is.unsorted,Rle-method} in the IRanges package
          for an example of a specific \code{is.unsorted} method (defined for
          \link[IRanges]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the BiocGenerics package.
  }
}

\examples{
is.unsorted  # note the dispatch on the 'x' arg only
showMethods("is.unsorted")
selectMethod("is.unsorted", "ANY")  # the default method
}

\keyword{methods}
