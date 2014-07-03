\name{as.vector}

\alias{as.vector}

\title{Coerce an object into a vector}

\description{
  Attempt to coerce an object into a vector of the specified mode.
  If the mode is not specified, attempt to coerce to whichever vector
  mode is considered more appropriate for the class of the supplied
  object.

  NOTE: This man page is for the \code{as.vector}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{as.vector}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
as.vector(x, mode="any")
}

\arguments{
  \item{x}{
    The object to coerce.
  }
  \item{mode}{
    See \code{?base::\link[base]{as.vector}} for a description of
    this argument.
  }
}

\value{
  A vector.

  See \code{?base::\link[base]{as.vector}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{as.vector}} for the default
          \code{as.vector} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{as.vector,Rle-method} and
          \link[IRanges]{as.vector,AtomicList-method} in the \pkg{S4Vectors}
          and \pkg{IRanges} packages, respectively, for examples of specific
          \code{as.vector} methods (defined for \link[S4Vectors]{Rle} and
          \link[IRanges]{AtomicList} objects, respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
as.vector  # note the dispatch on the 'x' arg only
showMethods("as.vector")
selectMethod("as.vector", "ANY")  # the default method
}

\keyword{methods}
