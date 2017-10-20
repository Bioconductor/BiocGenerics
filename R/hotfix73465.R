### =========================================================================
### apply_hotfix73465()
### -------------------------------------------------------------------------
###
### The following regression was introduced in R 3.4.2 w.r.t. handling of the
### ellipsis:
###
###     setGeneric("order", signature="...")
###     x <- c(NA, 11:13)
###     order(x, na.last=NA)          # [1] 2 3 4
###     order_wrapper <- function(x, ...) order(x, ...)
###     order_wrapper(x, na.last=NA)  # [1] 2 3 4 1
###
### This affects all the generics with dispatch on the ellipsis.
###
### Commit 72613 in R trunk fixes this but unfortunately was not backported
### in time for R 3.4.2, only a few days later in R 3.4.2 Patched with commit
### 73465.
###
### Commit 73465 only replaces the following code:
###
###     match.call(sys.function(sys.parent()), sys.call(sys.parent()),
###                expand.dots=FALSE)
###
### with:
###
###     match.call(sys.function(sys.parent()), sys.call(sys.parent()),
###                expand.dots=FALSE, envir=parent.frame(2))
###
### in methods:::.standardGenericDots
###
### The apply_hotfix73465() utility function below can be used to fix the
### generics with dispatch on the ellipsis for users running R 3.4.2 or
### R 3.4.2 Patched < r73465.
###

.patch_standardGenericsDots <- function(standardGenericDots)
{
    body <- body(standardGenericDots)

    ## modify body
    old_code <- "match.call(sys.function(sys.parent()), sys.call(sys.parent()), expand.dots=FALSE)"
    new_code <- "match.call(sys.function(sys.parent()), sys.call(sys.parent()), expand.dots=FALSE, envir=parent.frame(2))"
    stopifnot(identical(
        as.call(parse(text=old_code)[[1L]]),
        body[[7L]][[3L]])
    )
    body[[7L]][[3L]] <- as.call(parse(text=new_code)[[1L]])

    body(standardGenericDots) <- body
    standardGenericDots
}

### Fix order() generic with apply_hotfix73465(getGeneric("order")). Will
### apply the fix only to users running R 3.4.2 or R 3.4.2 Patched < r73465.
apply_hotfix73465 <- function(FUN)
{
    if (R.Version()[["major"]] != "3" || R.Version()[["minor"]] != "4.2")
        return()
    svn_rev <- as.integer(R.Version()[["svn rev"]])
    if (svn_rev >= 73465)
        return()
    stopifnot(is(FUN, "standardGeneric"))
    envir <- environment(FUN)
    standardGenericsDots <- get("standardGeneric", envir=envir)
    standardGenericsDots <-
        try(.patch_standardGenericsDots(standardGenericsDots))
    if (inherits(standardGenericsDots, "try-error"))
        stop("hotfix failed for generic function ", FUN@generic, "()")
    assign("standardGeneric", standardGenericsDots, envir=envir)
}

