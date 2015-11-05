\name{is.unsorted}

\alias{is.unsorted}

\title{Test if a vector-like object is not sorted}

\description{
  Test if a vector-like object is not sorted, without the cost of sorting it.

  NOTE: This man page is for the \code{is.unsorted}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{is.unsorted}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
is.unsorted(x, na.rm=FALSE, strictly=FALSE, ...)
}

\arguments{
  \item{x}{
    A vector-like object.
  }
  \item{na.rm, strictly}{
    See \code{?base::\link[base]{is.unsorted}} for a description of
    these arguments.
  }
  \item{...}{
    Additional arguments, for use in specific methods.

    Note that \code{base::\link[base]{is.unsorted}} (the default method) only
    takes the \code{x}, \code{na.rm}, and \code{strictly} arguments.
  }
}

\value{
  See \code{?base::\link[base]{is.unsorted}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\note{
  TO DEVELOPERS:

  The \code{is.unsorted} method for specific vector-like objects should
  adhere to the same underlying order used by the
  \code{\link[BiocGenerics]{order}}, \code{\link[BiocGenerics]{sort}},
  and \code{\link[BiocGenerics]{rank}} methods for the same objects.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{is.unsorted}} for the default
          \code{is.unsorted} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[GenomicRanges]{is.unsorted,GenomicRanges-method} in
          the \pkg{GenomicRanges} package for an example of a specific
          \code{is.unsorted} method (defined for
          \link[GenomicRanges]{GenomicRanges} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
is.unsorted  # note the dispatch on the 'x' arg only
showMethods("is.unsorted")
selectMethod("is.unsorted", "ANY")  # the default method
}

\keyword{methods}
