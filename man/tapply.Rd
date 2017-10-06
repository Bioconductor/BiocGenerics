\name{tapply}

\alias{tapply}

\title{Apply a function over a ragged array}

\description{
  \code{tapply} applies a function to each cell of a ragged array,
  that is to each (non-empty) group of values given by a unique
  combination of the levels of certain factors.

  NOTE: This man page is for the \code{tapply} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{tapply}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically list-like or vector-like) not supported by the
  default method.
}

\usage{
tapply(X, INDEX, FUN=NULL, ..., default=NA, simplify=TRUE)
}

\arguments{
  \item{X}{
    The default method expects an atomic object, typically a vector.
    See \code{?base::\link[base]{tapply}} for the details.

    Specific methods can support other objects (typically list-like
    or vector-like).
    Please refer to the documentation of a particular method for the details.
  }
  \item{INDEX}{
    The default method expects a list of one or more factors, each of same
    length as \code{X}.
    See \code{?base::\link[base]{tapply}} for the details.

    Specific methods can support other objects (typically list-like).
    Please refer to the documentation of a particular method for the details.
  }
  \item{FUN, ..., default, simplify}{
    See \code{?base::\link[base]{tapply}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{tapply}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should 
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{tapply}} for the default \code{tapply}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{tapply,Vector,ANY-method} in the \pkg{IRanges}
          package for an example of a specific \code{tapply} method (defined
          for \link[S4Vectors]{Vector} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
tapply  # note the dispatch on the 'X' and 'INDEX' args only
showMethods("tapply")
selectMethod("tapply", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
