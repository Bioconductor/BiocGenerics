\name{subset}

\alias{subset}

\title{Subsetting vector-like, matrix-like and data-frame-like objects}

\description{
  Return subsets of vector-like, matrix-like or data-frame-like objects
  which meet conditions.

  NOTE: This man page is for the \code{subset} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{subset}} for the \code{subset} S3 generic
  defined in the \pkg{base} package.
}

\usage{
subset(x, ...)
}

\arguments{
  \item{x}{
    A vector-like, matrix-like or data-frame-like object to be subsetted.
  }
  \item{...}{
    Additional arguments (e.g. \code{subset}, \code{select}, \code{drop}),
    for use in specific methods. See \code{?base::\link[base]{subset}} for
    more information.
  }
}

\value{
  An object similar to \code{x} containing just the selected elements (for a
  vector-like object), or the selected rows and columns (for a matrix-like or
  data-frame-like object).
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{subset}} in the \pkg{base} package
          for the \code{subset} S3 generic.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{subset,DataTable-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{subset} method (defined
          for \link[S4Vectors]{DataTable} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
subset
showMethods("subset")
selectMethod("subset", "ANY")  # the default method

library(S4Vectors)
showMethods("subset")
selectMethod("subset", "DataTable")  # the "subset" method for
                                     # DataTable objects
}

\keyword{methods}
