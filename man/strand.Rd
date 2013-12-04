\name{strand}

\alias{strand}
\alias{strand<-}

\title{Accessing strand information}

\description{
  Get or set the strand information contained in an object.
}

\usage{
strand(x, ...)
strand(x, ...) <- value
}

\arguments{
  \item{x}{
    An object containing strand information.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
  \item{value}{
    The strand information to set on \code{x}.
  }
}

\note{
  All the \code{strand} methods defined in the \pkg{GenomicRanges} package
  use the same set of 3 values (levels) to specify the strand of a
  genomic location: \code{+}, \code{-}, and \code{*}.
  \code{*} is used when the exact strand of the location is unknown,
  or irrelevant, or when the "feature" at that location belongs to
  both strands.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[GenomicRanges]{strand,GRanges-method} in the
          \pkg{GenomicRanges} package for an example of a specific
          \code{strand} method (defined for \link[GenomicRanges]{GRanges}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
strand
showMethods("strand")

library(GenomicRanges)
showMethods("strand")
selectMethod("strand", "missing")
strand()
}

\keyword{methods}
