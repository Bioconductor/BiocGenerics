### =========================================================================
### Utilities for showing object components in a systematic way
### -------------------------------------------------------------------------
###

labeledLine <-
  function(label, els, count = TRUE, labelSep = ":", sep = " ", ellipsis = "...")
{
  if (count)
    label <- paste(label, "(", length(els), ")", sep = "")
  label <- paste(label, labelSep, sep, sep = "")
  width <- getOption("width") - nchar(label)
  line <- ellipsize(els, width, sep, ellipsis)
  paste(label, line, "\n", sep = "")
}

ellipsize <-
  function(obj, width = getOption("width"), sep = " ", ellipsis = "...")
{
  if (length(obj) > 2 * width)
    obj <- c(head(obj, width), tail(obj, width))
  str <- encodeString(obj)
  ## get order selectSome() would print
  half <- seq_len(ceiling(length(obj) / 2))
  ind <- as.vector(rbind(half, length(obj) - half + 1))
  nc <- cumsum(nchar(str[ind]) + nchar(sep)) - nchar(sep)
  last <- findInterval(width, nc)
  if (length(obj) > last) {
    ## make sure ellipsis fits
    while (last &&
           (nc[last] + nchar(sep)*2^(last>1) + nchar(ellipsis)) > width)
      last <- last - 1L
    if (last == 0) ## have to truncate the first element
      str <-
        paste(substring(str[1L], 1, width - nchar(ellipsis)), ellipsis,
              sep = "")
    else if (last == 1) ## can only show the first
      str <- c(str[1L], "...")
    else
      str <- selectSome(str, last + 1L)
  }
  paste(str, collapse = sep)
}

## taken directly from Biobase
selectSome <- function(obj, maxToShow = 5) 
{
  len <- length(obj)
  if (maxToShow < 3) 
    maxToShow <- 3
  if (len > maxToShow) {
    maxToShow <- maxToShow - 1
    bot <- ceiling(maxToShow/2)
    top <- len - (maxToShow - bot - 1)
    nms <- obj[c(1:bot, top:len)]
    c(as.character(nms[1:bot]), "...", as.character(nms[-c(1:bot)]))
  } else {
    obj
  }
}
