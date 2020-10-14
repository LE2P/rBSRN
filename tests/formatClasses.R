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


for (i in which(bsrnInfos$lr == lr)){
  paste0(
    bsrnInfos$varName[i], ' = genericActiveBinding(".', bsrnInfos$varName[i], '"),\n'
  ) %>%  cat()
}

for (i in which(bsrnInfos$lr == lr)){
  paste0(
    bsrnInfos$varName[i], ' = ', bsrnInfos$defaultValue[i], ', '
  ) %>%  cat()
}




bool <- bsrnInfos$lr == "lr0002"
gvl <- mySplit(bsrnInfos[bool, -1], "varName")
# gvl <- lapply(gvl, function(x) mySplit(x, "varName"))
toJSON(gvl$DeputyAddress, pretty = T)


w <- gvl$Version
cat(paste0(names(w), ' = "', w, '"'), sep = ',\n')

