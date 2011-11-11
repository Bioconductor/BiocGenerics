\name{combine}

\alias{combine}
\alias{combine,ANY,missing-method}
\alias{combine,data.frame,data.frame-method}
\alias{combine,matrix,matrix-method}

\title{Combining or merging different Bioconductor data structures}

\description{
  The \code{combine} generic function handles methods for combining
  or merging different Bioconductor data structures.
  It should, given an arbitrary number of arguments of the same class
  (possibly by inheritance), combine them into a single instance in
  a sensible way (some methods may only combine 2 objects,
  ignoring \code{...} in the argument list; because Bioconductor
  data structures are complicated, check carefully that \code{combine}
  does as you intend).
}

\usage{
combine(x, y, ...)
}

\arguments{
  \item{x}{One of the values.}
  \item{y}{A second value.}
  \item{...}{Any other objects of the same class as \code{x} and \code{y}.}
}

\details{
  There are two basic combine strategies. One is an intersection
  strategy. The returned value should only have rows (or columns) that
  are found in all input data objects. The union strategy says that the
  return value will have all rows (or columns) found in any one of the
  input data objects (in which case some indication of what to use for
  missing values will need to be provided).

  These functions and methods are currently under construction. Please
  let us know if there are features that you require.
}

\section{Methods}{
  The following methods are defined in the BiocGenerics package:
  \describe{
    \item{\code{combine(x=ANY, missing)}}{Return the first (x) argument
      unchanged.}
    \item{\code{combine(data.frame, data.frame)}}{Combines two
      \code{data.frame} objects so that the resulting \code{data.frame}
      contains all rows and columns of the original objects. Rows and
      columns in the returned value are unique, that is, a row or column
      represented in both arguments is represented only once in the
      result. To perform this operation, \code{combine} makes sure that data
      in shared rows and columns are identical in the two
      data.frames. Data differences in shared rows and columns usually cause an
      error. \code{combine} issues a warning when a column is a
      \code{\link{factor}} and the levels of the factor in the two
      data.frames are different.}
    \item{\code{combine(matrix, matrix)}}{Combined two \code{matrix}
      objects so that the resulting \code{matrix} contains all rows and
      columns of the original objects. Both matricies must have
      \code{dimnames}. Rows and columns in the returned
      value are unique, that is, a row or column represented in both
      arguments is represented only once in the result. To perform this
      operation, \code{combine} makes sure that data in shared rows and
      columns are all equal in the two matricies.}
  }
  Additional \code{combine} methods are defined in the Biobase package
  for \link[Biobase]{AnnotatedDataFrame},
  \link[Biobase]{AssayData}, \link[Biobase]{MIAME},
  and \link[Biobase]{eSet} objects.
}

\value{
  A single value of the same class as the most specific common ancestor
  (in class terms) of the input values. This will contain the
  appropriate combination of the data in the input values.
}

\author{Biocore}

\seealso{
  \link[Biobase]{combine,AnnotatedDataFrame,AnnotatedDataFrame-method},
  \link[Biobase]{combine,AssayData,AssayData-method},
  \link[Biobase]{combine,MIAME,MIAME-method},
  and \link[Biobase]{combine,eSet,eSet-method} in the Biobase package
  for additional \code{combine} methods.

  \code{\link{merge}} for merging two data frames (or data.frame-like)
  R objects.

  \code{\link[methods]{showMethods}} for displaying a summary of the
  methods defined for a given generic function.

  \code{\link[methods]{selectMethod}} for getting the definition of
  a specific method.

  \link{BiocGenerics} for a summary of all the generics defined
  in the BiocGenerics package.
}

\examples{
combine
showMethods("combine")
selectMethod("combine", c("ANY", "missing"))
selectMethod("combine", c("data.frame", "data.frame"))
selectMethod("combine", c("matrix", "matrix"))

## ---------------------------------------------------------------------
## COMBINING TWO DATA FRAMES
## ---------------------------------------------------------------------
x <- data.frame(x=1:5,
        y=factor(letters[1:5], levels=letters[1:8]),
        row.names=letters[1:5])
y <- data.frame(z=3:7,
        y=factor(letters[3:7], levels=letters[1:8]),
        row.names=letters[3:7])
combine(x,y)

w <- data.frame(w=4:8,
       y=factor(letters[4:8], levels=letters[1:8]),
       row.names=letters[4:8])
combine(w, x, y)

# y is converted to 'factor' with different levels
df1 <- data.frame(x=1:5,y=letters[1:5], row.names=letters[1:5])
df2 <- data.frame(z=3:7,y=letters[3:7], row.names=letters[3:7])
try(combine(df1, df2)) # fails
# solution 1: ensure identical levels
y1 <- factor(letters[1:5], levels=letters[1:7])
y2 <- factor(letters[3:7], levels=letters[1:7])
df1 <- data.frame(x=1:5,y=y1, row.names=letters[1:5])
df2 <- data.frame(z=3:7,y=y2, row.names=letters[3:7])
combine(df1, df2)
# solution 2: force column to be 'character'
df1 <- data.frame(x=1:5,y=I(letters[1:5]), row.names=letters[1:5])
df2 <- data.frame(z=3:7,y=I(letters[3:7]), row.names=letters[3:7])
combine(df1, df2)

## ---------------------------------------------------------------------
## COMBINING TWO MATRICES
## ---------------------------------------------------------------------
m <- matrix(1:20, nrow=5, dimnames=list(LETTERS[1:5], letters[1:4]))
combine(m[1:3,], m[4:5,])
combine(m[1:3, 1:3], m[3:5, 3:4]) # overlap
}

\keyword{methods}
