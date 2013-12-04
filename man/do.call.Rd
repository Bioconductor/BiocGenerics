\name{do.call}

\alias{do.call}

\title{Execute a function call}

\description{
  \code{do.call} constructs and executes a function call from a name or a
  function and a list of arguments to be passed to it.

  NOTE: This man page is for the \code{do.call} \emph{S4 generic function}
  defined in the \pkg{BiocGenerics} package.
  See \code{?base::\link[base]{do.call}} for the default method
  (defined in the \pkg{base} package).
  Bioconductor packages can define specific methods for objects
  not supported by the default method.
}

\usage{
do.call(what, args, quote=FALSE, envir=parent.frame())
}

\arguments{
  \item{what}{
    The default method expects either a function or a non-empty character
    string naming the function to be called.
    See \code{?base::\link[base]{do.call}} for the details.

    Specific methods can support other objects.
    Please refer to the documentation of a particular method for the details.
  }
  \item{args}{
    The default method expects a \emph{list} of arguments to the function
    call (the \code{names} attribute of \code{args} gives the argument names).
    See \code{?base::\link[base]{do.call}} for the details.
    
    Specific methods can support other objects.
    Please refer to the documentation of a particular method for the details.
  }
  \item{quote, envir}{
    See \code{?base::\link[base]{do.call}} for a description of
    these arguments.
  }
}

\value{
  The result of the (evaluated) function call.

  Specific methods defined in Bioconductor packages should 
  behave as consistently as possible with the default method.
}

\seealso{
  \itemize{
    \item \code{base::\link[base]{do.call}} for the default \code{do.call}
          method.

    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
do.call  # note the dispatch on the 'what' and 'args' args only
showMethods("do.call")
selectMethod("do.call", c("ANY", "ANY"))  # the default method
}

\keyword{methods}
