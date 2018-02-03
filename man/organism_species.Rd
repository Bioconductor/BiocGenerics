\name{organism_species}

\alias{organism_species}
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
  \code{organism} should return the \emph{scientific name} (i.e. genus and
  species, or genus and species and subspecies) of the organism. Preferably
  in the format \code{"Genus species"} (e.g. \code{"Homo sapiens"})
  or \code{"Genus species subspecies"} (e.g.
  \code{"Homo sapiens neanderthalensis"}).

  \code{species} should of course return the species of the organism.
  Unfortunately there is a long history of misuse of this accessor in
  Bioconductor so its usage is now discouraged (starting with BioC 3.1).
}

\note{
  TO DEVELOPERS:

  \code{species} has been historically misused in many places in Bioconductor
  and is redundant with \code{organism}. So implementing the \code{species}
  accessor is now discouraged (starting with BioC 3.1). The \code{organism}
  accessor (returning the \emph{scientific name}) should be implemented
  instead.
}

\seealso{
  \itemize{
    \item \url{http://bioconductor.org/packages/release/BiocViews.html#___Organism}
          for browsing the annotation packages currently available in
          Bioconductor by organism.

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
## organism() getter:
organism
showMethods("organism")

library(annotate)
showMethods("organism")
selectMethod("organism", "character")
selectMethod("organism", "chromLocation")

## organism() setter:
`organism<-`
showMethods("organism<-")

## species() getter:
species
showMethods("species")

library(AnnotationDbi)
selectMethod("species", "AnnotationDb")

## species() setter:
`species<-`
showMethods("species<-")
}

\keyword{methods}
