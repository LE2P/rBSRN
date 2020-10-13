library(magrittr)
library(jsonlite)

mySplit <- function(x, var){
  bool <- colnames(x) == var
  split(x[,!bool], x[[var]], drop = TRUE)
}

lowercc <- function(char) paste0(tolower(substr(char,1,1)), substr(char,2,nchar(char)))


bsrnInfos <- read.csv('../BSRNFileCreator/data/bsrnAppVars.csv', sep = ";", stringsAsFactors = F) %>%  as.data.frame()
ns <- names(bsrnInfos)
bsrnInfos$varName <- bsrnInfos$varName %>% lowercc()
unique(bsrnInfos$group)
bool <- bsrnInfos$group == "textBox"
bsrnInfos$group[bool] <- "character"
bool <- bsrnInfos$group == "list"
bsrnInfos$group[bool] <- "numeric"
bool <- bsrnInfos$group == "blockDateChange"
bsrnInfos$group[bool] <- "numeric"


lr <- "lr0003"

for (i in which(bsrnInfos$lr == lr)){
  paste0(
    "#' @param ", bsrnInfos$varName[i], ' ', bsrnInfos$label[i], '\n'
  ) %>%  cat()
}


for (i in which(bsrnInfos$lr == lr)){
  paste0(
    ".", bsrnInfos$varName[i], ' = list(\nvalue = ', bsrnInfos$defaultValue[i],
    ',\n name = "', bsrnInfos$varName[i], '"',
    ',\n type = "', bsrnInfos$group[i], '"',
    ',\n label = "', bsrnInfos$label[i], '"',
    ',\n missingCode = "', bsrnInfos$missingCode[i], '"',
    ',\n justifyRight = ', bsrnInfos$justifyRight[i],
    ',\n format = "', bsrnInfos$format[i], '"',
    ',\n mandatory = ', bsrnInfos$mandatory[i],
    ',\n defaultValue = ', bsrnInfos$defaultValue[i],
    ',\n validateFunction = function(value) stopifnot(TRUE)', '\n), \n'
  ) %>%  cat()
}

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

