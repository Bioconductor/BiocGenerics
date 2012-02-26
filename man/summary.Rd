\name{summary}

\alias{summary}

\title{Object Summaries}

\description{
  This man page is for the \code{summary} S4 generic function defined in
  the BiocGenerics package.  See \code{?base::\link[base]{summary}}
  for the default methods (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects not
  supported by the default method.
}

\usage{
summary(object, ...)
}

\arguments{
  \item{object, ...}{See \code{?base::\link[base]{summary}}.}
}

\value{See \code{?base::\link[base]{summary}}.}

\seealso{

  \code{\link[base]{summary}} in the \pkg{base} package for default
  methods.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of a
  specific method.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
summary
showMethods("summary")
selectMethod("summary", "ANY")  # the default method
}

\keyword{methods}
