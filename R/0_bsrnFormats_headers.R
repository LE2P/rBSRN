#' LR0001 get BSRN format function
#'
#' @param listSensor List of sensor use in the file
#'
#' @return A char with the BSRN format
#'
lr0001GetBsrnFormat <- function(listSensor = c("2", "3", "4", "5", "21", "22", "23")){

  stopIfValuesMissing(message = "LR0001", self)

  lS <- listSensor %>%  as.numeric(); n <- length(lS)
  listIds <- c(lS, rep(-1, 8 - n%%8)) %>% matrix(nrow = 8) %>% t() %>% format(width = 9)
  formatListSensor <- paste0(" ", apply(listIds, 1, paste, collapse = " ") %>% paste(collapse = "\n "))

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste(
    "*C0001",
    " $[.2s]{stationNumber} $[.2s]{month} $[.4s]{year} $[.2s]{version}",
    formatListSensor,
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0002 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0002GetBsrnFormat <- function(){

  stopIfValuesMissing(message = "LR0001", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  scientistChange <- private$.scientistChange
  deputyChange <- private$.deputyChange

  thisFormat <- paste(
    ifelse(scientistChange | deputyChange, "*C0002", "*U0002"),
    ifelse(scientistChange, " $[.2s]{scientistChangeDay} $[.2s]{scientistChangeHour} $[.2s]{scientistChangeMinute}", " -1 -1 -1"),
    "$[.38s]{scientistName} $[.20s]{scientistTel} $[.20s]{scientistFax}",
    "$[.15s]{scientistTcpip} $[.50s]{scientistMail}",
    "$[.80s]{scientistAddress}",
    ifelse(deputyChange, " $[.2s]{deputyChangeDay} $[.2s]{deputyChangeHour} $[.2s]{deputyChangeMinute}", " -1 -1 -1"),
    "$[.38s]{deputyName} $[.20s]{deputyTel} $[.20s]{deputyFax}",
    "$[.15s]{deputyTcpip} $[.50s]{deputyMail}",
    "$[.80s]{deputyAddress}",
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0003 get BSRN format function
#'
#' @param ... Few more text to put in comment (ex : the LR4000CONST metadata information)
#'
#' @return A char with the BSRN format
#'
lr0003GetBsrnFormat <- function(...){
  stopIfValuesMissing(message = "LR0003", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  res <- "*U0003"
  res <- paste(res, message, ..., sep = "\n")
  return(res)
}


#' LR0004 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0004GetBsrnFormat <- function(){

  stopIfValuesMissing(message = "LR0004", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste(
    ifelse(private$.stationDescChange | private$.horizonChange, "*C0004", "*U0004"),
    ifelse(private$.stationDescChange, " $[.2s]{stationDescChangeDay} $[.2s]{stationDescChangeHour} $[.2s]{stationDescChangeMin}", " -1 -1 -1"),
    " $[.2s]{surfaceType} $[.2s]{topographyType}",
    "$[.80s]{address}",
    "$[.20s]{telephone} $[.20s]{fax}",
    "$[.15s]{tcpip} $[.50s]{mail}",
    " $[.7s]{latitude} $[.7s]{longitude} $[.4s]{altitude} $[.5s]{synop}",
    ifelse(private$.horizonChange, " $[.2s]{horizonChangeDay} $[.2s]{horizonChangeHour} $[.2s]{horizonChangeMin}", " -1 -1 -1"),
    getAzimuthElevation(azimuth, elevation),
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0005 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0005GetBsrnFormat <- function(){

  stopIfValuesMissing(message = "LR0005", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste(
    ifelse(private$.change, "*C0005", "*U0005"),
    paste(ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"), ifelse(private$.operating, "Y", "N")),
    "$[.30s]{manufacturer} $[.25s]{location} $[.3s]{distanceFromSite} $[.2s]{time1stLaunch} $[.2s]{time2ndLaunch} $[.2s]{time3rdLaunch} $[.2s]{time4thLaunch} $[.5s]{identification}",
    "$[.80s]{remarks}",
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)

}


#' LR0006 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0006GetBsrnFormat <- function(){

  stopIfValuesMissing(message = "LR0006", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste(
    ifelse(private$.change, "*C0006", "*U0006"),
    paste(ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"), ifelse(private$.operating, "Y", "N")),
    "$[.30s]{manufacturer} $[.25s]{location} $[.3s]{distanceFromSite} $[.5s]{identification}",
    "$[.80s]{remarks}",
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0007 get BSRN format function
#'
#' @param synop the value of the synop (LR0007)
#'
#' @return A char with the BSRN format
#'
lr0007GetBsrnFormat <- function(synop = NULL){

  stopIfValuesMissing(message = "LR0007", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  flags <- paste(
    ifelse(is.null(synop), "N", "Y"),
    ifelse(is.null(private$.cloudAmount), "N", "Y"),
    ifelse(is.null(private$.cloudBaseHeight), "N", "Y"),
    ifelse(is.null(private$.cloudLiquid), "N", "Y"),
    ifelse(is.null(private$.cloudAerosol), "N", "Y"),
    ifelse(is.null(private$.waterVapour), "N", "Y")
  )

  thisFormat <- paste(
    ifelse(private$.change, "*C0007", "*U0007"),
    ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"),
    "$[.80s]{cloudAmount}",
    "$[.80s]{cloudBaseHeight}",
    "$[.80s]{cloudLiquid}",
    "$[.80s]{cloudAerosol}",
    "$[.80s]{waterVapour}",
    flags,
    sep = '\n'
  )

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0008 get BSRN format function
#'
#' @param anyChange boolean if LR0008 changed
#' @param printLr boolean to print first row of LR
#' @param LR0009Format boolean display LR0009 ?
#'
#' @return A char with the BSRN format
#'
lr0008GetBsrnFormat <- function(anyChange = FALSE, printLr = FALSE, LR0009Format = FALSE){

  stopIfValuesMissing(message = "LR0008", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  if (LR0009Format){
    thisFormat <- paste(
      ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"),
      "$[.9s]{radiationQuantityMeasured} $[.5s]{identification} $[.2s]{numOfBand}"
    )
  } else {
    thisFormat <- paste(
      paste(ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"), ifelse(private$.operating, "Y", "N")),
      "$[.30s]{manufacturer} $[.15s]{model} $[.18s]{serialNumber} $[.8s]{dateOfPurchase} $[.5s]{identification}",
      "$[.80s]{remarks}",
      " $[2s]{pyrgeometerBody} $[2s]{pyrgeometerDome} $[.7s]{wavelenghBand1} $[.7s]{bandwidthBand1} $[.7s]{wavelenghBand2} $[.7s]{bandwidthBand2} $[.7s]{wavelenghBand3} $[.7s]{bandwidthBand3} $[.2s]{maxZenithAngle} $[.2s]{minSpectral}",
      "$[.30s]{location} $[.40s]{person}",
      "$[.8s]{startOfCalibPeriod1} $[.8s]{endOfCalibPeriod1} $[.2s]{numOfComp1} $[.12s]{meanCalibCoeff1} $[.12s]{stdErrorCalibCoeff1}",
      "$[.8s]{startOfCalibPeriod2} $[.8s]{endOfCalibPeriod2} $[.2s]{numOfComp2} $[.12s]{meanCalibCoeff2} $[.12s]{stdErrorCalibCoeff2}",
      "$[.8s]{startOfCalibPeriod3} $[.8s]{endOfCalibPeriod3} $[.2s]{numOfComp3} $[.12s]{meanCalibCoeff3} $[.12s]{stdErrorCalibCoeff3}",
      "$[.80s]{remarksOnCalib1}",
      "$[.80s]{remarksOnCalib2}",
      sep = '\n'
    )
  }

  if (printLr){
    h <- paste0(ifelse(anyChange, "*C000", "*U000"), ifelse(LR0009Format, "9", "8"), "\n")
    thisFormat <- paste0(h, thisFormat)
  }

  res <- str_interp(thisFormat)
  return(res)
}


#' LR4000CONST get BSRN format function
#'
#' @param method A character or numeric value indicating which method to use for compiling the `@LR4000CONST` metadata:
#'        - If `1`, the function will use **Method 1**, where all calibration constants and metadata are manually inputted directly in the metadata line (e.g., `@LR4000CONST, s/n, WMO, CertificateCodeID, C, k0, k1, k2, k3, f`).
#'        - If `2`, the function will use **Method 2**, where the calibration certificate is stored centrally, and the metadata line includes a reference to the centrally stored calibration document (e.g., `@LR4000CONST, s/n, WMO, CAL_date_manufacturer_model_serial_WMO,& C, k0, k1, k2, k3, f`).
#'        Method 2 is preferred if calibration documents are stored in a centralized archive.
#' @return A char with the BSRN format
#'
lr4000constGetBsrnFormat <- function(method = 1){
  stopIfValuesMissing(message = "LR4000CONST", self)
  if (!method %in% c(1,2)) stop("method must be 1 or 2")

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  if (method == 2) {
    bool <- yyyymmdd == "" | manufact == "" | model == ""
    if (bool) stop("missing value(s) : yyyymmdd, manufact or model")

    certificateCodeID = paste(
    "CAL", yyyymmdd, manufact, model, serialNumber_Manufacturer,
    serialNumber_WRMC, sep = "_")
  }

  if (certificateCodeID == "") stop("missing value(s) : certificateCodeID")

  res <- paste("@LR4000CONST", serialNumber_Manufacturer, serialNumber_WRMC,
               certificateCodeID, C, k0, k1, k2, k3, f, sep = ", ") |>
    str_wrap(width = 79)  |> str_replace('\n', '&\n')

  return(res)
}
