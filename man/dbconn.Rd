\name{dbconn}

\alias{dbconn}
\alias{dbfile}

\title{Accessing SQLite DB information}

\description{
  Get a connection object or file path for a SQLite DB
}

\usage{
dbconn(x)
dbfile(x)
}

\arguments{
  \item{x}{
    An object with a SQLite connection.
  }
}

\value{
  \code{dbconn} returns a connection object to the SQLite DB containing
  \code{x}'s data.

  \code{dbfile} returns a path (character string) to the SQLite DB (file)
  containing \code{x}'s data.
}

\seealso{
  \itemize{
    \item \code{\link[methods]{showMethods}} for displaying a summary of the
          methods defined for a given generic function.

    \item \code{\link[methods]{selectMethod}} for getting the definition of
          a specific method.

    \item \link[AnnotationDbi]{dbconn,AnnotationDb-method} in the
          \pkg{AnnotationDbi} package for an example of a specific
          \code{dbconn} method (defined for \link[AnnotationDbi]{dbconn}
          objects).

    \item \link{BiocGenerics} for a summary of all the generics defined
          in the \pkg{BiocGenerics} package.
  }
}

\examples{
dbconn
showMethods("dbconn")
dbfile
showMethods("dbfile")

library(AnnotationDbi)
showMethods("dbconn")
selectMethod("dbconn", "AnnotationDb")
}

\keyword{methods}
