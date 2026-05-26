\name{sequence}

\alias{sequence}

\title{Create a vector of sequences}

\description{
  An S4 generic function to create a vector of sequences.

  NOTE: This man page is for the \code{sequence} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{sequence}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
sequence(x, ...)
}

\arguments{
  \item{x}{
    An object for which a specific \code{sequence()} method is defined,
    or a non-negative integer vector in which case the default
    \code{sequence()} method is called.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
    See \code{?base::\link[base]{sequence}} for the additional arguments
    supported by the default method.
  }
}

\value{
  See \code{?base::\link[base]{sequence}} for the value returned by the
  default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{sequence}} for the default \code{sequence}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
sequence
showMethods("sequence")
selectMethod("sequence", "ANY")  # the default method
}

\keyword{methods}
