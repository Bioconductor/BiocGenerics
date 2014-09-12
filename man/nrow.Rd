\name{nrow}

\alias{nrow}
\alias{ncol}
\alias{NROW}
\alias{NCOL}

\title{The number of rows/columns of an array-like object}

\description{
  Return the number of rows or columns present in an array-like object.

  NOTE: This man page is for the \code{nrow}, \code{ncol}, \code{NROW} and
  \code{NCOL} \emph{S4 generic functions} defined in the \pkg{BiocGenerics}
  package.
  See \code{?base::\link[base]{nrow}} for the default methods (defined in
  the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically matrix- or array-like) not supported by the default methods.
}

\usage{
nrow(x)
ncol(x)
NROW(x)
NCOL(x)
}

\arguments{
  \item{x}{
    A matrix- or array-like object.
  }
}

\value{
  A single integer or \code{NULL}.

  Specific methods defined in Bioconductor packages should 
  behave as consistently as possible with the default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{nrow}} for the default \code{nrow},
          \code{ncol}, \code{NROW} and \code{NCOL} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{nrow,DataFrame-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{nrow} method (defined
          for \link[S4Vectors]{DataFrame} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
nrow
showMethods("nrow")
selectMethod("nrow", "ANY")  # the default method

ncol
showMethods("ncol")
selectMethod("ncol", "ANY")  # the default method

NROW
showMethods("NROW")
selectMethod("NROW", "ANY")  # the default method

NCOL
showMethods("NCOL")
selectMethod("NCOL", "ANY")  # the default method
}

\keyword{methods}
