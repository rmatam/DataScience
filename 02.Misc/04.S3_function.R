library("pryr")
f <- function(x) {
  UseMethod("f")
}
f.a <- function(x) {
  "class a"
}
f.defauit  <- function(x) {
  "Unknown Class"
  
}
f.raj <- function(variables) {
  "welcome to R"
  
}
f(structure(list(),class = "a"))
f(structure(list(),class = "defauit"))
f(structure(list(),class = "raj"))
where(f.a)
where(mean(x))
options(restart = TRUE)
traceback()
