#' R6 Class representing BSRN LR0100 (Logical Record 0100)
#'
#' A LR0100 contain object.
#' \itemize{
#'   \item LR0100$new() : Create a new LR0100 object
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
#' @param yearMonth [mandatory] A string (`'YYYY-MM'`) representing the year and month of measurement.
#' @param global2_avg [optional] A numeric vector for global solar radiation averages (W/m^2).
#' @param global2_std [optional] A numeric vector for the standard deviation of global solar radiation (W/m^2).
#' @param global2_min [optional] A numeric vector for the minimum global solar radiation (W/m^2).
#' @param global2_max [optional] A numeric vector for the maximum global solar radiation (W/m^2).
#' @param direct_avg [optional] A numeric vector for direct solar radiation averages (W/m^2).
#' @param direct_std [optional] A numeric vector for the standard deviation of direct solar radiation (W/m^2).
#' @param direct_min [optional] A numeric vector for the minimum direct solar radiation (W/m^2).
#' @param direct_max [optional] A numeric vector for the maximum direct solar radiation (W/m^2).
#' @param diffuse_avg [optional] A numeric vector for diffuse solar radiation averages (W/m^2).
#' @param diffuse_std [optional] A numeric vector for the standard deviation of diffuse solar radiation (W/m^2).
#' @param diffuse_min [optional] A numeric vector for the minimum diffuse solar radiation (W/m^2).
#' @param diffuse_max [optional] A numeric vector for the maximum diffuse solar radiation (W/m^2).
#' @param downward_avg [optional] A numeric vector for downward long-wave radiation averages (W/m^2).
#' @param downward_std [optional] A numeric vector for the standard deviation of downward long-wave radiation (W/m^2).
#' @param downward_min [optional] A numeric vector for the minimum downward long-wave radiation (W/m^2).
#' @param downward_max [optional] A numeric vector for the maximum downward long-wave radiation (W/m^2).
#' @param temperature [optional] A numeric vector for air temperature at the instrument height (°C).
#' @param humidity [optional] A numeric vector for relative humidity at the instrument height (\%).
#' @param pressure [optional] A numeric vector for atmospheric pressure at the instrument height (hPa).
#'
#' @export
#' @example inst/examples/LR0100.R
#'
LR0100 <- R6::R6Class(
  classname = "LR0100",
  private = getPrivateVars("LR0100"),
  active = getActiveBindings("LR0100"),
  public = getPublicMethods("LR0100")
)

#' R6 Class representing BSRN LR4000 (Logical Record 4000)
#'
#' A LR4000 contain object.
#' \itemize{
#'   \item LR4000$new() : Create a new LR4000 object
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
#' @param yearMonth [mandatory] A string representing the year and month of measurement in the format `'YYYY-MM'`.
#' @param domeT1_down [optional] A numeric vector for the first dome temperature of the downward long-wave instrument (°C).
#' @param domeT2_down [optional] A numeric vector for the second dome temperature of the downward long-wave instrument (°C).
#' @param domeT3_down [optional] A numeric vector for the third dome temperature of the downward long-wave instrument (°C).
#' @param bodyT_down [optional] A numeric vector for the body temperature of the downward long-wave instrument (°C).
#' @param longwave_down [optional] A numeric vector for the thermopile output of the downward long-wave instrument (W/m²).
#' @param domeT1_up [optional] A numeric vector for the first dome temperature of the upward long-wave instrument (°C).
#' @param domeT2_up [optional] A numeric vector for the second dome temperature of the upward long-wave instrument (°C).
#' @param domeT3_up [optional] A numeric vector for the third dome temperature of the upward long-wave instrument (°C).
#' @param bodyT_up [optional] A numeric vector for the body temperature of the upward long-wave instrument (°C).
#' @param longwave_up [optional] A numeric vector for the thermopile output of the upward long-wave instrument (W/m²).
#'
#' @export
#' @example inst/examples/LR4000.R
#'
LR4000 <- R6::R6Class(
  classname = "LR4000",
  private = getPrivateVars("LR4000"),
  active = getActiveBindings("LR4000"),
  public = getPublicMethods("LR4000")
)

