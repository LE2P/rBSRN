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


tt <- cbind(
  lr = bsrnInfos$lr %>% toupper(),
  name = bsrnInfos$varName %>% lowercc(),
  label = bsrnInfos$label,
  missingCode = bsrnInfos$missingCode,
  justifyRight = bsrnInfos$justifyRight,
  format = bsrnInfos$format,
  mandatory = bsrnInfos$mandatory,
  defaultValue = bsrnInfos$defaultValue,
  validateFunction = "genericValidateFunction"
)

write.csv(tt, file = "./data/bsrnparams.csv", row.names = F)

