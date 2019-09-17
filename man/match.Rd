\name{match}

\alias{match}
\alias{\%in\%}

\title{Value matching}

\description{
  \code{match} returns a vector of the positions of (first) matches of
  its first argument in its second.

  \code{\%in\%} is a binary operator that returns a logical vector of the
  length of its left operand indicating if the elements in it have a match
  or not.

  NOTE: This man page is for the \code{match} and \code{\%in\%} \emph{S4
  generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{match}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default methods.
}

\usage{
match(x, table, nomatch=NA_integer_, incomparables=NULL, ...)

x \%in\% table
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
  The same as the default methods (see \code{?base::\link[base]{match}} for
  the value returned by the default methods).

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default methods.
}

\note{
  The default \code{base::\link[base]{match}} method (defined in the \pkg{base}
  package) doesn't have the \code{...} argument. We've added it to the generic
  function defined in the \pkg{BiocGenerics} package in order to allow specific
  methods to support additional arguments if needed.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{match}} for the default \code{match} and
          \code{\%in\%} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{match,Hits,Hits-method} and
          \link[S4Vectors]{\%in\%,Rle,ANY-method} in the \pkg{S4Vectors}
          package for examples of specific \code{match} and \code{\%in\%}
          methods (defined for \link[S4Vectors]{Hits} and
          \link[S4Vectors]{Rle} objects, respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
match  # note the dispatch on the 'x' and 'table' args only
showMethods("match")
selectMethod("match", c("ANY", "ANY"))  # the default method

`\%in\%`
showMethods("\%in\%")
selectMethod("\%in\%", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
