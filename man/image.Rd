\name{image}

\alias{image}

\title{Display a color image}

\description{
  Creates a grid of colored or gray-scale rectangles with colors
  corresponding to the values in \code{z}.
  This can be used to display three-dimensional or spatial data aka
  \emph{images}.

  NOTE: This man page is for the \code{image} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?graphics::\link[graphics]{image}} for the default method
  (defined in the \pkg{graphics} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
image(x, ...)
}

\arguments{
  \item{x, ...}{
    See \code{?graphics::\link[graphics]{image}}.
  }
}

\details{
  See \code{?graphics::\link[graphics]{image}} for the details.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{graphics::\link[graphics]{image}} for the default \code{image}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[oligo]{image,FeatureSet-method} in the \pkg{oligo} package
          for an example of a specific \code{image} method (defined for
          \link[oligoClasses]{FeatureSet} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
image
showMethods("image")
selectMethod("image", "ANY")  # the default method
}

\keyword{methods}
