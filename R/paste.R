### =========================================================================
### The paste() generic
### -------------------------------------------------------------------------
###
### Need to explicitly define this generic otherwise the implicit generic in
### package "base" would dispatch on ('sep', 'collapse').
###
### Note that dispatching on '...' is supported starting with R 2.8.0 only.

setGeneric("paste", signature="...")

