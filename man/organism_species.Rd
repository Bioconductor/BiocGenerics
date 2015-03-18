\name{organism_species}

\alias{organism}
\alias{organism<-}
\alias{species}
\alias{species<-}

\title{Organism and species accessors}

\description{
  Get or set the organism and/or species of an object.
}

\usage{
organism(object)
organism(object) <- value

species(object)
species(object) <- value
}

\arguments{
  \item{object}{
    An object to get or set the organism or species of.
  }
  \item{value}{
    The organism or species to set on \code{object}.
  }
}

\value{
  TODO: Clarify what \code{organism()} and \code{species()} are supposed
  to return. See
  \url{https://stat.ethz.ch/pipermail/bioc-devel/2015-March/007138.html}
  for why this is needed.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[annotate]{organism,character-method} and
          \link[annotate]{organism,chromLocation-method} in the
          \pkg{annotate} package for examples of specific \code{organism}
          methods (defined for character and \link[annotate]{chromLocation}
          objects).

    \item \link[AnnotationDbi]{species,AnnotationDb-method} in the
          \pkg{AnnotationDbi} package for an example of a specific
          \code{species} method (defined for \link[AnnotationDbi]{AnnotationDb}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
## organism getter:
organism
showMethods("organism")

library(annotate)
showMethods("organism")
selectMethod("organism", "character")
selectMethod("organism", "chromLocation")

## organism setter:
`organism<-`
showMethods("organism<-")

## species getter:
species
showMethods("species")

library(AnnotationDbi)
selectMethod("species", "AnnotationDb")

## species setter:
`species<-`
showMethods("species<-")
}

\keyword{methods}
