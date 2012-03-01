\name{row+colnames}

\alias{row+colnames}
\alias{rownames}
\alias{colnames}

\title{Row and column names}

\description{
  Retrieve the row or column names of a matrix-like R object.

  NOTE: This man page is for the \code{rownames} and \code{colnames}
  S4 generic functions defined in the BiocGenerics package.
  See \code{?base::\link[base]{rownames}} for the default methods
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically matrix-like) not supported by the default methods.
}

\usage{
rownames(x, do.NULL=TRUE, prefix="row")
colnames(x, do.NULL=TRUE, prefix="col")
}

\arguments{
  \item{x}{
    A matrix-like R object.
  }
  \item{do.NULL, prefix}{
    See \code{?base::\link[base]{rownames}} for a description of
    these arguments.
  }
}

\value{
  \code{NULL} or a character vector of length \code{\link{nrow}(x)}
  for \code{rownames} and \code{\link{ncol}(x)} for \code{colnames(x)}.
  See \code{?base::\link[base]{rownames}} for more information about the
  default methods.

  Specific methods defined in other Bioconductor packages should 
  behave as consistently as possible with the default methods.
}

\seealso{
  \code{base::\link[base]{rownames}} for the default \code{rownames} and
  \code{colnames} methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{rownames,DataFrame-method} in the IRanges package
  for the \code{rownames} method defined for \link[IRanges]{DataFrame}
  objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
rownames  # note the dispatch on the 'x' arg only
showMethods("rownames")
selectMethod("rownames", "ANY")  # the default method

colnames  # note the dispatch on the 'x' arg only
showMethods("colnames")
selectMethod("colnames", "ANY")  # the default method
}

\keyword{methods}
