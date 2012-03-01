\name{order}

\alias{order}

\title{Ordering permutation}

\description{
  \code{order} returns a permutation which rearranges its first argument
  into ascending or descending order, breaking ties by further
  arguments.

  NOTE: This man page is for the \code{order} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{order}} for the default method
  (defined in the base package).
  Bioconductor packages can define specific methods for objects
  (typically vector-like) not supported by the default method.
}

\usage{
order(..., na.last=TRUE, decreasing=FALSE)
}

\arguments{
  \item{...}{
    One or more vector-like R objects, all of the same length.
  }
  \item{na.last, decreasing}{
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

  Specific methods defined in other Bioconductor packages must also
  return an integer vector representing a permutation of N elements.
}

\note{
  TO DEVELOPPERS: Here are 2 common pitfalls when implementing an
  \code{order} method:
  \itemize{
    \item \code{order(x, decreasing=TRUE)} is \emph{not} equivalent
          to \code{rev(order(x))};
    \item It should be made "stable" for consistent behavior across platforms
          and consistency with \code{base::order()}. Note that C qsort() is
          \emph{not} "stable" so \code{order} methods that use qsort() at
          the C-level need to ultimately break ties by position (this is
          generally done by adding a little extra code at the end of the
          comparison function used in the calls to qsort()).
  }
}

\seealso{
  \code{base::\link[base]{order}} for the default \code{order} method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{order,Ranges-method} in the IRanges package
  for the method defined for \link[IRanges]{Ranges} objects.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
order
showMethods("order")
selectMethod("order", "ANY")  # the default method
}

\keyword{methods}
