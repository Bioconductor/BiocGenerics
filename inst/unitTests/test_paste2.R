
test_paste2 <- function()
{
    ## --- between two character vectors ---

    checkIdentical(paste2(character(0), character(0)), character(0))

    x0 <- setNames(character(0), character(0))
    checkIdentical(paste2(x0, character(0)), x0)
    checkIdentical(paste2(character(0), x0), x0)

    x <- c(X="foo", Y="bar", Z=NA)
    checkIdentical(paste2(x, character(0)), character(0))
    checkIdentical(paste2(character(0), x), character(0))
    checkIdentical(paste2(x, x0), x0)
    checkIdentical(paste2(x0, x), x0)
    checkIdentical(paste2(x, ""), x)
    checkIdentical(paste2("", x), x)
    checkIdentical(paste2(x, "XX"), c(X="fooXX", Y="barXX", Z=NA))

    y <- character(3)
    checkIdentical(paste2(x, y), x)
    checkIdentical(paste2(y, x), x)
    names(y) <- LETTERS[1:3]
    checkIdentical(paste2(x, y), x)
    checkIdentical(paste2(y, x), setNames(x, names(y)))

    y <- c("a", NA, letters[3:8], NA)
    xy <- c("fooa", NA, NA, "food", "bare", NA, "foog", "barh", NA)
    checkIdentical(paste2(x, y), xy)

    names(y) <- names(xy) <- LETTERS[1:9]
    checkIdentical(paste2(x, y), xy)

    ## --- between an array and a character vector ---

    m <- matrix(1:12, ncol=3, dimnames=list(NULL, LETTERS[1:3]))
    y <- c("a", NA, "c")
    my <- rbind(c(A="1a", B=NA, C="9c"),
                c(    NA, "6c",  "10a"),
                c(  "3c", "7a",     NA),
                c(  "4a",   NA,  "12c"))
    checkIdentical(paste2(m, y), my)
    ym <- rbind(c(A="a1", B=NA, C="c9"),
                c(    NA, "c6",  "a10"),
                c(  "c3", "a7",     NA),
                c(  "a4",   NA,  "c12"))
    checkIdentical(paste2(y, m), ym)

    ## --- between two arrays ---

    a1 <- array(c(NA, letters[2:19], NA, letters[21:24]), 4:2,
                dimnames=list(LETTERS[1:4], NULL, c("X1", "Y1")))
    a2 <- array(c(1L, NA, 3:5, NA), 4:2)
    checkIdentical(dimnames(paste2(a1, a2)), dimnames(a1))
    checkIdentical(dimnames(paste2(a2, a1)), dimnames(a1))

    dimnames(a2) <- list(NULL, LETTERS[24:26], c("X2", "Y2"))
    checkIdentical(dimnames(paste2(a1, a2)), dimnames(a1))
    checkIdentical(dimnames(paste2(a2, a1)), dimnames(a2))
}

