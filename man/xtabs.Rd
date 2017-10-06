\name{xtabs}

\alias{xtabs}

\title{Cross tabulation}

\description{
  \code{xtabs} creates a contingency table (optionally a sparse matrix) from
  cross-classifying factors, usually contained in a data-frame-like object,
  using a formula interface.

  NOTE: This man page is for the \code{xtabs} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{xtabs}} for the default method
  (defined in the \pkg{stats} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
xtabs(formula=~., data=parent.frame(), subset, sparse=FALSE, 
      na.action, addNA=FALSE, exclude=if(!addNA)c(NA, NaN),
      drop.unused.levels=FALSE)
}

\arguments{
  \item{formula, subset, sparse, na.action, addNA, exclude, drop.unused.levels}{
    See \code{?stats::\link[stats]{xtabs}} for a description of
    these arguments.
  }
  \item{data}{
    A data-frame-like object.
  }
}

\value{
  See \code{?stats::\link[stats]{xtabs}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should also
  return the type of object returned by the default method.
}

\seealso{
  \itemize{
    \item \code{stats::\link[stats]{xtabs}} for the default \code{xtabs}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{xtabs,DataTable-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{xtabs} method (defined
          for \link[S4Vectors]{DataTable} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
xtabs  # note the dispatch on the 'data' arg only
showMethods("xtabs")
selectMethod("xtabs", "ANY")  # the default method
}

\keyword{methods}
