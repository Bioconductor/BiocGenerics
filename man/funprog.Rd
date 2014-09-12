\name{funprog}

\alias{funprog}
\alias{Reduce}
\alias{Filter}
\alias{Find}
\alias{Map}
\alias{Position}

\title{Common higher-order functions in functional programming languages}

\description{
  \code{Reduce} uses a binary function to successively combine the
  elements of a given list-like or vector-like object and a possibly
  given initial value.
  \code{Filter} extracts the elements of a list-like or vector-like
  object for which a predicate (logical) function gives true.
  \code{Find} and \code{Position} give the first or last such element
  and its position in the object, respectively.
  \code{Map} applies a function to the corresponding elements of given
  list-like or vector-like objects.

  NOTE: This man page is for the \code{Reduce}, \code{Filter},
  \code{Find}, \code{Map} and \code{Position} \emph{S4 generic functions}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{Reduce}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically list-like or vector-like) not supported by the
  default methods.
}

\usage{
Reduce(f, x, init, right=FALSE, accumulate=FALSE)
Filter(f, x)
Find(f, x, right=FALSE, nomatch=NULL)
Map(f, ...)
Position(f, x, right=FALSE, nomatch=NA_integer_)
}

\arguments{
  \item{f, init, right, accumulate, nomatch}{
    See \code{?base::\link[base]{Reduce}} for a description of
    these arguments.
  }
  \item{x}{
    A list-like or vector-like object.
  }
  \item{...}{
    One or more list-like or vector-like objects.
  }
}

\value{
  See \code{?base::\link[base]{Reduce}} for the value returned by the
  default methods.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{Reduce}} for the default \code{Reduce},
          \code{Filter}, \code{Find}, \code{Map} and \code{Position} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[S4Vectors]{Reduce,List-method} in the \pkg{S4Vectors} package
          for an example of a specific \code{Reduce} method (defined for
          \link[S4Vectors]{List} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
Reduce  # note the dispatch on the 'x' arg only
showMethods("Reduce")
selectMethod("Reduce", "ANY")  # the default method

Filter  # note the dispatch on the 'x' arg only
showMethods("Filter")
selectMethod("Filter", "ANY")  # the default method

Find  # note the dispatch on the 'x' arg only
showMethods("Find")
selectMethod("Find", "ANY")  # the default method

Map  # note the dispatch on the '...' arg only
showMethods("Map")
selectMethod("Map", "ANY")  # the default method

Position  # note the dispatch on the 'x' arg only
showMethods("Position")
selectMethod("Position", "ANY")  # the default method
}

\keyword{methods}
