\name{boxplot}

\alias{boxplot}

\title{Box plots}

\description{
  Produce box-and-whisker plot(s) of the given (grouped) values.

  NOTE: This man page is for the \code{boxplot} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?graphics::\link[graphics]{boxplot}} for the default method
  (defined in the \pkg{graphics} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
boxplot(x, ...)
}

\arguments{
  \item{x, ...}{
    See \code{?graphics::\link[graphics]{boxplot}}.
  }
}

\value{
  See \code{?graphics::\link[graphics]{boxplot}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{graphics::\link[graphics]{boxplot}} for the default
          \code{boxplot} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[oligo]{boxplot,FeatureSet-method} in the \pkg{oligo} package
          for an example of a specific \code{boxplot} method (defined for
          \link[oligoClasses]{FeatureSet} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
boxplot
showMethods("boxplot")
selectMethod("boxplot", "ANY")  # the default method
}

\keyword{methods}
