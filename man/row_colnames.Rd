\name{row+colnames}

\alias{row+colnames}
\alias{rownames}
\alias{rownames<-}
\alias{colnames}
\alias{colnames<-}

\title{Row and column names}

\description{
  Get or set the row or column names of a matrix-like object.

  NOTE: This man page is for the \code{rownames}, \code{`rownames<-`},
  \code{colnames}, and \code{`colnames<-`} \emph{S4 generic functions}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{rownames}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically matrix-like) not supported by the default methods.
}

\usage{
rownames(x, do.NULL=TRUE, prefix="row")
rownames(x) <- value

colnames(x, do.NULL=TRUE, prefix="col")
colnames(x) <- value
}

\arguments{
  \item{x}{
    A matrix-like object.
  }
  \item{do.NULL, prefix}{
    See \code{?base::\link[base]{rownames}} for a description of
    these arguments.
  }
  \item{value}{
    Either \code{NULL} or a character vector equal of length equal to the
    appropriate dimension.
  }
}

\value{
  The getters will return \code{NULL} or a character vector of length
  \code{\link{nrow}(x)} for \code{rownames} and length \code{\link{ncol}(x)}
  for \code{colnames(x)}.

  See \code{?base::\link[base]{rownames}} for more information about the
  default methods, including how the setters are expected to behave.

  Specific methods defined in Bioconductor packages should 
  behave as consistently as possible with the default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{rownames}} for the default \code{rownames},
          \code{`rownames<-`}, \code{colnames}, and \code{`colnames<-`}
          methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{rownames,DataFrame-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{rownames} method (defined
          for \link[S4Vectors]{DataFrame} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
## rownames() getter:
rownames  # note the dispatch on the 'x' arg only
showMethods("rownames")
selectMethod("rownames", "ANY")  # the default method

## rownames() setter:
`rownames<-`
showMethods("rownames<-")
selectMethod("rownames<-", "ANY")  # the default method

## colnames() getter:
colnames  # note the dispatch on the 'x' arg only
showMethods("colnames")
selectMethod("colnames", "ANY")  # the default method

## colnames() setter:
`colnames<-`
showMethods("colnames<-")
selectMethod("colnames<-", "ANY")  # the default method
}

\keyword{methods}
