\name{score}

\alias{score}
\alias{score<-}

\title{Score accessor}

\description{
  Get or set the score value contained in an object.
}

\usage{
score(x, ...)
score(x, ...) <- value
}

\arguments{
  \item{x}{
    An object to get or set the score value of.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
  \item{value}{
    The score value to set on \code{x}.
  }
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[GenomicRanges]{score,GenomicRanges-method} in the
          \pkg{GenomicRanges} package for an example of a specific
          \code{score} method (defined for \link[GenomicRanges]{GenomicRanges}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
score
showMethods("score")

`score<-`
showMethods("score<-")

library(GenomicRanges)

showMethods("score")
selectMethod("score", "GenomicRanges")

showMethods("score<-")
selectMethod("score<-", "GenomicRanges")
}

\keyword{methods}
