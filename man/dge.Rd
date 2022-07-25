\name{dge}

\alias{dge}

\alias{counts}
\alias{counts<-}
\alias{design}
\alias{design<-}
\alias{dispTable}
\alias{dispTable<-}
\alias{sizeFactors}
\alias{sizeFactors<-}
\alias{conditions}
\alias{conditions<-}
\alias{estimateSizeFactors}
\alias{estimateDispersions}
\alias{plotDispEsts}

\title{Accessors and generic functions used in the context of count datasets}

\description{These generic functions provide basic interfaces to operations on
and data access to count datasets.}

\usage{
counts(object, ...)
counts(object, ...) <- value
design(object, ...)
design(object, ...) <- value
dispTable(object, ...)
dispTable(object, ...)  <- value
sizeFactors(object, ...)
sizeFactors(object, ...) <- value
conditions(object, ...)
conditions(object, ...) <- value
estimateSizeFactors(object, ...)
estimateDispersions(object, ...)
plotDispEsts(object, ...)
}

\arguments{
  \item{object}{Object of class for which methods are defined, e.g.,
    \code{CountDataSet}, \code{DESeqSummarizedExperiment} or \code{ExonCountSet}.}
  \item{value}{Value to be assigned to corresponding components of
    \code{object}; supported types depend on method implementation.}
  \item{...}{Further arguments, perhaps used by metohds}
}

\details{For the details, please consult the manual pages of the
  methods in the \pkg{DESeq}, \pkg{DESeq2}, and \pkg{DEXSeq} packages and the package
  vignettes.}

\author{W. Huber, S. Anders}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\keyword{manip}
