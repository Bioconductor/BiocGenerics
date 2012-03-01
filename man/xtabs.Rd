\name{xtabs}

\alias{xtabs}

\title{Cross tabulation}

\description{
  \code{xtabs} creates a contingency table (optionally a sparse matrix) from
  cross-classifying factors, usually contained in a data-frame-like object,
  using a formula interface.

  NOTE: This man page is for the \code{xtabs} S4 generic function
  defined in the BiocGenerics package.
  See \code{?stats::\link[stats]{xtabs}} for the default method
  (defined in the stats package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
xtabs(formula=~., data=parent.frame(), subset, sparse=FALSE, 
      na.action, exclude=c(NA, NaN), drop.unused.levels=FALSE)
}

\arguments{
  \item{formula, subset, sparse, na.action, exclude, drop.unused.levels}{
    See \code{?stats::\link[stats]{xtabs}} for a description of
    these arguments.
  }
  \item{data}{
    A data-frame-like R object.
  }
}

\value{
  See \code{?stats::\link[stats]{xtabs}} for the value returned by the
  default method.

  Specific methods defined in other Bioconductor packages should also
  return the type of object returned by the default method.
}

\seealso{
  \code{stats::\link[stats]{xtabs}} for the default \code{xtabs} method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{xtabs,DataTable-method} in the IRanges package
  for the method defined for \link[IRanges]{DataTable} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
xtabs  # note the dispatch on the 'data' arg only
showMethods("xtabs")
selectMethod("xtabs", "ANY")  # the default method
}

\keyword{methods}
