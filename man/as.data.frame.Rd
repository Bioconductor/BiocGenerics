\name{as.data.frame}

\alias{as.data.frame}

\title{Coerce an object into a data frame}

\description{
  Function to coerce to a data frame, if possible.

  NOTE: This man page is for the \code{as.data.frame}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{as.data.frame}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
as.data.frame(x, row.names=NULL, optional=FALSE, ...)
}

\arguments{
  \item{x}{
    The object to coerce.
  }
  \item{row.names, optional, ...}{
    See \code{?base::\link[base]{as.data.frame}} for a description of
    these arguments.
  }
}

\value{
  A data frame.

  See \code{?base::\link[base]{as.data.frame}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{as.data.frame}} for the default
          \code{as.data.frame} method.

    \item \code{\link[BiocGenerics]{toTable}} for an alternative to
          \code{as.data.frame}.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{as.data.frame,DataFrame-method} in the
          \pkg{S4Vectors} package, and
          \link[IRanges]{as.data.frame,IntegerRanges-method} in the
          \pkg{IRanges} package, for examples of specific \code{as.data.frame}
          methods (defined for \link[S4Vectors]{DataFrame} and
          \link[IRanges]{IntegerRanges} objects, respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
as.data.frame  # note the dispatch on the 'x' arg only
showMethods("as.data.frame")
selectMethod("as.data.frame", "ANY")  # the default method
}

\keyword{methods}
