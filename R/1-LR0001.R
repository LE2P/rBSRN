#' LR0001 get BSRN format function
#'
#' @param listSensor List of sensor use in the file
#'
#' @return A char with the BSRN format
#'
lr0001GetBsrnFormat <- function(listSensor = c("2", "3", "4", "5", "21", "22", "23")){  #TODO : change this ways of list sensors
  #TODO : is justify necessary ?

  stopIfValuesMissing(message = "LR0001", self)

  #TODO : Ameliorer le code pour le rendre plus clair
  listIds <- t(matrix(c(listSensor, rep(-1, 8 - length(listSensor) %% 8)), nrow = 8))
  listIds <- format(listIds, width = 9, justify = "right")
  formatListSensor <- paste0(" ", paste(apply(listIds, 1, paste, collapse = " "), collapse = "\n "))

  thisFormat <- paste(
    "*C0001",
    " $[.2s]{private$.stationNumber$formatedValue} $[.2s]{private$.month$formatedValue} $[.4s]{private$.year$formatedValue} $[.2s]{private$.version$formatedValue}",
    formatListSensor,
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' R6 Class representing BSRN LR0001 (Logical Record 0001)
#'
#' A LR0001 has a station number, month, year and version.
#' \itemize{
#'   \item LR0001$new() : Create a new LR0001 object
#'   \item isMandatory() : Is variable version is mandatory ?
#'   \item isMissing() : Is variable version is missing ?
#'   \item isValuesMissing() : Is any value is missing ?
#'   \item mandatories() : List of mandatory variable.
#'   \item missings() : List of missing variables.
#'   \item setDefault() : Set a variable to default value.
#'   \item getMissingCode() : Get the missing code for the variable.
#'   \item getLabel() : Get the label for the variable.
#'   \item getFormatValue () : Get value with the correct format.
#'   \item getBsrnFormat() : Get the BSRN format of the object.
#'   \item showBsrnFormat() : Print the BSRN format.
#'   \item print() : Generic print method.
#' }
#'
#' @param stationNumber Station identification number
#' @param month Month of measurement
#' @param year Year of measurement
#' @param version Version of data
#'
#' @export
#' @examples
#' lr0001 = LR0001$new(month = 12, year = 2019, version = 3)
#' lr0001$stationNumber = 2
#' lr0001$stationNumber
#' lr0001$mandatories()
#' lr0001$missings()
#' lr0001$isValuesMissing()
#' lr0001$setDefault("month")
#' lr0001$month
#' lr0001$month = 1
#' lr0001$getMissingCode("month")
#' lr0001$getLabel("month")
#' lr0001$getBsrnFormat()
#' lr0001$showBsrnFormat()
#' lr0001
#'
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
    setDefault = genericSetDefault,
    getMissingCode = genericGetMissingCode,
    getLabel = genericGetLabel,
    getFormatValue = applyFormat,
    getBsrnFormat = lr0001GetBsrnFormat,
    showBsrnFormat = genericShowBsrnFormat,
    print = genericPrint
  )
)
