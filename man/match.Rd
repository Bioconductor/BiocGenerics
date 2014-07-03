\name{match}

\alias{match}

\title{Value matching}

\description{
  \code{match} returns a vector of the positions of (first) matches of
  its first argument in its second.

  NOTE: This man page is for the \code{match} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{match}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
match(x, table, nomatch=NA_integer_, incomparables=NULL, ...)
}

\arguments{
  \item{x, table}{
    Vector-like objects (typically of the same class, but not necessarily).
  }
  \item{nomatch, incomparables}{
    See \code{?base::\link[base]{match}} for a description of
    these arguments.
  }
  \item{...}{
    Additional arguments, for use in specific methods.
  }
}

\value{
  The same as the default method, that is, an integer vector of the same
  length as \code{x} giving the position in \code{table} of the first match
  if there is a match, otherwise \code{nomatch}.

  See \code{?base::\link[base]{match}} for more details.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\note{
  The default method (defined in the \pkg{base} package) doesn't have the
  \code{...} argument. We've added it to the generic function defined
  in the \pkg{BiocGenerics} package in order to allow specific methods to
  support additional arguments if needed.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{match}} for the default \code{match} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{match,Hits,Hits-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{match} method (defined
          for \link[S4Vectors]{Hits} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
match  # note the dispatch on the 'x' and 'table' args only
showMethods("match")
selectMethod("match", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
