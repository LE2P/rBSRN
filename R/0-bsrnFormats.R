#' LR0001 get BSRN format function
#'
#' @param listSensor List of sensor use in the file
#'
#' @return A char with the BSRN format
#'
lr0001GetBsrnFormat <- function(listSensor = c("2", "3", "4", "5", "21", "22", "23")){
  #TODO : change this ways of list sensors
  #TODO : is justify necessary ?
  #TODO : Ameliorer le code pour le rendre plus clair

  stopIfValuesMissing(message = "LR0001", self)

  listIds <- t(matrix(c(listSensor, rep(-1, 8 - length(listSensor) %% 8)), nrow = 8))
  listIds <- format(listIds, width = 9, justify = "right")
  formatListSensor <- paste0(" ", paste(apply(listIds, 1, paste, collapse = " "), collapse = "\n "))

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
#' @return A char with the BSRN format
#'
lr0003GetBsrnFormat <- function(){
  stopIfValuesMissing(message = "LR0003", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  res <- "*U0003"
  res <- paste(res, message, sep = "\n")
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

  # ex data :
  # azimuth <- seq(0, 350, length.out = 15)
  # elevation <- round(seq(0, 89, length.out = 15))
  # TODO : Ameliorer le split (avec une fct par exemple)
  if (is.null(private$.azimuthElevation)){
    AzimuthElevation <- "  -1 -1"
  } else {
    aziEleSplit <- unlist(strsplit(strsplit(private$.azimuthElevation, ",")[[1]],"-"))
    azimuth <- aziEleSplit[seq(1,length(aziEleSplit), 2)]
    elevation <- aziEleSplit[seq(2,length(aziEleSplit), 2)]
    azimuth <- c(azimuth, rep(-1, 11 - length(azimuth) %% 11))
    elevation <- c(elevation, rep(-1, 11 - length(elevation) %% 11))
    azimuth <- format(azimuth, width = 3, justify = "right")
    elevation <- format(elevation, width = 2, justify = "right")
    aziEle <- t(matrix(c(rbind(azimuth, elevation)), nrow = 22))
    AzimuthElevation <- paste0(" ", paste(apply(aziEle, 1, paste, collapse = " "), collapse = "\n "))
  }

  thisFormat <- paste(
    ifelse(private$.stationDescChange | private$.horizonChange, "*C0004", "*U0004"),
    ifelse(private$.stationDescChange, " $[.2s]{stationDescChangeDay} $[.2s]{stationDescChangeHour} $[.2s]{stationDescChangeMin}", " -1 -1 -1"),
    " $[.2s]{surfaceType} $[.2s]{topographyType}",
    "$[.80s]{address}",
    "$[.20s]{telephone} $[.20s]{fax}",
    "$[.15s]{tcpip} $[.50s]{mail}",
    " $[.7s]{latitude} $[.7s]{longitude} $[.4s]{altitude} $[.5s]{synop}",
    ifelse(private$.horizonChange, " $[.2s]{horizonChangeDay} $[.2s]{horizonChangeHour} $[.2s]{horizonChangeMin}", " -1 -1 -1"),
    AzimuthElevation,
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
#' @return A char with the BSRN format
#'
lr0007GetBsrnFormat <- function(synop){

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
#' @return A char with the BSRN format
#'
lr0008GetBsrnFormat <- function(anyChange = FALSE, printLr = FALSE){

  stopIfValuesMissing(message = "LR0008", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

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

  if (printLr)
    thisFormat <- paste(ifelse(anyChange, "*C0008", "*U0008"), thisFormat, sep = "\n")

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0009 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0009GetBsrnFormat <- function(anyChange = FALSE, printLr = FALSE){

  stopIfValuesMissing(message = "LR0009", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste0(
    if (printLr) ifelse(anyChange, "*C0009\n", "*U0009\n"),
    paste(
      ifelse(private$.change, " $[.2s]{changeDay} $[.2s]{changeHour} $[.2s]{changeMin}", " -1 -1 -1"),
      "$[.9s]{radiationQuantityMeasured} $[.5s]{identification} $[.2s]{numOfBand}"
    )
  )

  res <- str_interp(thisFormat)
  return(res)
}
