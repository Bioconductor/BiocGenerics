
test_table <- function()
{
    ## --- Call default method ---

    X <- sample(letters[11:14], 20, replace=TRUE)
    Y <- sample(11:14, 20, replace=TRUE)
    Z <- sample(c(TRUE, FALSE), 20, replace=TRUE)
    checkIdentical(table(X),            # 'X' passed thru arg 'x'
                   base::table(X))
    checkIdentical(table(X, Y),         # 'X' passed thru arg 'x'
                   base::table(X, Y))
    checkIdentical(table(a=X, Y),       # 'Y' passed thru arg 'x'
                   base::table(a=X, Y))
    checkIdentical(table(a=X, x=Y),     # 'Y' passed thru arg 'x'
                   base::table(a=X, x=Y))
    checkIdentical(table(X, Y, x=Z),    # 'Z' passed thru arg 'x'
                   base::table(X, Y, x=Z))
    checkIdentical(table(a=X, Y, x=Z),  # 'Z' passed thru arg 'x'
                   base::table(a=X, Y, x=Z))
    checkIdentical(table(X, b=Y, x=Z),  # 'Z' passed thru arg 'x'
                   base::table(X, b=Y, x=Z))

    checkIdentical(table(X, dnn=NULL), base::table(X, dnn=NULL))
    checkIdentical(table(dnn=NULL, X), base::table(dnn=NULL, X))
    checkIdentical(table(X, Y, dnn=NULL), base::table(X, Y, dnn=NULL))
    checkIdentical(table(X, dnn=NULL, Y), base::table(X, dnn=NULL, Y))
    checkIdentical(table(dnn=NULL, a=X, Y), base::table(dnn=NULL, a=X, Y))

    ## --- Call "missing" method ---

    checkIdentical(table(a=X, b=Y),     # nothing passed thru arg 'x'
                   base::table(a=X, b=Y))
    checkIdentical(table(a=X, b=Y, dnn=NULL), base::table(a=X, b=Y, dnn=NULL))
    checkIdentical(table(a=X, dnn=NULL, b=Y), base::table(a=X, dnn=NULL, b=Y))
    checkIdentical(table(dnn=NULL, a=X, b=Y), base::table(dnn=NULL, a=X, b=Y))

    ## --- Define and call method for an S4 class ---

    setClass("A", slots=c(stuff="ANY"))
    setMethod("table", "A", function(x, ...) "ok")

    a <- new("A", stuff="not important")
    ## Dispatch on table#A method:
    checkIdentical(table(a), "ok")
    checkIdentical(table(a, 15), "ok")
    checkIdentical(table(a, i=15), "ok")
    checkIdentical(table(i=15, a), "ok")
    checkIdentical(table(x=a), "ok")
    checkIdentical(table(i=15, x=a), "ok")
    ## Dispatch on table#missing method which forwards to table#A method:
    checkIdentical(table(y=a), "ok")
    checkIdentical(table(y=a, i=15), "ok")
    checkIdentical(table(i=15, y=a), "ok")
}

