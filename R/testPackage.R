### 

packageRoot <- function(path)
{
    hasDescription <- function(path) {
        file.exists(file.path(path, "DESCRIPTION"))
    }
    isRoot <- function(path) {
        identical(path, dirname(path))
    }
    while (!hasDescription(path) && !isRoot(path)) {
        path <- dirname(path)
    }
    if (isRoot(path)) {
        NULL
    } else {
        path
    }
}

packageInfo <- function(path)
{
    as.data.frame(read.dcf(file.path(path, "DESCRIPTION")), stringsAsFactors=FALSE)
}

testPackage <- function(pkgname = NULL,
                        subdir="unitTests",
                        pattern="^test_.*\\.R$",
                        path = getwd(),
                        useInstalled = !interactive())
{
    .failure_details <- function(result) {
        res <- result[[1L]]
        if (res$nFail > 0 || res$nErr > 0) {
            Filter(function(x) length(x) > 0,
                   lapply(res$sourceFileResults,
                          function(fileRes) {
                              names(Filter(function(x) x$kind != "success",
                                           fileRes))
                          }))
        } else list()
    }

    root <- packageRoot(path)

    if (is.null(pkgname)) {
        if (is.null(root)) {
            stop("must specify a ", sQuote("pkgname"),
                 " if the working directory is not within a package")
        }
        pkgname <- packageInfo(root)$Package
    }

    dir <- ""
    if (useInstalled) {
        library(pkgname, character.only = TRUE, quietly=TRUE)
        dir <- system.file(subdir, package=pkgname)
    }
    if (dir == "") {
        if (!is.null(root)) {
            ## try looking for the subdir in inst/subdir
            dir <- file.path(root, "inst", subdir)
        }
    }
    if (!file.exists(dir)) {
        stop("unable to find unit tests, no ", sQuote(subdir), " dir")
    }

    library("RUnit", quietly=TRUE)
    RUnit_opts <- getOption("RUnit", list())
    RUnit_opts$verbose <- 0L
    RUnit_opts$silent <- TRUE
    RUnit_opts$verbose_fail_msg <- TRUE
    options(RUnit = RUnit_opts)
    suite <- RUnit::defineTestSuite(name=paste(pkgname, "RUnit Tests"),
                                    dirs=dir,
                                    testFileRegexp=pattern,
                                    rngKind="default",
                                    rngNormalKind="default")
    result <- RUnit::runTestSuite(suite)
    cat("\n\n")
    RUnit::printTextProtocol(result, showDetails=FALSE)
    if (length(details <- .failure_details(result)) > 0) {
        cat("\nTest files with failing tests\n")
        for (i in seq_along(details)) {
            cat("\n  ", basename(names(details)[[i]]), "\n")
            for (j in seq_along(details[[i]])) {
                cat("    ", details[[i]][[j]], "\n")
            }
        }
        cat("\n\n")
        stop("unit tests failed for package ", pkgname)
    }
    result
}
