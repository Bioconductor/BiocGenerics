\name{paste2}

\alias{paste2}
\alias{paste2,ANY,ANY-method}
\alias{paste2,array,ANY-method}
\alias{paste2,ANY,array-method}
\alias{paste2,array,array-method}

\alias{add_prefix}
\alias{add_suffix}

\title{Concatenate strings (binary form)}

\description{
  \code{paste2()} is a simplified version of \code{paste0()} that takes
  only two arguments and behaves like the arithmetic binary operations
  (+, *, etc...) in terms of:
  \enumerate{
    \item recycling;
    \item propagation of \code{NA}s;
    \item propagation of names;
    \item propagation of dimensions and dimnames.
  }

  \code{add_prefix()} and \code{add_suffix()} are simple wrappers around
  \code{paste2()} provided for convenience and code readability.
}

\usage{
paste2(x, y)

add_prefix(x, prefix="")
add_suffix(x, suffix="")
}

\arguments{
  \item{x, y, prefix, suffix}{
    Vector- or array-like objects containing strings.
  }
}

\details{
  Unlike \code{paste0()}, \code{paste2()} only takes two arguments:
  \code{x} and \code{y}. It's defined as an S4 generic that dispatches on
  its two arguments and with methods for ordinary vectors and arrays.
  Bioconductor packages can define methods for other vector-like or
  array-like objects that contain strings.

  \code{paste2()} follows the same rules as arithmetic operations (\code{+},
  \code{*}, etc...) with regard to:
  \enumerate{
    \item Recycling: The longer argument "wins" i.e. the shorter argument
          is recycled to the length of the longer (with a warning if the
          length of the latter is not a multiple of the length of the former).
          There's one important exception to this rule: if one of the two
          arguments has length 0, then no recycling is performed and a
          zero-length vector is returned.

    \item Propagation of \code{NA}s.

    \item Propagation of names: The longer argument also wins. If the two
          arguments have the same length, then:
          \itemize{
            \item the names on the first argument are propagated, if any;
            \item otherwise the names on the second argument are propagated,
                  if any.
          }

    \item Propagation of dimensions and dimnames: If \code{x} and \code{y}
          are both arrays, then they must be \emph{conformable} i.e. have
          the same dimensions. In this case the result of \code{paste2(x, y)}
          is also an array of same dimensions. Furthermore it will have
          \code{dimnames(x)} on it if \code{dimnames(x)} is not \code{NULL},
          otherwise it will have \code{dimnames(y)} on it.
  }

  \code{add_prefix(x, prefix="")} and \code{add_suffix(x, suffix="")} are
  convenience wrappers that just do \code{paste2(prefix, x)} and
  \code{paste2(x, suffix)}, respectively.
}

\value{
  If \code{x} and \code{y} are both vectors, a character vector
  \emph{parallel} to the longer vector is returned.

  If one of \code{x} or \code{y} is an array and the other one a vector,
  an array \emph{parallel} to the input array is returned.

  If \code{x} and \code{y} are both arrays (in which case they must be
  \emph{conformable}), an array \emph{parallel} to \code{x} and \code{y}
  is returned.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{paste0}} in base R.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[DelayedArray]{paste2,DelayedArray,DelayedArray-method} in
          the \pkg{DelayedArray} package for an example of a specific
          \code{paste2} method (defined for \link[DelayedArray]{DelayedArray}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
## ---------------------------------------------------------------------
## The paste2() generic and methods
## ---------------------------------------------------------------------

paste2  # note the dispatch on 'x' and 'y'
showMethods("paste2")

## ---------------------------------------------------------------------
## paste0() vs paste2()
## ---------------------------------------------------------------------

## Propagation of NAs and names:
x <- c(A="foo", B="bar", C=NA)
paste0(x, "XX")  # NAs are not propagated, names are lost
paste2(x, "XX")  # NAs and names are propagated
paste2(x, setNames(1:6, letters[1:6]))  # longer argument "wins"

## If 'x' or 'y' has length 0:
paste0(x, character(0))  # unname(x)
paste2(x, character(0))  # character(0)

## Propagation of dimensions and dimnames:
m <- matrix(1:12, ncol=3, dimnames=list(NULL, LETTERS[1:3]))
y <- c("a", NA, "c")
paste0(m, y)  # dimensions and dimnames are lost
paste2(m, y)  # dimensions are preserved and dimnames are propagated

## ---------------------------------------------------------------------
## add_prefix() and add_suffix()
## ---------------------------------------------------------------------

m2 <- add_prefix(m, "ID")  # same as paste2("ID", m)
add_suffix(m2, ".fasta")   # same as paste2(m2, ".fasta")
}

\keyword{methods}
