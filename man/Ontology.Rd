\name{Ontology}

\alias{Ontology}

\title{Generic Ontology getter}

\description{
  Get the Ontology of an object.
}

\usage{
Ontology(object)
}

\arguments{
  \item{object}{
    An object with an Ontology.
  }
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[AnnotationDbi]{Ontology,GOTerms-method} in the
          \pkg{AnnotationDbi} package for an example of a specific
          \code{Ontology} method (defined for \link[AnnotationDbi]{GOTerms}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
Ontology
showMethods("Ontology")

library(AnnotationDbi)
showMethods("Ontology")
selectMethod("Ontology", "GOTerms")
}

\keyword{methods}
