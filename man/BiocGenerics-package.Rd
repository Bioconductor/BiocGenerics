\name{BiocGenerics-package}

\alias{BiocGenerics-package}
\alias{BiocGenerics}
\docType{package}

\title{Generic functions for Bioconductor}

\description{
  S4 generic functions needed by many other Bioconductor packages.
}

\details{
  Standard R functions explicitely promoted to generics:
  \itemize{
    \item \code{\link[BiocGenerics]{cbind}},
          \code{\link[BiocGenerics]{rbind}}

    \item \code{\link[BiocGenerics]{duplicated}},
          \code{\link[BiocGenerics]{anyDuplicated}}

    \item \code{\link[BiocGenerics]{eval}}

    \item Extremes:
          \code{\link[BiocGenerics]{pmax}},
          \code{\link[BiocGenerics]{pmin}},
          \code{\link[BiocGenerics]{pmax.int}},
          \code{\link[BiocGenerics]{pmin.int}}

    \item funprog:
          \code{\link[BiocGenerics]{Reduce}},
          \code{\link[BiocGenerics]{Filter}},
          \code{\link[BiocGenerics]{Find}},
          \code{\link[BiocGenerics]{Map}},
          \code{\link[BiocGenerics]{Position}}

    \item \code{\link[BiocGenerics]{lapply}},
          \code{\link[BiocGenerics]{sapply}}

    \item \code{\link[BiocGenerics]{mapply}}

    \item \code{\link[BiocGenerics]{order}}

    \item \code{\link[BiocGenerics]{paste}}

    \item \code{\link[BiocGenerics]{rep.int}}

    \item row+colnames:
          \code{\link[BiocGenerics]{rownames}},
          \code{\link[BiocGenerics]{colnames}}

    \item sets:
          \code{\link[BiocGenerics]{union}},
          \code{\link[BiocGenerics]{intersect}},
          \code{\link[BiocGenerics]{setdiff}}

    \item \code{\link[BiocGenerics]{table}}

    \item \code{\link[BiocGenerics]{tapply}}

    \item \code{\link[BiocGenerics]{unique}}

    \item \code{\link[BiocGenerics]{xtabs}}
  }

  Bioconductor specific generics:
  \itemize{
    \item \code{\link[BiocGenerics]{combine}}

    \item \code{\link[BiocGenerics]{updateObject}}
  }
}

\author{The Bioconductor Dev Team}

\seealso{
  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \code{\link[methods]{setGeneric}} and \code{\link[methods]{setMethod}}
  for defining generics and methods.
}

\examples{
## List all the symbols defined in this package:
ls('package:BiocGenerics')
}

\keyword{package}
