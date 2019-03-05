\name{toTable}

\alias{toTable}

\title{An alternative to as.data.frame()}

\description{
  \code{toTable()} is an \emph{S4 generic function} provided as an
  alternative to \code{\link[BiocGenerics]{as.data.frame}()}.
}

\usage{
toTable(x, ...)
}

\arguments{
  \item{x}{
    The object to turn into a data frame.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  A data frame.
}

\seealso{
  \itemize{
    \item The \code{\link[BiocGenerics]{as.data.frame}} \emph{S4 generic}
          defined in the \pkg{BiocGenerics} package.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[AnnotationDbi]{toTable,Bimap-method} in the
          \pkg{AnnotationDbi} package for an example of a specific
          \code{toTable} method (defined for \link[AnnotationDbi]{Bimap}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
toTable
showMethods("toTable")

library(AnnotationDbi)
showMethods("toTable")
selectMethod("toTable", "Bimap")
}

\keyword{methods}
