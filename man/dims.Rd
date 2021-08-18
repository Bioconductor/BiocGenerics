\name{dims}

\alias{dims}
\alias{nrows}
\alias{ncols}

\title{Get the dimensions of each element of a list-like object}

\description{
  Get the dimensions, number of rows, or number of columns, of each element
  of a list-like object.

  Note that these functions are the \emph{vectorized versions} of
  corresponding functions \code{dim()}, \code{nrow()}, and \code{ncol()},
  in the same fashion that \code{lengths()} is the \emph{vectorized version}
  of \code{length}.
}

\usage{
dims(x, use.names=TRUE)
nrows(x, use.names=TRUE)
ncols(x, use.names=TRUE)
}

\arguments{
  \item{x}{
    List-like object (or environment) where all the list elements
    are expected to be array-like objects with the \emph{same number
    of dimensions}.
  }
  \item{use.names}{
    Logical indicating if the names on \code{x} should be propagated to
    the returned matrix (as its rownames) or vector (as its names).
  }
}

\value{
  For \code{dims()}: Typically a numeric matrix with one row per list element
  in \code{x} and one column per dimension in these list elements (they're
  all expected to have the same number of dimensions). The i-th row in the
  returned matrix is a vector containing the dimensions of the i-th list
  element in \code{x}. More formally:
\preformatted{  dims(x)[i, ] is dim(x[[i]])}
  for any valid \code{i}.
  By default the names on \code{x}, if any, are propagated as the rownames
  of the returned matrix, unless \code{use.names} is set to \code{FALSE}.

  For \code{nrows()} or \code{ncols()}: A numeric vector with one element
  per list element in \code{x}. The i-th element in the returned vector is
  the number of rows (or columns) of the i-th list element in \code{x}.
  More formally:
\preformatted{  nrows(x)[i] is nrow(x[[i]]) and ncols(x)[i] is ncol(x[[i]])}
  for any valid \code{i}.
  By default the names on \code{x}, if any, are propagated on the returned
  vector, unless \code{use.names} is set to \code{FALSE}.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{dims,DataFrameList-method} in the
          \pkg{IRanges} package for an example of a specific
          \code{dims} method (defined for \link[IRanges]{DataFrameList}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
dims
showMethods("dims")

library(IRanges)
showMethods("dims")
selectMethod("dims", "DataFrameList")
}

\keyword{methods}
