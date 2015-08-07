### =========================================================================
### Utilities for showing object components in a systematic way
### -------------------------------------------------------------------------
###

padToAlign <- function(x) {
    whitespace <- paste(rep(" ", getOption("width")), collapse="")
    padlen <- max(nchar(x)) - nchar(x)
    substring(whitespace, 1L, padlen)
}

qualifyByName <- function(x, qualifier="=") {
    nms <- names(x)
    x <- as.character(x)
    aliased <- nzchar(nms)
    x[aliased] <- paste0(nms[aliased], qualifier, x[aliased])
    x
}

labeledLine <-
    function(label, els, count = TRUE, labelSep = ":", sep = " ",
             ellipsis = "...", ellipsisPos = c("middle", "end", "start"),
             vectorized = FALSE, pad = vectorized)
{
  if (!is.null(els)) {
      label[count] <- paste(label, "(",
                            if (vectorized) lengths(els) else length(els),
                            ")", sep = "")[count]
      if (!is.null(names(els))) {
          els <- qualifyByName(els)
      }
  }
  label <- paste(label, labelSep, " ", sep = "")
  if (pad) {
      label <- paste0(label, padToAlign(label))
  }
  width <- getOption("width") - nchar(label)
  ellipsisPos <- match.arg(ellipsisPos)
  if (vectorized) {
      ellipsize <- Vectorize(ellipsize)
  }
  line <- ellipsize(els, width, sep, ellipsis, ellipsisPos)
  paste(label, line, "\n", sep = "")
}

ellipsize <-
  function(obj, width = getOption("width"), sep = " ", ellipsis = "...",
           pos = c("middle", "end", "start"))
{
  pos <- match.arg(pos)
  if (is.null(obj))
    obj <- "NULL"
  if (is.factor(obj))
    obj <- as.character(obj)
  ## get order selectSome() would print
  if (pos == "middle") {
    if (length(obj) > 2 * width)
      obj <- c(head(obj, width), tail(obj, width))
    half <- seq_len(ceiling(length(obj) / 2L))
    ind <- as.vector(rbind(half, length(obj) - half + 1L))
  } else if (pos == "end") {
    obj <- head(obj, width)
    ind <- seq_len(length(obj))
  } else {
    obj <- tail(obj, width)
    ind <- rev(seq_len(length(obj)))
  }
  str <- encodeString(obj)
  nc <- cumsum(nchar(str[ind]) + nchar(sep)) - nchar(sep)
  last <- findInterval(width, nc)
  if (length(obj) > last) {
    ## make sure ellipsis fits
    while (last &&
           (nc[last] + nchar(sep)*2^(last>1) + nchar(ellipsis)) > width)
      last <- last - 1L
    if (last == 0) { ## have to truncate the first/last element
      if (pos == "start") {
        str <-
          paste(ellipsis,
                substring(tail(str, 1L),
                          nchar(tail(str, 1L))-(width-nchar(ellipsis))+1L,
                          nchar(ellipsis)),
                sep = "")
      } else {
        str <-
          paste(substring(str[1L], 1, width - nchar(ellipsis)), ellipsis,
                sep = "")
      }
    }
    else if (last == 1) { ## can only show the first/last
      if (pos == "start")
        str <- c(ellipsis, tail(str, 1L))
      else str <- c(str[1L], ellipsis)
    }
    else {
      str <- selectSome(str, last + 1L, ellipsis, pos)
    }
  }
  paste(str, collapse = sep)
}

## taken directly from Biobase, then added 'ellipsisPos' argument
selectSome <- function(obj, maxToShow = 5, ellipsis = "...",
                       ellipsisPos = c("middle", "end", "start"), quote=FALSE) 
{
  if(is.character(obj) && quote)
      obj <- sQuote(obj)
  ellipsisPos <- match.arg(ellipsisPos)
  len <- length(obj)
  if (maxToShow < 3) 
    maxToShow <- 3
  if (len > maxToShow) {
    maxToShow <- maxToShow - 1
    if (ellipsisPos == "end") {
      c(head(obj, maxToShow), ellipsis)
    } else if (ellipsisPos == "start") {
      c(ellipsis, tail(obj, maxToShow))
    } else {
      bot <- ceiling(maxToShow/2)
      top <- len - (maxToShow - bot - 1)
      nms <- obj[c(1:bot, top:len)]
      c(as.character(nms[1:bot]), ellipsis, as.character(nms[-c(1:bot)]))
    }
  } else {
    obj
  }
}
