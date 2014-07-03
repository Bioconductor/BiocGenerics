\name{table}

\alias{table}

\title{Cross tabulation and table creation}

\description{
  \code{table} uses the cross-classifying factors to build a contingency
  table of the counts at each combination of factor levels.

  NOTE: This man page is for the \code{table} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{table}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
table(...)
}

\arguments{
  \item{...}{
    One or more objects which can be interpreted as factors
    (including character strings), or a list (or data frame)
    whose components can be so interpreted.
  }
}

\value{
  See \code{?base::\link[base]{table}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should also
  return the type of object returned by the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{table}} for the default \code{table} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{table,Rle-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{table} method (defined for
          \link[S4Vectors]{Rle} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
table
showMethods("table")
selectMethod("table", "ANY")  # the default method
}

\keyword{methods}
