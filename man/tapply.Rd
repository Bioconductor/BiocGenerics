\name{tapply}

\alias{tapply}

\title{Apply a function over a ragged array}

\description{
  \code{tapply} applies a function to each cell of a ragged array,
  that is to each (non-empty) group of values given by a unique
  combination of the levels of certain factors.

  NOTE: This man page is for the \code{tapply} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{tapply}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically list-like or vector-like) not supported by the
  default methods.
}

\usage{
tapply(X, INDEX, FUN=NULL, ..., simplify=TRUE)
}

\arguments{
  \item{X}{
    A list-like or vector-like R object.
  }
  \item{INDEX, FUN, ..., simplify}{
    See \code{?base::\link[base]{tapply}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{tapply}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages should 
  behave as consistently as possible with the default method.
}

\seealso{
  \code{base::\link[base]{tapply}} for the default \code{tapply} method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{tapply,Vector-method} in the IRanges package
  for the \code{tapply} method defined for \link[IRanges]{Vector}
  objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
tapply  # note the dispatch on the 'X' arg only
showMethods("tapply")
selectMethod("tapply", "ANY")  # the default method
}

\keyword{methods}
