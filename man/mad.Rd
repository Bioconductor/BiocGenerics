\name{mad}

\alias{mad}

\title{Median Absolute Deviation}

\description{
  Compute the median absolute deviation for a vector, dispatching only
  on the first argument, \code{x}.

  NOTE: This man page is for the \code{mad} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{mad}} for the default method
  (defined in the \pkg{stats} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
mad(x, center = median(x), constant = 1.4826,
    na.rm = FALSE, low = FALSE, high = FALSE)
}

\arguments{
  \item{x, center, constant, na.rm, low, high}{
    See \code{?stats::\link[stats]{mad}}.
  }
}

\value{
  See \code{?stats::\link[stats]{mad}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{stats::\link[stats]{mad}} for the default
          \code{mad} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
mad
showMethods("mad")
selectMethod("mad", "ANY")  # the default method
}

\keyword{methods}
