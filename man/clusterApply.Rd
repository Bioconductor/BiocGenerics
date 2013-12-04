\name{clusterApply}

\alias{clusterCall}
\alias{clusterApply}
\alias{clusterApplyLB}
\alias{clusterEvalQ}
\alias{clusterExport}
\alias{clusterMap}
\alias{clusterSplit}
\alias{parLapply}
\alias{parSapply}
\alias{parApply}
\alias{parRapply}
\alias{parCapply}
\alias{parLapplyLB}
\alias{parSapplyLB}

\title{Apply operations using clusters}

\description{
  These functions provide several ways to parallelize computations
  using a cluster.

  NOTE: This man page is for the \code{clusterCall}, \code{clusterApply},
  \code{clusterApplyLB}, \code{clusterEvalQ}, \code{clusterExport},
  \code{clusterMap}, \code{clusterSplit}, \code{parLapply}, \code{parSapply},
  \code{parApply}, \code{parRapply}, \code{parCapply}, \code{parLapplyLB},
  and \code{parSapplyLB} \emph{S4 generic functions} defined in the
  \pkg{BiocGenerics} package.
  See \code{?parallel::\link[parallel]{clusterApply}} for the default
  methods (defined in the \pkg{parallel} package).
  Bioconductor packages can define specific methods for cluster-like
  objects not supported by the default methods.
}

\usage{
clusterCall(cl=NULL, fun, ...)
clusterApply(cl=NULL, x, fun, ...)
clusterApplyLB(cl=NULL, x, fun, ...)
clusterEvalQ(cl=NULL, expr)
clusterExport(cl=NULL, varlist, envir=.GlobalEnv)
clusterMap(cl=NULL, fun, ..., MoreArgs=NULL, RECYCLE=TRUE,
           SIMPLIFY=FALSE, USE.NAMES=TRUE,
           .scheduling=c("static", "dynamic"))
clusterSplit(cl=NULL, seq)

parLapply(cl=NULL, X, fun, ...)
parSapply(cl=NULL, X, FUN, ..., simplify=TRUE, USE.NAMES=TRUE) 
parApply(cl=NULL, X, MARGIN, FUN, ...)
parRapply(cl=NULL, x, FUN, ...)
parCapply(cl=NULL, x, FUN, ...)
     
parLapplyLB(cl=NULL, X, fun, ...)
parSapplyLB(cl=NULL, X, FUN, ..., simplify=TRUE, USE.NAMES=TRUE) 
}

\arguments{
  \item{cl}{
    A cluster-like object.
  }
  \item{x}{
    A vector-like object for \code{clusterApply} and \code{clusterApplyLB}.
    A matrix-like object for \code{parRapply} and \code{parCapply}.
  }
  \item{seq}{
    Vector-like object to split.
  }
  \item{X}{
    A vector-like object for \code{parLapply}, \code{parSapply},
    \code{parLapplyLB}, and \code{parSapplyLB}.
    An array-like object for \code{parApply}.
  }
  \item{fun, ..., expr, varlist, envir, MoreArgs, RECYCLE,
        SIMPLIFY, USE.NAMES, .scheduling, FUN, simplify, MARGIN}{
    See \code{?parallel::\link[parallel]{clusterApply}} for a description of
    these arguments.
  }
}

\value{
  See \code{?parallel::\link[parallel]{clusterApply}} for the value returned
  by the default methods.

  Specific methods defined in Bioconductor packages should behave like the
  default methods.
}

\seealso{
  \itemize{
    \item \code{parallel::\link[parallel]{clusterApply}} for the default
          methods.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
clusterCall  # note the dispatch on the 'cl' arg only
showMethods("clusterCall")
selectMethod("clusterCall", "ANY")  # the default method

clusterApply  # note the dispatch on the 'cl' and 'x' args only
showMethods("clusterApply")
selectMethod("clusterApply", c("ANY", "ANY"))  # the default method

clusterApplyLB  # note the dispatch on the 'cl' and 'x' args only
showMethods("clusterApplyLB")
selectMethod("clusterApplyLB", c("ANY", "ANY"))  # the default method

clusterEvalQ  # note the dispatch on the 'cl' arg only
showMethods("clusterEvalQ")
selectMethod("clusterEvalQ", "ANY")  # the default method

clusterExport  # note the dispatch on the 'cl' arg only
showMethods("clusterExport")
selectMethod("clusterExport", "ANY")  # the default method

clusterMap  # note the dispatch on the 'cl' arg only
showMethods("clusterMap")
selectMethod("clusterMap", "ANY")  # the default method

clusterSplit
showMethods("clusterSplit")
selectMethod("clusterSplit", c("ANY", "ANY"))  # the default method

parLapply  # note the dispatch on the 'cl' and 'X' args only
showMethods("parLapply")
selectMethod("parLapply", c("ANY", "ANY"))  # the default method

parSapply  # note the dispatch on the 'cl' and 'X' args only
showMethods("parSapply")
selectMethod("parSapply", c("ANY", "ANY"))  # the default method

parApply  # note the dispatch on the 'cl' and 'X' args only
showMethods("parApply")
selectMethod("parApply", c("ANY", "ANY"))  # the default method

parRapply  # note the dispatch on the 'cl' and 'x' args only
showMethods("parRapply")
selectMethod("parRapply", c("ANY", "ANY"))  # the default method

parCapply  # note the dispatch on the 'cl' and 'x' args only
showMethods("parCapply")
selectMethod("parCapply", c("ANY", "ANY"))  # the default method

parLapplyLB  # note the dispatch on the 'cl' and 'X' args only
showMethods("parLapplyLB")
selectMethod("parLapplyLB", c("ANY", "ANY"))  # the default method

parSapplyLB  # note the dispatch on the 'cl' and 'X' args only
showMethods("parSapplyLB")
selectMethod("parSapplyLB", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
