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
#' @example inst/examples/LR0001.R
#'
LR0001 <- R6::R6Class(
  classname = "LR0001",
  private = getPrivateVars("LR0001"),
  active = getActiveBindings("LR0001"),
  public = getPublicMethods("LR0001")
)


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
#' @example inst/examples/LR0002.R
#'
LR0002 <- R6::R6Class(
  classname = "LR0002",
  private = getPrivateVars("LR0002"),
  active = getActiveBindings("LR0002"),
  public = getPublicMethods("LR0002")
)


#' R6 Class representing BSRN LR0003 (Logical Record 0003)
#'
#' A LR0003 contain a message.
#'
#' \itemize{
#'   \item LR0003$new() : Create a new LR0003 object
#'   \item isMandatory() : Is variable version is mandatory ?
#'   \item isMissing() : Is variable version is missing ?
#'   \item isValuesMissing() : Is any value is missing ?
#'   \item mandatories() : List of mandatory variable.
#'   \item missings() : List of missing variables.
#'   \item setDefault() : Set a variable to default value.
#'   \item getFormatValue () : Get value with the correct format.
#'   \item getBsrnFormat() : Get the BSRN format of the object.
#'   \item showBsrnFormat() : Print the BSRN format.
#'   \item print() : Generic print method.
#' }
#'
#' @param message Messages not to be inserted in the BSRN database
#'
#' @export
#' @example inst/examples/LR0003.R
#'
LR0003 <- R6::R6Class(
  classname = "LR0003",
  private = getPrivateVars("LR0003"),
  active = getActiveBindings("LR0003"),
  public = getPublicMethods("LR0003")
)

#' R6 Class representing BSRN LR0004 (Logical Record 0004)
#'
#' A LR0004 contain object.
#'
#' @export
#' @example inst/examples/LR0004.R
#'
LR0004 <- R6::R6Class(
  classname = "LR0004",
  private = getPrivateVars("LR0004"),
  active = getActiveBindings("LR0004"),
  public = getPublicMethods("LR0004")
)


#' R6 Class representing BSRN LR0005 (Logical Record 0005)
#'
#' A LR0005 contain object.
#'
#' @export
LR0005 <- R6::R6Class(
  classname = "LR0005",
  private = getPrivateVars("LR0005"),
  active = getActiveBindings("LR0005"),
  public = getPublicMethods("LR0005")
)


#' R6 Class representing BSRN LR0006 (Logical Record 0006)
#'
#' A LR0006 contain object.
#'
#' @export
LR0006 <- R6::R6Class(
  classname = "LR0006",
  private = getPrivateVars("LR0006"),
  active = getActiveBindings("LR0006"),
  public = getPublicMethods("LR0006")
)


#' R6 Class representing BSRN LR0007 (Logical Record 0007)
#'
#' A LR0007 contain object.
#'
#' @export
#' @example inst/examples/LR0007.R
#'
LR0007 <- R6::R6Class(
  classname = "LR0007",
  private = getPrivateVars("LR0007"),
  active = getActiveBindings("LR0007"),
  public = getPublicMethods("LR0007")
)


#' R6 Class representing BSRN LR0008 (Logical Record 0008)
#'
#' A LR0008 contain object.
#'
#' @export
#' @example inst/examples/LR0008.R
#'
LR0008 <- R6::R6Class(
  classname = "LR0008",
  private = getPrivateVars("LR0008"),
  active = getActiveBindings("LR0008"),
  public = getPublicMethods("LR0008")
)
