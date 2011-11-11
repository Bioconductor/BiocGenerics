\name{updateObject}

\alias{updateObject}
\alias{updateObject,ANY-method}
\alias{updateObject,list-method}
\alias{updateObject,environment-method}

\alias{updateObjectFromSlots}
\alias{getObjectSlots}

\title{Update an object to its current class definition}

\description{
  \code{updateObject} is a generic function that returns an instance
  of \code{object} updated to its current class definition.
}

\usage{
updateObject(object, ..., verbose=FALSE)

## Related utilities:
updateObjectFromSlots(object, objclass=class(object), ..., verbose=FALSE)
getObjectSlots(object)
}

\arguments{
  \item{object}{
    Object to be updated for \code{updateObject} and
    \code{updateObjectFromSlots}.

    Object for slot information to be extracted from for
    \code{getObjectSlots}.
  }
  \item{...}{
    Additional arguments, for use in specific \code{updateObject}
    methods.
  }
  \item{verbose}{
    \code{TRUE} or \code{FALSE}, indicating whether information about
    the update should be reported. Use \code{\link[base]{message}} to
    report this information.
  }
  \item{objclass}{
    Optional character string naming the class of the object
    to be created.
  }
}

\details{
  Updating objects is primarily useful when an object has been
  serialized (e.g., stored to disk) for some time (e.g., months), and the
  class definition has in the mean time changed. Because of the changed
  class definition, the serialized instance is no longer valid.

  \code{updateObject} requires that the class of the returned object be
  the same as the class of the argument \code{object}, and that the
  object is valid (see \code{\link[methods]{validObject}}). By default,
  \code{updateObject} has the following behaviors:
  \describe{
    \item{\code{updateObject(ANY, \dots, verbose=FALSE)}}{
      By default, \code{updateObject} uses heuristic methods to determine
      whether the object should be the `new' S4 type (introduced in R 2.4.0),
      but is not. If the heuristics indicate an update is required,
      the \code{updateObjectFromSlots} function tries to update the
      object. The default method returns the original S4 object or the
      successfully updated object, or issues an error if an update is
      required but not possible.
      The optional named argument \code{verbose} causes a message to be
      printed describing the action.
      Arguments \code{\dots} are passed to \code{updateObjectFromSlots}.
    }
    \item{\code{updateObject(list, \dots, verbose=FALSE)}}{
      Visit each element in \code{list}, applying
      \code{updateObject(list[[elt]], \dots, verbose=verbose)}.
    }
    \item{\code{updateObject(environment, \dots, verbose=FALSE)}}{
      Visit each element in \code{environment}, applying
      \code{updateObject(environment[[elt]], \dots, verbose=verbose)}
    }
  }

  \code{updateObjectFromSlots(object, objclass=class(object),
                              \dots, verbose=FALSE)}
  is a utility function that identifies the intersection of slots defined
  in the \code{object} instance and \code{objclass} definition. The
  corresponding elements in \code{object} are then updated (with
  \code{updateObject(elt, \dots, verbose=verbose)}) and used as arguments to
  a call to \code{new(class, \dots)}, with \code{\dots} replaced by slots
  from the original object. If this fails, \code{updateObjectFromSlots}
  then tries \code{new(class)} and assigns slots of \code{object} to
  the newly created instance.

  \code{getObjectSlots(object)} extracts the slot names and contents from
  \code{object}. This is useful when \code{object} was created by a class
  definition that is no longer current, and hence the contents of
  \code{object} cannot be determined by accessing known slots.
}

\value{
  \code{updateObject} returns a valid instance of \code{object}.

  \code{updateObjectFromSlots} returns an instance of class
  \code{objclass}.

  \code{getObjectSlots} returns a list of named elements, with each
  element corresponding to a slot in \code{object}.
}

\seealso{
  \code{\link[Biobase]{updateObjectTo}} in the Biobase package for
  updating an object to the class definition of a template (might
  be useful for updating a virtual superclass).

  \code{\link[methods]{validObject}} for testing the validity of an
  object.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
updateObject
showMethods("updateObject")
selectMethod("updateObject", "ANY")  # the default method

library(Biobase)
## update object, same class
data(sample.ExpressionSet)
obj <- updateObject(sample.ExpressionSet)

setClass("UpdtA", representation(x="numeric"), contains="data.frame")
setMethod("updateObject", "UpdtA",
    function(object, ..., verbose=FALSE)
    {
        if (verbose)
            message("updateObject object = 'A'")
        object <- callNextMethod()
        object@x <- -object@x
        object
    }
)

a <- new("UpdtA", x=1:10)
## See steps involved
updateObject(a)

removeMethod("updateObject", "UpdtA")
removeClass("UpdtA")
}

\keyword{methods}
