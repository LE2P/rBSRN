#TODO : fonction du genere le bsrn header
#TODO : generate with changing month
#TODO : renforcer le control validateFunction

rm(list = ls())
library(R6)
library(magrittr)
library(stringr)
source("./R/utils.R")

lr0001GetBsrnFormat <- function(listSensor = c("2", "3", "4", "5", "21", "22", "23")){  #TODO : change this ways of list sensors
  #TODO : is justify necessary ?
  if(self$isValuesMissing()) {
    message <- paste(self$missings(), collapse = ', ')
    message <- paste('missing value(s) - ', message)
    stop(message)
  }
  sin <- self$getFormatValue("stationNumber")
  month <- self$getFormatValue("month")
  year <- self$getFormatValue("year")
  version <- self$getFormatValue("version")

  #TODO : Ameliorer le code pour le rendre plus clair
  listIds <- t(matrix(c(listSensor, rep(-1, 8 - length(listSensor) %% 8)), nrow = 8))
  listIds <- format(listIds, width = 9, justify = "right")
  formatListSensor <- paste0(" ", paste(apply(listIds, 1, paste, collapse = " "), collapse = "\n "))

  thisFormat <- paste(
    "*C0001",
    " $[.2s]{sin} $[.2s]{month} $[.4s]{year} $[.2s]{version}",
    formatListSensor,
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}

LR0001 <- R6Class(
  classname = "LR0001",
  private = list(
    .stationNumber = list(
      value = NULL,
      name = "stationNumber",
      type = "list",
      label = "Station identification number",
      missingCode = NULL,
      justifyRight = TRUE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(stationNumber) stopifnot(is.numeric(stationNumber))
    ),
    .month = list(
      value = NULL,
      name = "month",
      type = "list",
      label = "Month of measurement",
      missingCode = NULL,
      justifyRight = TRUE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(value)
        if (!is.numeric(value)) stop("Incorrect Format")
    ),
    .year = list(
      value = NULL,
      name = "year",
      type = "list",
      label = "Year of measurement",
      missingCode = NULL,
      justifyRight = TRUE,
      format = "I4",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(value)
        if (!is.numeric(value)) stop("Incorrect Format")
    ),
    .version= list(
      value = 1,
      name = "version",
      group = "numeric",
      label = "Version of data",
      missingCode = NULL,
      justifyRight = TRUE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = 1,
      validateFunction = function(value)
        if (!is.numeric(value)) stop("Incorrect Format")
    )
  ),
  active = list(
    stationNumber = genericActiveBinding(".stationNumber"),
    month = genericActiveBinding(".month"),
    year = genericActiveBinding(".year"),
    version = genericActiveBinding(".version")
  ),
  public = list(
    initialize = genericInitialize(stationNumber = NULL, month = NULL, year = NULL, version = 1),
    isMandatory = genericIsMandatory,
    isMissing = genericIsMissing,
    isValuesMissing = genericIsValuesMissing,
    mandatories = genericMandatories,
    missings = genericMissings,
    setDefault = genericGetDefault,
    getMissingCode = genericGetMissingCode,
    getLabel = genericGetLabel,
    getFormatValue = applyFormat,
    getBsrnFormat = lr0001GetBsrnFormat,
    showBsrnFormat = genericShowBsrnFormat,
    print = genericPrint
  )
)

lr0001 = LR0001$new(stationNumber = 82, month = 12, version = 3)
lr0001$stationNumber = 2
lr0001$stationNumber = "2"

lr0001$mandatories()
lr0001$missings()
lr0001$isValuesMissing()

lr0001 = LR0001$new(stationNumber = 2, month = 12, year = 2002, version = 3)
lr0001$isValuesMissing()

lr0001$setDefault("month")
lr0001$month

lr0001$getMissingCode("month")
lr0001$getLabel("month")
lr0001$getLabel(".month")

lr0001 = LR0001$new(stationNumber = 2, year = 2002, version = 3)
lr0001
lr0001$getBsrnFormat()
lr0001$showBsrnFormat()

lr0001 = LR0001$new(stationNumber = 2, month = 12, year = 2002, version = 3)
lr0001
lr0001$getBsrnFormat()
lr0001$showBsrnFormat()
