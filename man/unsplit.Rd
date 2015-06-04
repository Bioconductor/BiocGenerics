\name{unsplit}

\alias{unsplit}

\title{Unsplit a list-like object}

\description{
  Given a list-like object \code{value} and grouping \code{f},
  \code{unsplit} produces a vector-like object \code{x} by conceptually
  reversing the split operation \code{value <- split(x, f)}.

  NOTE: This man page is for the \code{unsplit}
  \emph{S4 generic function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{unsplit}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
unsplit(value, f, drop=FALSE)
}

\arguments{
  \item{value}{
    A list-like object.
  }
  \item{f}{
    A factor or other grouping object that corresponds to the \code{f}
    symbol in \code{value <- split(x, f)}.
  }
  \item{drop}{
    See \code{?base::\link[base]{unsplit}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{unsplit}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{unsplit}} for the default
          \code{unsplit} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{unsplit,List-method} in the \pkg{IRanges} package
          for an example of a specific \code{unsplit} method (defined for
          \link[S4Vectors]{List} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
unsplit  # note the dispatch on the 'value' and 'f' args only
showMethods("unsplit")
selectMethod("unsplit", "ANY")  # the default method
}

\keyword{methods}
