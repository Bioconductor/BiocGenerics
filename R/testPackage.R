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
    as.data.frame(read.dcf(file.path(path, "DESCRIPTION")),
                  stringsAsFactors=FALSE)
}

testPackage <- function(pkgname = NULL,
                        subdir="unitTests",
                        pattern="^test_.*\\.R$",
                        path = getwd(),
                        useSourceTests = interactive())
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

    if (is.null(pkgname) || useSourceTests) {
        root <- packageRoot(path)
        if (is.null(root))
            stop("could not infer package root directory")

        pkgname0 <- packageInfo(root)$Package
        if (is.null(pkgname)) {
            pkgname <- pkgname0
        } else if (!identical(pkgname, pkgname0)) {
            stop("'pkgname' and inferred DESCRIPTION 'Package' differ")
        }
    } else {
        root <- system.file(package=pkgname)
    }

    library(pkgname, character.only = TRUE, quietly=TRUE)

    dir <- file.path(root, subdir)
    if (!file.exists(dir)) {            # try inst/subdir
        dir <- file.path(root, "inst", subdir)
    }
    if (!file.exists(dir)) {
        stop("unable to find unit tests, no subdir ", sQuote(subdir))
    }

    library("RUnit", quietly=TRUE)
    RUnit_opts <- getOption("RUnit", list())
    RUnit_opts$verbose <- 0L
    RUnit_opts$silent <- TRUE
    RUnit_opts$verbose_fail_msg <- TRUE
    oopt <- options(RUnit = RUnit_opts)
    on.exit(options(oopt))
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
