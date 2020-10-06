#TODO : fonction du genere le bsrn header
#TODO : generate with changing month
#TODO : renforcer le control validateFunction
#TODO : Optimiser parse et eval
#TODO : Private methodes
#TODO : Attention au sens de lecture - les classes doivent etre lue en dernier : z dans le nom du fichie pour lecture en dernier - le mettre dans la doc
#TODO : gestion de la sauvegarde

#' LR0001 get BSRN format function
#'
#' @param listSensor List of sensor use in the file
#'
#' @return A char with the BSRN format
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


#' R6 Class representing a logical record 0001
#'
#' @export
LR0001 <- R6::R6Class(
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
