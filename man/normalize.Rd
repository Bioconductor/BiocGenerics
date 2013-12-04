\name{normalize}

\alias{normalize}

\title{Normalize an object}

\description{
  A generic function which normalizes an object containing microarray data
  or other data.
  Normalization is intended to remove from the intensity measures any
  systematic trends which arise from the microarray technology rather than
  from differences between the probes or between the target RNA samples
  hybridized to the arrays.
}

\usage{
normalize(object, ...)
}

\arguments{
  \item{object}{
    A data object, typically containing microarray data.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  An object containing the normalized data.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[affy]{normalize,AffyBatch-method} in the \pkg{affy} package
          and \link[oligo]{normalize,FeatureSet-method} in the \pkg{oligo}
          package for examples of specific \code{normalize} methods (defined
          for \link[affy]{AffyBatch} and \link[oligoClasses]{FeatureSet}
          objects, respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
normalize
showMethods("normalize")

library(affy)
showMethods("normalize")
selectMethod("normalize", "AffyBatch")
}

\keyword{methods}
