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

unsafe_replaceSlots <- function(object, ..., .slotList=list())
{
    ## This function is no longer 'unsafe', in that it does not do
    ## in-place modification via `slot<-()`; see
    ## https://github.com/Bioconductor/BiocGenerics/pull/1
    slots <- c(list(...), .slotList)
    slots_names <- names(slots)
    ## This is too slow. See further down for a much faster way to check
    ## that the supplied slots exist.
    #invalid_idx <- which(!(slots_names %in% slotNames(object)))
    #if (length(invalid_idx) != 0L) {
    #    in1string <- paste0(slots_names[invalid_idx], collapse=", ")
    #    stop(wmsg("invalid slot(s) for ", class(object), " instance: ",
    #              in1string))
    #}
    for (i in seq_along(slots)) {
        slot_name <- slots_names[[i]]
        if (slot_name == "mcols")
            slot_name <- "elementMetadata"
        ## Even if we won't make any use of 'old_slot_val', this is a very
        ## efficient way to check that the supplied slot exists.
        ## We need to check this because the slot() setter won't raise an error
        ## in case of invalid slot name when used with 'check=FALSE'. It will
        ## silently be a no-op!
        old_slot_val <- slot(object, slot_name) # check slot existence
        slot_val <- slots[[i]]
        ## Too risky! identical() is not reliable enough e.g. with objects
        ## that contain external pointers. For example, DNAStringSet("A")
        ## and DNAStringSet("T") are considered to be identical! identical()
        ## would first need to be fixed.
        #if (identical(old_slot_val, slot_val))
        #    next
        slot(object, slot_name, check=FALSE) <- slot_val
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

