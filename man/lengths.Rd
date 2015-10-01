\name{lengths}

\alias{lengths}

\title{Lengths of the list elements of a list-like object}

\description{
  Get the length of each list element of a list-like object.

  NOTE: This man page is for the \code{lengths} \emph{S4 generic
  function} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{lengths}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for list-like
  objects not supported by the default method.
}

\usage{
lengths(x, use.names=TRUE)
}

\arguments{
  \item{x}{
    A list-like object. Can also be a vector-like object that is not
    list-like, in which case the result is trivial.
  }
  \item{use.names}{
    See \code{?base::\link[base]{lengths}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{lengths}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\note{
  IMPORTANT: The default method (\code{base::\link[base]{lengths}})
  is equivalent to \code{sapply(x, length)}. However, because the
  \code{lengths} method for \link[S4Vectors]{Vector} objects is currently
  defined as an alias for \code{S4Vectors::\link[S4Vectors]{elementLengths}},
  it's equivalent to \code{sapply(x, NROW)}, not to \code{sapply(x, length)}.

  This makes a difference if \code{x} has array-like list elements.
  See \code{?base::\link[base]{NROW}} for the difference between
  \code{length()} and \code{NROW()}.
  This difference is illustrated in the Examples section below.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{lengths}} for the default \code{lengths} 
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{lengths,Vector-method} in the \pkg{S4Vectors}
          package for an example of a specific \code{lengths} method (defined
          for \link[S4Vectors]{Vector} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
lengths  # note the dispatch on the 'x' arg only
showMethods("lengths")
selectMethod("lengths", "ANY")  # the default method

library(S4Vectors)
showMethods("lengths")
selectMethod("lengths", "Vector")  # the "lengths" method for Vector
                                   # objects

## Difference between default method and method for Vector objects:
groups <- c("group1", "group2")
df <- data.frame(
    a=letters[1:10],
    i=101:110,
    group=rep(factor(groups, levels=groups), c(3, 7))
)
x1 <- split(df, df$group)
x2 <- split(DataFrame(df), df$group)
lengths(x1)  # dispatch on default method
lengths(x2)  # dispatch on method for Vector objects
}

\keyword{methods}
