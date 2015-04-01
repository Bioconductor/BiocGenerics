### =========================================================================
### S3 classes as S4 classes
### -------------------------------------------------------------------------
###
### We register some old-style (aka S3) classes as formally defined (aka S4)
### classes. This allows S4 methods defined in Bioconductor packages to use
### them in their signatures. Note that dispatch still works without this
### registration but causes 'R CMD INSTALL' to (gently) complain.

### connection class and subclasses
.connectionClasses <- c("file", "url", "gzfile", "bzfile", "unz", "pipe",
                        "fifo", "sockconn", "terminal", "textConnection",
                        "gzcon")
apply(cbind(.connectionClasses, "connection"), 1, setOldClass,
      where = environment())

setClassUnion("characterORconnection", c("character", "connection"))

### others
setOldClass("AsIs")

#setOldClass("xtabs", "table")  # this seems to cause problems when installing
                                # IRanges:
                                # Warning: replacing previous import
                                # ‘.__C__table’ when loading ‘BiocGenerics’

setOldClass("dist")

