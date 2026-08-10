\name{group}

\alias{group}

\title{Accessing the "group" of an object}

\description{
  An S4 generic function to get the "group" of an object.
  
  Note that the "group" of an object is only defined for some types of
  objects e.g. for \link[HDF5Array]{H5SparseMatrix} objects from the
  \pkg{HDF5Array} package or \link[ZarrArray]{ZarrSparseMatrix} objects
  from the \pkg{ZarrArray} package. Also the exact meaning of "group"
  depends on the type of object that is considered.
}

\usage{
group(object, ...)
}

\arguments{
  \item{object}{
    An object for which the notion of "group" is defined.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[HDF5Array]{group,H5SparseMatrixSeed-method} in the
          \pkg{HDF5Array} package for an example of a specific \code{group}
          method (defined for \link[HDF5Array]{H5SparseMatrixSeed} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
group
showMethods("group")

library(HDF5Array)
showMethods("group")
selectMethod("group", "H5SparseMatrixSeed")
}

\keyword{methods}
