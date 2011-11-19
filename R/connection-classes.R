### =========================================================================
### Connections as S4 classes
### -------------------------------------------------------------------------
###

.connectionClasses <- c("file", "url", "gzfile", "bzfile", "unz", "pipe",
                        "fifo", "sockconn", "terminal", "textConnection",
                        "gzcon")
apply(cbind(.connectionClasses, "connection"), 1, setOldClass,
      where = environment())

setClassUnion("characterORconnection", c("character", "connection"))
