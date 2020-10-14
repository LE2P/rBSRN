library(magrittr)
library(jsonlite)

mySplit <- function(x, var){
  bool <- colnames(x) == var
  split(x[,!bool], x[[var]], drop = TRUE)
}

lowercc <- function(char) paste0(tolower(substr(char,1,1)), substr(char,2,nchar(char)))

lr <- "LR0002"
dd <- getParams(lr)

for (d in dd){
  paste0(
    "#' @param ", d$name, ' ', d$label, '\n'
  ) %>%  cat()
}

# getPrivatesVar("LR0001")
