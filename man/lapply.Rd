\name{lapply}

\alias{lapply}
\alias{sapply}

\title{Apply a function over a list-like or vector-like R object}

\description{
  \code{lapply} returns a list of the same length as \code{X}, each
  element of which is the result of applying \code{FUN} to the
  corresponding element of \code{X}.

  \code{sapply} is a user-friendly version and wrapper of \code{lapply}
  by default returning a vector, matrix or, if \code{simplify="array"},
  an array if appropriate, by applying \code{simplify2array()}.
  \code{sapply(x, f, simplify=FALSE, USE.NAMES=FALSE)} is the same
  as \code{lapply(x, f)}.

  NOTE: This man page is for the \code{lapply} and \code{sapply}
  S4 generic functions defined in the BiocGenerics package.
  See \code{?base::\link[base]{lapply}} for the default methods
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically list-like or vector-like) not supported by the
  default methods.
}

\usage{
lapply(X, FUN, ...)
sapply(X, FUN, ..., simplify=TRUE, USE.NAMES=TRUE)
}

\arguments{
  \item{X}{
    A list-like or vector-like R object.
  }
  \item{FUN, ..., simplify, USE.NAMES}{
    See \code{?base::\link[base]{lapply}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{lapply}} for the value returned by the
  default methods.

  Specific methods defined in other Bioconductor packages should 
  behave as consistently as possible with the default methods.
  In particular, \code{lapply} and \code{sapply(simplify=FALSE)}
  should always return a list.
}

\seealso{
  \code{base::\link[base]{lapply}} for the default \code{lapply} and
  \code{sapply} methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{lapply,List-method} in the IRanges package
  for the \code{lapply} method defined for \link[IRanges]{List}
  objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
lapply  # note the dispatch on the 'X' arg only
showMethods("lapply")
selectMethod("lapply", "ANY")  # the default method

sapply  # note the dispatch on the 'X' arg only
showMethods("sapply")
selectMethod("sapply", "ANY")  # the default method
}

\keyword{methods}
