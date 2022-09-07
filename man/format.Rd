\name{format}

\alias{format}
\alias{format.list}
\alias{format,list-method}

\title{Format an R object for pretty printing}

\description{
  Turn an R object into a character vector used for pretty printing.

  NOTE: This man page is for the \code{format} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{format}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
format(x, ...)
}

\arguments{
  \item{x}{
    The object to format.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  A character vector that provides a "compact representation" of \code{x}.
  This character vector is typically used by \code{print.data.frame} to
  display the columns of a data.frame object.
  See \code{?base::\link[base]{print.data.frame}} for more information.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{format}} for the default \code{format}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
format
showMethods("format")
selectMethod("format", "ANY")  # the default method
}

\keyword{methods}
