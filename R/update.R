### =========================================================================
### Efficient update behavior for S4 objects
### -------------------------------------------------------------------------
###
### 'updateS4' is essentially a more efficient initialize for (value) S4 objects.

unsafe_updateS4 <- function(object, ..., .slotList = list()) {
  valid_argnames <- slotNames(object)
  args <- extraArgsAsList(valid_argnames, ...)
  firstTime <- TRUE
  listUpdate <- function(object, l) {
    for (nm in names(l)) {
      ## Too risky! identical() is not reliable enough e.g. with objects
      ## that contain external pointers. For example, DNAStringSet("A") and
      ## DNAStringSet("T") are considered to be identical! identical() needs
      ## to be fixed first.
      ##if (identical(slot(object, nm), l[[nm]]))
      ##  next
      if (firstTime) {
        ## Triggers a copy.
        slot(object, nm, check=FALSE) <- l[[nm]]
        firstTime <<- FALSE
      } else {
        ## In-place modification (i.e. no copy).
        `slot<-`(object, nm, check=FALSE, l[[nm]])
      }
    }
    object
  }
  listUpdate(listUpdate(object, args), .slotList)
}

updateS4 <- function(object, ..., check = TRUE) {
  if (!isTRUEorFALSE(check)) 
    stop("'check' must be TRUE or FALSE")
  object <- unsafe_updateS4(object, ...)
  if (check) {
    validObject(object)
  }
  object
}
