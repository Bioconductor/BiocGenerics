\name{aperm}

\alias{aperm}

\title{Transposing an array-like object}

\description{
  Transpose an array-like object by permuting its dimensions.

  This is a multidimensional generalization of the
  \code{\link[BiocGenerics]{t}()} operator used for 2D-transposition.

  NOTE: This man page is for the \code{aperm}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{aperm}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
aperm(a, perm, ...)
}

\arguments{
  \item{a}{
    An array-like object.
  }
  \item{perm, ...}{
    See \code{?base::\link[base]{aperm}} for a description of
    these arguments.
  }
}

\value{
  A transposed version of array-like object \code{a}, with subscripts
  permuted as indicated by the \code{perm} vector.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{aperm}} for the default
          \code{aperm} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{aperm,DelayedArray-method} in the
          \pkg{DelayedArray} package for an example of a specific
          \code{aperm} method (defined for \link[DelayedArray]{DelayedArray}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
aperm  # note the dispatch on the 'a' arg only
showMethods("aperm")
selectMethod("aperm", "ANY")  # the default method
}

\keyword{methods}
