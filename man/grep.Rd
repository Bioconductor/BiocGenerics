\name{grep}

\alias{grep}
\alias{grepl}

\title{Pattern Matching and Replacement}

\description{
  Search for matches to argument 'pattern' within each element of a character
  vector.
  
  NOTE: This man page is for the \code{grep} and \code{grepl}
  \emph{S4 generic functions} defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{grep}} for the default methods
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
          fixed = FALSE, useBytes = FALSE, invert = FALSE)
grepl(pattern, x, ignore.case = FALSE, perl = FALSE,
          fixed = FALSE, useBytes = FALSE)
}

\arguments{
  \item{pattern}{
    The pattern for searching in \code{x}, such as a regular expression.
  }
  \item{x}{
    The character vector (in the general sense) to search.
  }
  \item{ignore.case, perl, value, fixed, useBytes, invert}{
    See \code{?base::\link[base]{grep}} for a description of
    these arguments.
  }
}

\value{
  See \code{?base::\link[base]{grep}} for the value returned
  by the default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{grep}} for the default
          \code{grep} and \code{grepl} methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
grep  # note the dispatch on 'pattern' and 'x' args only
showMethods("grep")
selectMethod("grep", "ANY")  # the default method
}

\keyword{methods}
