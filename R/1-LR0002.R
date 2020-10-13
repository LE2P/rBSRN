#' LR0002 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0002GetBsrnFormat <- function(){

  stopIfValuesMissing(message = "LR0001", self)

  thisFormat <- paste(
    ifelse(private$.scientistChange$value | private$.deputyChange$value, "*C0002", "*U0002"),
    ifelse(private$.scientistChange$value, " $[.2s]{private$.scientistChangeDay$formatedValue} $[.2s]{private$.scientistChangeHour$formatedValue} $[.2s]{private$.scientistChangeMinute$formatedValue}", " -1 -1 -1"),
    "$[.38s]{private$.scientistName$formatedValue} $[.20s]{private$.scientistTel$formatedValue} $[.20s]{private$.scientistFax$formatedValue}",
    "$[.15s]{private$.scientistTcpip$formatedValue} $[.50s]{private$.scientistMail$formatedValue}",
    "$[.80s]{private$.scientistAddress$formatedValue}",
    ifelse(private$.deputyChange$value, " $[.2s]{private$.deputyChangeDay$formatedValue} $[.2s]{private$.deputyChangeHour$formatedValue} $[.2s]{private$.deputyChangeMinute$formatedValue}", " -1 -1 -1"),
    "$[.38s]{private$.deputyName$formatedValue} $[.20s]{private$.deputyTel$formatedValue} $[.20s]{private$.deputyFax$formatedValue}",
    "$[.15s]{private$.deputyTcpip$formatedValue} $[.50s]{private$.deputyMail$formatedValue}",
    "$[.80s]{private$.deputyAddress$formatedValue}",
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' R6 Class representing BSRN LR0002 (Logical Record 0002)
#'
#' A LR0002 has deputy and scientist informations.
#' \itemize{
#'   \item LR0002$new() : Create a new LR0002 object
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
#' @param scientistChange Is scientist changed this month ?
#' @param scientistChangeDay Day
#' @param scientistChangeHour Hour
#' @param scientistChangeMinute Minute
#' @param scientistName Scientist name *
#' @param scientistTel Scientist telephone no. *
#' @param scientistFax Scientist fax no. *
#' @param scientistTcpip Scientist TCP/IP no.
#' @param scientistMail Scientist e-mail address
#' @param scientistAddress Scientist address
#' @param deputyChange Is deputy changed this month ?
#' @param deputyChangeDay Day
#' @param deputyChangeHour Hour
#' @param deputyChangeMinute Minute
#' @param deputyName Deputy name
#' @param deputyTel Deputy telephone no.
#' @param deputyFax Deputy fax no.
#' @param deputyTcpip Deputy TCP/IP no.
#' @param deputyMail Deputy e-mail address
#' @param deputyAddress Deputy address
#'
#' @export
#' @examples
#' lr0002 = LR0002$new(scientistChange = FALSE, scientistChangeDay = -1, scientistChangeHour = -1, scientistChangeMinute = -1, scientistName = NULL, scientistTel = NULL, scientistFax = NULL, scientistTcpip = NULL, scientistMail = NULL, scientistAddress = NULL, deputyChange = FALSE, deputyChangeDay = -1, deputyChangeHour = -1, deputyChangeMinute = -1, deputyName = NULL, deputyTel = NULL, deputyFax = NULL, deputyTcpip = NULL, deputyMail = NULL, deputyAddress = NULL)
#' lr0002$scientistChange = TRUE
#' lr0002$stationNumber
#' lr0002$mandatories()
#' lr0002$missings()
#' lr0002$isValuesMissing()
#' lr0002$setDefault("month")
#' lr0002$month
#' lr0002$month = 1
#' lr0002$getMissingCode("month")
#' lr0002$getLabel("month")
#' lr0002$getBsrnFormat()
#' lr0002$showBsrnFormat()
#' lr0002
#'
LR0002 <- R6::R6Class(
  classname = "LR0002",
  private = list(
    .scientistChange = list(
      value = FALSE,
      name = "scientistChange",
      type = "logical",
      label = "Is scientist changed this month ?",
      missingCode = "",
      justifyRight = FALSE,
      format = "",
      mandatory = TRUE,
      defaultValue = FALSE,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistChangeDay = list(
      value = -1,
      name = "scientistChangeDay",
      type = "numeric",
      label = "Day",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistChangeHour = list(
      value = -1,
      name = "scientistChangeHour",
      type = "numeric",
      label = "Hour",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistChangeMinute = list(
      value = -1,
      name = "scientistChangeMinute",
      type = "numeric",
      label = "Minute",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistName = list(
      value = NULL,
      name = "scientistName",
      type = "character",
      label = "Name *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A38",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistTel = list(
      value = NULL,
      name = "scientistTel",
      type = "character",
      label = "Telephone no. *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A20",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistFax = list(
      value = NULL,
      name = "scientistFax",
      type = "character",
      label = "Fax no. *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A20",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistTcpip = list(
      value = NULL,
      name = "scientistTcpip",
      type = "character",
      label = "TCP/IP no.",
      missingCode = "XXX",
      justifyRight = FALSE,
      format = "A15",
      mandatory = FALSE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistMail = list(
      value = NULL,
      name = "scientistMail",
      type = "character",
      label = "E-mail address",
      missingCode = "XXX",
      justifyRight = FALSE,
      format = "A50",
      mandatory = FALSE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .scientistAddress = list(
      value = NULL,
      name = "scientistAddress",
      type = "character",
      label = "Address *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A80",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyChange = list(
      value = FALSE,
      name = "deputyChange",
      type = "logical",
      label = "Is deputy changed this month ?",
      missingCode = "",
      justifyRight = FALSE,
      format = "",
      mandatory = TRUE,
      defaultValue = FALSE,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyChangeDay = list(
      value = -1,
      name = "deputyChangeDay",
      type = "numeric",
      label = "Day",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyChangeHour = list(
      value = -1,
      name = "deputyChangeHour",
      type = "numeric",
      label = "Hour",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyChangeMinute = list(
      value = -1,
      name = "deputyChangeMinute",
      type = "numeric",
      label = "Minute",
      missingCode = "",
      justifyRight = FALSE,
      format = "I2",
      mandatory = TRUE,
      defaultValue = -1,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyName = list(
      value = NULL,
      name = "deputyName",
      type = "character",
      label = "Name *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A38",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyTel = list(
      value = NULL,
      name = "deputyTel",
      type = "character",
      label = "Telephone no. *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A20",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyFax = list(
      value = NULL,
      name = "deputyFax",
      type = "character",
      label = "Fax no. *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A20",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyTcpip = list(
      value = NULL,
      name = "deputyTcpip",
      type = "character",
      label = "TCP/IP no.",
      missingCode = "XXX",
      justifyRight = FALSE,
      format = "A15",
      mandatory = FALSE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyMail = list(
      value = NULL,
      name = "deputyMail",
      type = "character",
      label = "E-mail address",
      missingCode = "XXX",
      justifyRight = FALSE,
      format = "A50",
      mandatory = FALSE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    ),
    .deputyAddress = list(
      value = NULL,
      name = "deputyAddress",
      type = "character",
      label = "Address *",
      missingCode = "",
      justifyRight = FALSE,
      format = "A80",
      mandatory = TRUE,
      defaultValue = NULL,
      validateFunction = function(x) stopifnot(TRUE)
    )
  ),
  active = list(
    scientistChange = genericActiveBinding(".scientistChange"),
    scientistChangeDay = genericActiveBinding(".scientistChangeDay"),
    scientistChangeHour = genericActiveBinding(".scientistChangeHour"),
    scientistChangeMinute = genericActiveBinding(".scientistChangeMinute"),
    scientistName = genericActiveBinding(".scientistName"),
    scientistTel = genericActiveBinding(".scientistTel"),
    scientistFax = genericActiveBinding(".scientistFax"),
    scientistTcpip = genericActiveBinding(".scientistTcpip"),
    scientistMail = genericActiveBinding(".scientistMail"),
    scientistAddress = genericActiveBinding(".scientistAddress"),
    deputyChange = genericActiveBinding(".deputyChange"),
    deputyChangeDay = genericActiveBinding(".deputyChangeDay"),
    deputyChangeHour = genericActiveBinding(".deputyChangeHour"),
    deputyChangeMinute = genericActiveBinding(".deputyChangeMinute"),
    deputyName = genericActiveBinding(".deputyName"),
    deputyTel = genericActiveBinding(".deputyTel"),
    deputyFax = genericActiveBinding(".deputyFax"),
    deputyTcpip = genericActiveBinding(".deputyTcpip"),
    deputyMail = genericActiveBinding(".deputyMail"),
    deputyAddress = genericActiveBinding(".deputyAddress")
  ),
  public = list(
    initialize = genericInitialize(scientistChange = FALSE, scientistChangeDay = -1, scientistChangeHour = -1, scientistChangeMinute = -1, scientistName = NULL, scientistTel = NULL, scientistFax = NULL, scientistTcpip = NULL, scientistMail = NULL, scientistAddress = NULL, deputyChange = FALSE, deputyChangeDay = -1, deputyChangeHour = -1, deputyChangeMinute = -1, deputyName = NULL, deputyTel = NULL, deputyFax = NULL, deputyTcpip = NULL, deputyMail = NULL, deputyAddress = NULL),
    isMandatory = genericIsMandatory,
    isMissing = genericIsMissing,
    isValuesMissing = genericIsValuesMissing,
    mandatories = genericMandatories,
    missings = genericMissings,
    setDefault = genericSetDefault,
    getMissingCode = genericGetMissingCode,
    getLabel = genericGetLabel,
    getFormatValue = applyFormat,
    getBsrnFormat = lr0002GetBsrnFormat,
    showBsrnFormat = genericShowBsrnFormat,
    print = genericPrint
  )
)
