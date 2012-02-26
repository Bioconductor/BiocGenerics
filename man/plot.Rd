\name{plot}

\alias{plot}

\title{Generic X-Y Plotting}

\description{
  This man page is for the \code{plot} S4 generic function defined in
  the BiocGenerics package.  See \code{?graphics::\link[graphics]{plot}}
  for the default methods (defined in the \pkg{graphics} package).
  Bioconductor packages can define specific methods for objects not
  supported by the default method.
}

\usage{
plot(x, y, ...)
}

\arguments{
  \item{x, y, ...}{See \code{?graphics::\link[graphics]{plot}}.}
}

\value{See \code{?graphics::\link[graphics]{plot}}.}

\seealso{

  \code{\link[graphics]{plot}} in the \pkg{graphics} package for default
  methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of a
  specific method.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
plot
showMethods("plot")
selectMethod("plot", "ANY")  # the default method
}

\keyword{methods}
