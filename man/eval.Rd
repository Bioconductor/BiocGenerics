\name{eval}

\alias{eval}

\title{Evaluate an (unevaluated) expression}

\description{
  \code{eval} evaluates an R expression in a specified environment.

  NOTE: This man page is for the \code{eval} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{eval}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
eval(expr, envir=parent.frame(),
           enclos=if (is.list(envir) || is.pairlist(envir))
                  parent.frame() else baseenv())
}

\arguments{
  \item{expr}{
    An object to be evaluated.
    May be any object supported by the default method
    (see \code{?base::\link[base]{eval}}) or by the additional
    methods defined in Bioconductor packages.
  }
  \item{envir}{
    The \emph{environment} in which \code{expr} is to be evaluated.
    May be any object supported by the default method
    (see \code{?base::\link[base]{eval}}) or by the additional
    methods defined in Bioconductor packages.
  }
  \item{enclos}{
    See \code{?base::\link[base]{eval}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{eval}} for the value returned by the
  default method.

  Specific methods defined in Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{eval}} for the default \code{eval} method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[IRanges]{eval,expression,Vector-method} in the \pkg{IRanges}
          package for an example of a specific \code{eval} method (defined for
          when the \code{expr} and \code{envir} arguments are an
          \link[base]{expression} and a \link[S4Vectors]{Vector} object,
          respectively).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
eval  # note the dispatch on 'expr' and 'envir' args only
showMethods("eval")
selectMethod("eval", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
