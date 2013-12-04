\name{evalq}

\alias{evalq}

\title{Evaluate an (unevaluated) expression}

\description{
  \code{evalq} evaluates an R expression (the quoted form of its first
  argument) in a specified environment.

  NOTE: This man page is for the \code{evalq} wrapper defined in the
  \pkg{BiocGenerics} package.  See \code{?base::\link[base]{evalq}} for the
  function defined in the \pkg{base} package. This wrapper correctly delegates
  to the \code{eval} generic, rather than
  \code{base::\link[base]{eval}}.
}

\usage{
evalq(expr, envir=parent.frame(),
           enclos=if (is.list(envir) || is.pairlist(envir))
                  parent.frame() else baseenv())
}

\arguments{
  \item{expr}{
    Quoted to form the expression that is evaluated.
  }
  \item{envir}{
    The \emph{environment} in which \code{expr} is to be evaluated.
    May be any object supported by methods on the \code{\link{eval}}
    generic.
  }
  \item{enclos}{
    See \code{?base::\link[base]{evalq}} for a description of
    this argument.
  }
}

\value{
  See \code{?base::\link[base]{evalq}}.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{evalq}} for the base \code{evalq} function.
  }
}

\examples{
evalq  # note just a copy of the original evalq
}
