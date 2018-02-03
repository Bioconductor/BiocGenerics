\name{strand}

\alias{strand}
\alias{strand<-}
\alias{unstrand}
\alias{invertStrand}
\alias{invertStrand,ANY-method}

\title{Accessing strand information}

\description{
  Get or set the strand information contained in an object.
}

\usage{
strand(x, ...)
strand(x, ...) <- value

unstrand(x)

invertStrand(x)
\S4method{invertStrand}{ANY}(x)
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

\details{
  All the \code{strand} methods defined in the \pkg{GenomicRanges} package
  use the same set of 3 values (called the "standard strand levels") to
  specify the strand of a genomic location: \code{+}, \code{-}, and \code{*}.
  \code{*} is used when the exact strand of the location is unknown,
  or irrelevant, or when the "feature" at that location belongs to
  both strands.

  Note that \code{unstrand} is not a generic function, just a convenience
  wrapper to the generic \code{strand()} setter (\code{strand<-}) that does:
\preformatted{  strand(x) <- "*"
  x
}
  The default method for \code{invertStrand} does:
\preformatted{  strand(x) <- invertStrand(strand(x))
  x
}
}

\value{
  If \code{x} is a vector-like object, \code{strand(x)} will typically
  return a vector-like object \emph{parallel} to \code{x}, that is, an
  object of the same length as \code{x} where the i-th element describes
  the strand of the i-th element in \code{x}.

  \code{unstrand(x)} and \code{invertStrand(x)} return a copy of \code{x}
  with the strand set to \code{"*"} for \code{unstrand} or inverted for
  \code{invertStrand} (i.e. \code{"+"} and \code{"-"} switched, and
  \code{"*"} untouched).
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

`strand<-`
showMethods("strand<-")

unstrand

invertStrand
showMethods("invertStrand")
selectMethod("invertStrand", "ANY")  # the default method

library(GenomicRanges)

showMethods("strand")
selectMethod("strand", "missing")
strand()

showMethods("strand<-")
}

\keyword{methods}
