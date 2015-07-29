\name{IQR}

\alias{IQR}

\title{The Interquartile Range}

\description{
  Compute the interquartile range for a vector.

  NOTE: This man page is for the \code{IQR} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{IQR}} for the default method
  (defined in the \pkg{stats} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
IQR(x, na.rm = FALSE, type = 7)
}

\arguments{
  \item{x, na.rm, type}{
    See \code{?stats::\link[stats]{IQR}}.
  }
}

\value{
  See \code{?stats::\link[stats]{IQR}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{stats::\link[stats]{IQR}} for the default
          \code{IQR} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
IQR
showMethods("IQR")
selectMethod("IQR", "ANY")  # the default method
}

\keyword{methods}
