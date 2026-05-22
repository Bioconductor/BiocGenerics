
test_data <- function()
{
    envir <- new.env(parent=emptyenv())

    .check_data_result <- function(res, expected) {
        stopifnot(is.character(expected), is.environment(envir))
        checkIdentical(res, expected)
        ok <- vapply(expected, function(x) exists(x, envir=envir), logical(1))
        checkTrue(all(ok))
        rm(list=unique(res), envir=envir)
    }

    ## --- Call default method ---

    library(datasets)
    library(Biobase)

    res <- data(SW, envir=envir)
    .check_data_result(res, "SW")
    res <- data(SW, package="Biobase", envir=envir)
    .check_data_result(res, "SW")

    ## Broken! Bug in utils::data() or problem with how these Biobase
    ## datasets were made and stored?
    #res <- data("geneData", geneCov, envir=envir)  # error!
    #res <- data("geneData", geneCov)               # however this works

    expected <- c("SW", "geneCovariate", "mtcars", "seD")
    res <- data(SW, "geneCovariate", list=c("mtcars", "seD"), envir=envir)
    .check_data_result(res, expected)
    res <- data(SW, "geneCovariate", list=c("mtcars", "seD"),
                package=c("datasets", "Biobase"), envir=envir)
    .check_data_result(res, expected)

    ## --- Call "missing" method ---

    res <- data(package="Biobase", envir=envir)
    checkTrue(is(res, "packageIQR"))

    expected <- c("seD", "ChickWeight")
    res <- data(list=c("seD", "ChickWeight"), envir=envir)
    .check_data_result(res, expected)
    res <- data(list=c("seD", "ChickWeight"),
                package=c("datasets", "Biobase"), envir=envir)
    .check_data_result(res, expected)

    expected <- c("mtcars", "SW")
    res <- data(a=mtcars, b="SW", envir=envir)
    .check_data_result(res, expected)
    res <- data(a=mtcars, b="SW",
                package=c("datasets", "Biobase"), envir=envir)
    .check_data_result(res, expected)

    expected <- c("mtcars", "SW", "mtcars", "seD")
    res <- data(a=mtcars, b="SW", list=c("mtcars", "seD"), envir=envir)
    .check_data_result(res, expected)
    res <- data(a=mtcars, b="SW", list=c("mtcars", "seD"),
                package=c("datasets", "Biobase"), envir=envir)
    .check_data_result(res, expected)

    ## --- Define method for S4 objects and test dispatch ---

    setClass("A", slots=c(stuff="ANY"))
    setMethod("data", "A", function(x, ...) "ok")

    a <- new("A", stuff="not important")
    ## Dispatch on data#A method:
    checkIdentical(data(a), "ok")
    checkIdentical(data(a, 15), "ok")
    checkIdentical(data(a, i=15), "ok")
    checkIdentical(data(i=15, a), "ok")
    checkIdentical(data(x=a), "ok")
    checkIdentical(data(i=15, x=a), "ok")
    ## Dispatch on data#missing method which forwards to data#A method:
    checkIdentical(data(y=a), "ok")
    checkIdentical(data(y=a, i=15), "ok")
    checkIdentical(data(i=15, y=a), "ok")
}

