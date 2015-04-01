\name{S3-classes-as-S4-classes}

\alias{S3-classes-as-S4-classes}

\alias{connection-class}
\alias{file-class}
\alias{url-class}
\alias{gzfile-class}
\alias{bzfile-class}
\alias{unz-class}
\alias{pipe-class}
\alias{fifo-class}
\alias{sockconn-class}
\alias{terminal-class}
\alias{textConnection-class}
\alias{gzcon-class}
\alias{characterORconnection-class}

\alias{AsIs-class}
%\alias{table-class}
%\alias{xtabs-class}
\alias{dist-class}


\title{S3 classes as S4 classes}

\description{
  Some old-style (aka S3) classes are turned into formally defined (aka S4)
  classes by the \pkg{BiocGenerics} package. This allows S4 methods defined in
  Bioconductor packages to use them in their signatures.
}

\details{
  S3 classes currently turned into S4 classes:
  \itemize{
    \item connection class and subclasses:
          \link{connection},
          file, url, gzfile, bzfile, unz, pipe,
          fifo, sockconn, terminal, textConnection,
          gzcon.
          Addtitionally the characterORconnection S4 class is defined as
          the union of classes character and connection.

    \item others: \link{AsIs}, \link{dist}
  }
}

\seealso{
  \link{setOldClass} and \link{setClassUnion} in the \pkg{methods} package.
}

\keyword{classes}
