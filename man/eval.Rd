\name{eval}

\alias{eval}

\title{Evaluate an (unevaluated) expression}

\description{
  \code{eval} evaluates an R expression in a specified environment.

  NOTE: This man page is for the \code{eval} S4 generic function
  defined in the BiocGenerics package.
  See \code{?base::\link[base]{eval}} for the default method
  (defined in the base package).
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

  Specific methods defined in other Bioconductor packages should
  behave as consistently as possible with the default method.
}

\seealso{
  \code{base::\link[base]{eval}} for the default \code{eval} method.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link[IRanges]{eval,expression,List-method} in the IRanges
  package for the method defined for when the \code{expr} and \code{envir}
  arguments are \link[base]{expression} and \link[IRanges]{List}
  objects, respectively.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
eval  # note the dispatch on 'expr' and 'envir' args only
showMethods("eval")
selectMethod("eval", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
