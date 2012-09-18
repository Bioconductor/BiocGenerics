\name{BiocGenerics-package}

\alias{BiocGenerics-package}
\alias{BiocGenerics}
\docType{package}

\title{Generic functions for Bioconductor}

\description{
  S4 generic functions needed by many other Bioconductor packages.
}

\details{
  We divide the generic functions defined in the BiocGenerics package in
  2 categories: (1) functions already defined in base R and explicitly
  promoted to generics in BiocGenerics, and (2) Bioconductor specific
  generics.

  \subsection{(1) Functions defined in base R and explicitly promoted to
              generics in the BiocGenerics package}{

    From package base:
    \itemize{
      \item \code{BiocGenerics::\link[BiocGenerics]{cbind}},
            \code{BiocGenerics::\link[BiocGenerics]{rbind}}

      \item \code{BiocGenerics::\link[BiocGenerics]{duplicated}},
            \code{BiocGenerics::\link[BiocGenerics]{anyDuplicated}}

      \item \code{BiocGenerics::\link[BiocGenerics]{eval}}

      \item Extremes:
            \code{BiocGenerics::\link[BiocGenerics]{pmax}},
            \code{BiocGenerics::\link[BiocGenerics]{pmin}},
            \code{BiocGenerics::\link[BiocGenerics]{pmax.int}},
            \code{BiocGenerics::\link[BiocGenerics]{pmin.int}}

      \item funprog:
            \code{BiocGenerics::\link[BiocGenerics]{Reduce}},
            \code{BiocGenerics::\link[BiocGenerics]{Filter}},
            \code{BiocGenerics::\link[BiocGenerics]{Find}},
            \code{BiocGenerics::\link[BiocGenerics]{Map}},
            \code{BiocGenerics::\link[BiocGenerics]{Position}}

      \item \code{BiocGenerics::\link[BiocGenerics]{get}},
            \code{BiocGenerics::\link[BiocGenerics]{mget}}

      \item \code{BiocGenerics::\link[BiocGenerics]{lapply}},
            \code{BiocGenerics::\link[BiocGenerics]{sapply}}

      \item \code{BiocGenerics::\link[BiocGenerics]{mapply}}

      \item \code{BiocGenerics::\link[BiocGenerics]{nrow}},
            \code{BiocGenerics::\link[BiocGenerics]{ncol}},
            \code{BiocGenerics::\link[BiocGenerics]{NROW}},
            \code{BiocGenerics::\link[BiocGenerics]{NCOL}}

      \item \code{BiocGenerics::\link[BiocGenerics]{order}}

      \item \code{BiocGenerics::\link[BiocGenerics]{paste}}

      \item \code{BiocGenerics::\link[BiocGenerics]{rep.int}}

      \item \code{BiocGenerics::\link[BiocGenerics]{rownames}},
            \code{BiocGenerics::\link[BiocGenerics]{colnames}}

      \item sets:
            \code{BiocGenerics::\link[BiocGenerics]{union}},
            \code{BiocGenerics::\link[BiocGenerics]{intersect}},
            \code{BiocGenerics::\link[BiocGenerics]{setdiff}}

      \item \code{BiocGenerics::\link[BiocGenerics]{table}}

      \item \code{BiocGenerics::\link[BiocGenerics]{tapply}}

      \item \code{BiocGenerics::\link[BiocGenerics]{unique}}
    }

    From package graphics:
    \itemize{
      \item \code{BiocGenerics::\link[BiocGenerics]{boxplot}}

      \item \code{BiocGenerics::\link[BiocGenerics]{image}}
    }

    From package stats:
    \itemize{
      \item \code{BiocGenerics::\link[BiocGenerics]{density}}

      \item \code{BiocGenerics::\link[BiocGenerics]{residuals}}

      \item \code{BiocGenerics::\link[BiocGenerics]{weights}}

      \item \code{BiocGenerics::\link[BiocGenerics]{xtabs}}
    }
  }

  \subsection{(2) Bioconductor specific generics}{
    \itemize{
      \item \code{\link[BiocGenerics]{annotation}},
            \code{\link[BiocGenerics]{annotation<-}}

      \item \code{\link[BiocGenerics]{combine}}

      \item \code{\link[BiocGenerics]{strand}},
            \code{\link[BiocGenerics]{strand<-}}

      \item \code{\link[BiocGenerics]{updateObject}}
    }
  }
}

\note{
  More generics can be added on request by sending an email to the
  Bioc-devel mailing list:

    \url{http://bioconductor.org/help/mailing-list/}

  Things that should NOT be added to the BiocGenerics package:
  \itemize{
    \item Internal generic primitive functions like \code{\link{length}},
          \code{\link{dim}}, \code{`\link{dim<-}`}, etc...
          See \code{?\link{InternalMethods}} for the complete list.
          There are a few exceptions though, that is, the BiocGenerics package
          may actually redefine a few of those internal generic primitive
          functions as S4 generics when for example the signature of the
          internal generic primitive is not appropriate (this is the
          case for \code{BiocGenerics::\link[BiocGenerics]{cbind}}).

    \item S3 and S4 group generic functions like \code{\link{Math}},
          \code{\link{Ops}}, etc... See \code{?\link{groupGeneric}} and
          \code{?\link{S4groupGeneric}} for the complete list.

    \item Generics already defined in the stats4 package.
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
