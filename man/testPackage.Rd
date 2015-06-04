\name{testPackage}

\alias{testPackage}

\title{Run RUnit package unit tests}

\description{
  \code{testPackage} helps developers implement unit tests using the
  \pkg{RUnit} testing conventions.
}

\usage{
testPackage(pkgname=NULL, subdir="unitTests", pattern="^test_.*\\\\.R$",
    path=getwd())
}

\arguments{
  \item{pkgname}{
    The name of the package whose installed unit tests are to be run. A
    missing or NULL value implies that the \code{testPackage} command
    will look for tests within the package source directory indicated by
    \code{path}.
  }
  \item{subdir}{
    A character(1) vector providing the subdirectory in which unit tests
    are located. The directory is searched first in the (installed or
    source) package root, or in a subdirectory \code{inst/} below the
    root.
  }
  \item{pattern}{
    A character(1) regular expression describing the file names to be
    evaluated; typically used to restrict tests to a subset of all test
    files.
  }
  \item{path}{
    A character(1) directory path indicating, when \code{pkgname} is
    missing or NULL, where unit tests will be searched. \code{path} can
    be any location at or below the package root.
  }
}

\details{
  This function is not exported from the package namespace, and must be
  invoked using triple colons, \code{BiocGenerics:::testPackage()}; it
  is provided primarily for the convenience of developers.

  When invoked with missing or NULL \code{pkgname} argument, the
  function assumes that it has been invoked from within the package
  source tree (or that the source tree is located above \code{path}),
  and finds unit tests in \code{subdir="unitTests"} in either the base
  or \code{inst/} directories at the root of the package source
  tree. This mode is useful when developing unit tests, since the
  package does not have to be re-installed to run an updated test.

  When invoked with \code{pkgname} set to the name of an installed
  package, unit tests are searched for in the installed package
  directory.
}

\value{
  The function returns the result of \code{RUnit::runTestSuite} invoked
  on the unit tests specified in the function call.
}

\seealso{
  \url{http://bioconductor.org/developers/how-to/unitTesting-guidelines/}
}

\examples{
## Run unit tests found in the library location where
## BiocGenerics is installed
BiocGenerics:::testPackage("BiocGenerics")
\dontrun{## Run unit tests for the package whose source tree implied
## by getwd()
BiocGenerics:::testPackage()
}
}

\keyword{methods}
