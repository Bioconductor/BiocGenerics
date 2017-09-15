### =========================================================================
### Efficient multiple slots replacement of an S4 object
### -------------------------------------------------------------------------
###
### From a caller point of views, replacement of the slots should feel atomic
### i.e. the object gets validated only after all the slots have been replaced.
###
### NOTE: The stuff in this file (not exported) doesn't really belong to
### BiocGenerics.
###
### TODO: This stuff would need to be moved to a more appropriate place (when
### we have one).
###

unsafe_replaceSlots <- function(object, ..., .slotList = list()) {
  valid_argnames <- slotNames(object)
  args <- extraArgsAsList(valid_argnames, ...)
  listUpdate <- function(object, l) {
    for (nm in names(l)) {
      ## Too risky! identical() is not reliable enough e.g. with objects
      ## that contain external pointers. For example, DNAStringSet("A") and
      ## DNAStringSet("T") are considered to be identical! identical() needs
      ## to be fixed first.
      ##if (identical(slot(object, nm), l[[nm]]))
      ##  next
      slot(object, nm, check=FALSE) <- l[[nm]]
    }
    object
}

### replaceSlots() is essentially a more efficient initialize(), especially
### when called with 'check=FALSE'.
replaceSlots <- function(object, ..., check=TRUE)
{
    if (!isTRUEorFALSE(check)) 
        stop("'check' must be TRUE or FALSE")
    object <- unsafe_replaceSlots(object, ...)
    if (check)
        validObject(object)
    object
}

updateS4 <- function(...)
{
    .Deprecated("replaceSlots")
    replaceSlots(...)
}

