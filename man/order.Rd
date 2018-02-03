\name{order}

\alias{order}

\title{Ordering permutation}

\description{
  \code{order} returns a permutation which rearranges its first argument
  into ascending or descending order, breaking ties by further
  arguments.

  NOTE: This man page is for the \code{order} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{order}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
order(..., na.last=TRUE, decreasing=FALSE, method=c("auto", "shell", "radix"))
}

\arguments{
  \item{...}{
    One or more vector-like objects, all of the same length.
  }
  \item{na.last, decreasing, method}{
    See \code{?base::\link[base]{order}} for a description of
    these arguments.
  }
}

\value{
  The default method (see \code{?base::\link[base]{order}}) returns
  an integer vector of length N where N is the common length of the
  input objects. This integer vector represents a permutation of N
  elements and can be used to rearrange the first argument in
  \code{...} into ascending or descending order (by subsetting it).

  Specific methods defined in Bioconductor packages should also
  return an integer vector representing a permutation of N elements.
}

\note{
  TO DEVELOPERS:

  Specific \code{order} methods should preferably be made "stable" for
  consistent behavior across platforms and consistency with
  \code{base::order()}. Note that C qsort() is \emph{not} "stable" so
  \code{order} methods that use qsort() at the C-level need to ultimately
  break ties by position, which can easily be done by adding a little
  extra code at the end of the comparison function passed to qsort().

  \code{order(x, decreasing=TRUE)} is \emph{not} always equivalent to
  \code{rev(order(x))}.

  \code{\link[BiocGenerics]{order}}, \code{\link[BiocGenerics]{sort}},
  and \code{\link[BiocGenerics]{rank}} methods for specific vector-like
  objects should adhere to the same underlying order that should be
  conceptually defined as a binary relation on the set of all possible
  vector values. For completeness, this binary relation should also be
  incarnated by a \link{<=} method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{order}} for the default \code{order} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{order,IntegerRanges-method} in the \pkg{IRanges}
          package for an example of a specific \code{order} method (defined
          for \link[IRanges]{IntegerRanges} objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
order
showMethods("order")
selectMethod("order", "ANY")  # the default method
}

\keyword{methods}
