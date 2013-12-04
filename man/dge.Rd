\name{dge}
\alias{conditions}
\alias{conditions<-}
\alias{design}
\alias{design<-}
\alias{counts}
\alias{counts<-}
\alias{dispTable}
\alias{dispTable<-}
\alias{sizeFactors}
\alias{sizeFactors<-}
\alias{estimateSizeFactors}
\alias{estimateDispersions}
\alias{plotDispEsts}

\title{Accessors and generic functions used in the context of count datasets}

\description{These generic functions provide basic interfaces to operations on
and data access to count datasets.}

\usage{
counts(object, ...)
counts(object, ...) <- value
dispTable(object, ...)
dispTable(object, ...)  <- value
sizeFactors(object, ...)
sizeFactors(object, ...) <- value
conditions(object, ...)
conditions(object, ...) <- value
design(object, ...)
design(object, ...) <- value
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

\keyword{manip}
