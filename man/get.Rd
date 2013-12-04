\name{get}

\alias{get}
\alias{mget}

\title{Return the value of a named object}

\description{
  Search for an object with a given name and return it.

  NOTE: This man page is for the \code{get} and \code{mget} \emph{S4 generic
  functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{get}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (list-like or environment-like) not supported by the default methods.
}

\usage{
get(x, pos=-1, envir=as.environment(pos), mode="any", inherits=TRUE)
mget(x, envir, mode="any", ifnotfound, inherits=FALSE)
}

\arguments{
  \item{x}{
    For \code{get}: A variable name (or, more generally speaking,
    a \emph{key}), given as a single string.

    For \code{mget}: A vector of variable names (or \emph{keys}).
  }
  \item{envir}{
    Where to look for the key(s). Typically a list-like or environment-like
    object.
  }
  \item{pos, mode, inherits, ifnotfound}{
    See \code{?base::\link[base]{get}} for a description of
    these arguments.
  }
}

\details{
  See \code{?base::\link[base]{get}} for details about the default methods.
}

\value{
  For \code{get}: The value corresponding to the specified key.

  For \code{mget}: The list of values corresponding to the specified keys.
  The returned list must have one element per key, and in the same order
  as in \code{x}.

  See \code{?base::\link[base]{get}} for the value returned by the
  default methods.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{get}} for the default \code{get} and
          \code{mget} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[AnnotationDbi]{get,ANY,Bimap,missing-method} in the
          \pkg{AnnotationDbi} package for an example of a specific \code{get}
          method (defined for \link[AnnotationDbi]{Bimap} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
get  # note the dispatch on the 'x', 'pos' and 'envir' args only
showMethods("get")
selectMethod("get", c("ANY", "ANY", "ANY"))  # the default method

mget  # note the dispatch on the 'x' and 'envir' args only
showMethods("mget")
selectMethod("mget", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
