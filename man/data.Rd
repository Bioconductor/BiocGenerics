\name{data}

\alias{data}
\alias{data,ANY-method}
\alias{data,missing-method}

\title{Data Sets}

\description{
  Loads specified data sets, or list the available data sets.

  NOTE: This man page is for the \code{data} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?utils::\link[utils]{data}} for the default method
  (defined in the \pkg{utils} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
#data(x, ...)
}

\arguments{
  \item{x}{
    A character string, possibly unquoted, or an object for which
    a \code{data()} method is defined.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  See \code{?utils::\link[utils]{data}} for the value returned by the
  default method.
}

\seealso{
  \itemize{
    \item \code{utils::\link[utils]{data}} for the default \code{data} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
data  # note the dispatch on the 'x' arg only
showMethods("data")
selectMethod("data", "ANY")  # the default method
}

\keyword{methods}
