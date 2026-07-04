\name{detail}

\alias{detail}
\alias{detail,ANY-method}

\title{Show (display) detailed object content}

\description{
  This is a variant of \code{\link[methods]{show}()}, offering a more
  detailed display of object content.
}

\usage{
detail(object)

## Default method that simply invokes show():

\S4method{detail}{ANY}(object)
}

\arguments{
  \item{object}{
    The object to display.
  }
}

\value{
  None; the function is invoked for its side effect (detailed display of
  object content).
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[MultipleAlignment]{detail,MultipleAlignment-method}
          in the \pkg{MultipleAlignment} package for an example of a
          specific \code{detail} method (defined for
          \link[MultipleAlignment]{MultipleAlignment} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
detail
showMethods("detail")

library(MultipleAlignment)
showMethods("detail")
selectMethod("detail", "MultipleAlignment")
}

\keyword{methods}
