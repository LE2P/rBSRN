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
#' \itemize{
#'   \item LR0004$new() : Create a new LR0004 object
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
#' @param stationDescChange [mandatory] Logical. Indicates if the station description changed this month (`TRUE` or `FALSE`).
#' @param stationDescChangeDay [optional] Numeric. The day of the month when the station description changed.
#' @param stationDescChangeHour [optional] Numeric. The hour when the station description changed (0-23).
#' @param stationDescChangeMinute [optional] Numeric. The minute when the station description changed (0-59).
#' @param surfaceType [mandatory] Numeric. The type of surface (refer to the table of surface types).
#' @param topographyType [mandatory] Numeric. The type of topography (refer to the table of topography types).
#' @param address [mandatory] Character. The full address of the station.
#' @param telephone [optional] Character. The telephone number of the station.
#' @param fax [optional] Character. The fax number of the station.
#' @param tcpip [optional] Character. The TCP/IP number of the station.
#' @param mail [optional] Character. The e-mail address of the station.
#' @param latitude [mandatory] Numeric. The latitude of the station in degrees (0 = South Pole, positive values indicate northward).
#' @param longitude [mandatory] Numeric. The longitude of the station in degrees (0 = 180W, positive values indicate eastward).
#' @param altitude [mandatory] Numeric. The altitude of the station in meters above sea level.
#' @param synop [optional] Character. The identification of the 'SYNOP' station.
#' @param horizonChange [mandatory] Logical. Indicates if the horizon changed this month (`TRUE` or `FALSE`).
#' @param horizonChangeDay [optional] Numeric. The day of the month when the horizon changed.
#' @param horizonChangeHour [optional] Numeric. The hour when the horizon changed (0-23).
#' @param horizonChangeMinute [optional] Numeric. The minute when the horizon changed (0-59).
#' @param azimuth [optional] Numeric vector. The azimuth values in degrees from north, clockwise, in the format 'A1, A2, ..., An'.
#' @param elevation [optional] Numeric vector. The elevation values in degrees in the format 'E1, E2, ..., En'.
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
#' \itemize{
#'   \item LR0005$new() : Create a new LR0005 object
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
#' @param change [mandatory] Logical. Indicates if the radiosonde equipment changed this month (`TRUE` or `FALSE`).
#' @param changeDay [optional] Numeric. The day of the month when the radiosonde equipment changed.
#' @param changeHour [optional] Numeric. The hour when the radiosonde equipment changed (0-23).
#' @param changeMinute [optional] Numeric. The minute when the radiosonde equipment changed (0-59).
#' @param operating [mandatory] Logical. Indicates if the radiosonde is operating (`TRUE` or `FALSE`).
#' @param manufacturer [mandatory] Character. The manufacturer of the radiosonde.
#' @param location [mandatory] Character. The location of the radiosonde.
#' @param distanceFromSite [mandatory] Numeric. The distance from the radiation site in kilometers (km).
#' @param time1stLaunch [optional] Numeric. The time of the first radiosonde launch in hours (UTC).
#' @param time2ndLaunch [optional] Numeric. The time of the second radiosonde launch in hours (UTC).
#' @param time3rdLaunch [optional] Numeric. The time of the third radiosonde launch in hours (UTC).
#' @param time4thLaunch [optional] Numeric. The time of the fourth radiosonde launch in hours (UTC).
#' @param identification [mandatory] Character. The identification of the radiosonde.
#' @param remarks [optional] Character. Any additional remarks about the radiosonde.
#'
#' @export
#'
LR0005 <- R6::R6Class(
  classname = "LR0005",
  private = getPrivateVars("LR0005"),
  active = getActiveBindings("LR0005"),
  public = getPublicMethods("LR0005")
)


#' R6 Class representing BSRN LR0006 (Logical Record 0006)
#'
#' A LR0006 contain object.
#' \itemize{
#'   \item LR0006$new() : Create a new LR0006 object
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
#' @param change [mandatory] Logical. Indicates if the ozone measurements equipment changed this month (`TRUE` or `FALSE`).
#' @param changeDay [optional] Numeric. The day of the month when the ozone measurements equipment changed.
#' @param changeHour [optional] Numeric. The hour when the ozone measurements equipment changed (0-23).
#' @param changeMinute [optional] Numeric. The minute when the ozone measurements equipment changed (0-59).
#' @param operating [mandatory] Logical. Indicates if the ozone measurements are operating (`TRUE` or `FALSE`).
#' @param manufacturer [mandatory] Character. The manufacturer of the ozone measurement instrument.
#' @param location [mandatory] Character. The location of the ozone measurement instrument.
#' @param distanceFromSite [mandatory] Numeric. The distance from the radiation site in kilometers (km).
#' @param identification [mandatory] Character. The identification number of the ozone instrument.
#' @param remarks [optional] Character. Any additional remarks about the ozone measurements.
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
#' \itemize{
#'   \item LR0007$new() : Create a new LR0007 object
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
#' @param change [mandatory] Logical. Indicates if the station history changed this month (`TRUE` or `FALSE`).
#' @param changeDay [optional] Numeric. The day of the month when the station history changed.
#' @param changeHour [optional] Numeric. The hour when the station history changed (0-23).
#' @param changeMinute [optional] Numeric. The minute when the station history changed (0-59).
#' @param cloudAmount [optional] Character. Method used to estimate cloud amount (e.g., digital processing).
#' @param cloudBaseHeight [optional] Character. Method used to estimate cloud base height (with instrument).
#' @param cloudLiquid [optional] Character. Method used to estimate cloud liquid water content.
#' @param cloudAerosol [optional] Character. Method used to estimate cloud aerosol vertical distribution.
#' @param waterVapour [optional] Character. Method used to estimate water vapour pressure (v.d.) measurements.
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
#' \itemize{
#'   \item LR0008$new() : Create a new LR0008 object
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
#' @param change [mandatory] Logical. Indicates if the instruments changed this month (`TRUE` or `FALSE`).
#' @param changeDay [optional] Numeric. The day of the month when the instruments changed.
#' @param changeHour [optional] Numeric. The hour when the instruments changed (0-23).
#' @param changeMinute [optional] Numeric. The minute when the instruments changed (0-59).
#' @param operating [mandatory] Logical. Indicates if the instrument is currently measuring (`TRUE` or `FALSE`).
#' @param radiationQuantityMeasured [mandatory] Character. The radiation quantity being measured.
#' @param manufacturer [mandatory] Character. The manufacturer of the instrument.
#' @param model [mandatory] Character. The model of the instrument.
#' @param serialNumber [mandatory] Character. The serial number of the instrument.
#' @param dateOfPurchase [optional] Character. The date of purchase in `MM/DD/YY` format.
#' @param identification [mandatory] Character. The identification number assigned by the WRMC.
#' @param remarks [optional] Character. Additional remarks about the radiation instrument.
#' @param pyrgeometerBody [optional] Numeric. The pyrgeometer body compensation code.
#' @param pyrgeometerDome [optional] Numeric. The pyrgeometer dome compensation code.
#' @param numOfBand [optional] Numeric. The number of bands for spectral instruments.
#' @param wavelenghBand1 [optional] Numeric. The wavelength of band 1 in microns.
#' @param bandwidthBand1 [optional] Numeric. The bandwidth of band 1 in microns.
#' @param wavelenghBand2 [optional] Numeric. The wavelength of band 2 in microns.
#' @param bandwidthBand2 [optional] Numeric. The bandwidth of band 2 in microns.
#' @param wavelenghBand3 [optional] Numeric. The wavelength of band 3 in microns.
#' @param bandwidthBand3 [optional] Numeric. The bandwidth of band 3 in microns.
#' @param maxZenithAngle [optional] Numeric. The maximum zenith angle in degrees for direct measurements.
#' @param minSpectral [optional] Numeric. The minimum spectral value for the instrument.
#' @param location [mandatory] Character. The location where calibration was performed.
#' @param person [mandatory] Character. The person responsible for the calibration.
#' @param startOfCalibPeriod1 [mandatory] Character. The start of the calibration period for band 1 in `MM/DD/YY` format.
#' @param endOfCalibPeriod1 [mandatory] Character. The end of the calibration period for band 1 in `MM/DD/YY` format.
#' @param numOfComp1 [optional] Numeric. The number of comparisons for band 1.
#' @param meanCalibCoeff1 [mandatory] Numeric. The mean calibration coefficient for band 1.
#' @param stdErrorCalibCoeff1 [optional] Numeric. The standard error of the calibration coefficient for band 1.
#' @param startOfCalibPeriod2 [optional] Character. The start of the calibration period for band 2 in `MM/DD/YY` format.
#' @param endOfCalibPeriod2 [optional] Character. The end of the calibration period for band 2 in `MM/DD/YY` format.
#' @param numOfComp2 [optional] Numeric. The number of comparisons for band 2.
#' @param meanCalibCoeff2 [optional] Numeric. The mean calibration coefficient for band 2.
#' @param stdErrorCalibCoeff2 [optional] Numeric. The standard error of the calibration coefficient for band 2.
#' @param startOfCalibPeriod3 [optional] Character. The start of the calibration period for band 3 in `MM/DD/YY` format.
#' @param endOfCalibPeriod3 [optional] Character. The end of the calibration period for band 3 in `MM/DD/YY` format.
#' @param numOfComp3 [optional] Numeric. The number of comparisons for band 3.
#' @param meanCalibCoeff3 [optional] Numeric. The mean calibration coefficient for band 3.
#' @param stdErrorCalibCoeff3 [optional] Numeric. The standard error of the calibration coefficient for band 3.
#' @param remarksOnCalib1 [optional] Character. Remarks on the calibration, including units of the calibration coefficient.
#' @param remarksOnCalib2 [optional] Character. Additional remarks on the calibration (continued).
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


#' R6 Class representing BSRN LR4000CONST (Logical Record 4000 constant)
#'
#' A LR4000CONST contain object.
#' \itemize{
#'   \item LR4000CONST$new() : Create a new LR4000 object
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
#' @param serialNumber_Manufacturer The serial number of the pyrgeometer as shown on the manufacturer's plate or in the calibration certificate (e.g., `050783` for Kipp & Zonen CGR4).
#' @param serialNumber_WRMC The serial number used in your station-to-archive files (as defined in LR0008/0009), corresponding to the pyrgeometer's WMO/BSRN identifier (e.g., `61008`).
#' @param certificateCodeID The Certificate Code ID of the calibration certificate. This can be the reference number of the official calibration certificate (Method 1) or the name of the archived calibration document (Method 2). Example for Method 2: `CAL_yyyymmdd_manufact_model_serial_WRMCnum`.
#' @param yyyymmdd The date when the calibration certificate was issued, formatted as `yyyymmdd` (e.g., `20211026` for October 26, 2021).
#' @param manufact The 2-letter code representing the manufacturer of the pyrgeometer (e.g., `KZ` for Kipp & Zonen, `EP` for Eppley, `HF` for Hukseflux).
#' @param model The model of the pyrgeometer (e.g., `CGR4`, `CM21`, `CM22`, `CH1`). This should match the model mentioned in the calibration certificate.
#' @param C The thermopile responsivity of the pyrgeometer, expressed in µV/W/m². This value is crucial for computing longwave radiation.
#' @param k0 A constant in the general equation of the pyrgeometer, related to the thermopile output and calibration factors.
#' @param k1 A constant in the general equation of the pyrgeometer, representing temperature-dependent corrections for the instrument.
#' @param k2 A constant in the general equation of the pyrgeometer, associated with the Stefan-Boltzmann law for temperature-dependent longwave radiation.
#' @param k3 A constant in the general equation of the pyrgeometer, representing corrections for temperature differences between the instrument's dome and body.
#' @param f A correction factor in the general equation of the pyrgeometer, accounting for infrared irradiance differences on unshaded domes.
#'
#' @export
#' @example inst/examples/LR4000CONST.R
#'
LR4000CONST <- R6::R6Class(
  classname = "LR4000CONST",
  private = getPrivateVars("LR4000CONST"),
  active = getActiveBindings("LR4000CONST"),
  public = getPublicMethods("LR4000CONST")
)

