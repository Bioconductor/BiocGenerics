\name{var}

\alias{var}
\alias{sd}

\title{Variance and Standard Deviation}

\description{
  \code{var} and \code{sd} compute the variance and standard deviation
  of a vector \code{x}.

  NOTE: This man page is for the \code{var} and \code{sd},
  \emph{S4 generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?stats::\link[stats]{var}} and \code{?stats::\link[stats]{sd}}
  for the default methods (defined in the \pkg{stats} package).
  Bioconductor packages can define specific methods for objects
  (typically array-like) not supported by the default method.
}

\usage{
     var(x, y = NULL, na.rm = FALSE, use)
     sd(x, na.rm = FALSE)
}

\arguments{
  \item{x}{
    a vector-like object
  }
  \item{y}{
    a vector-like object, or \code{NULL}
  }
  \item{na.rm, use}{see \link[stats]{var}}
}

\value{
  See \code{?stats::\link[stats]{var}} and \code{?stats::\link[stats]{sd}}
  for the value returned by the default methods.

  Specific methods defined in Bioconductor packages will typically
  return an object of the same class as the input object.
}

\seealso{
  \itemize{
    \item \code{stats::\link[stats]{var}} and \code{stats::\link[stats]{sd}}
          for the default methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
var
showMethods("var")
selectMethod("var", "ANY")  # the default method
}

\keyword{methods}
