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
  if (is.null(private$pAzimuthElevation)){
    AzimuthElevation <- "  -1 -1"
  } else {
    aziEleSplit <- unlist(strsplit(strsplit(private$pAzimuthElevation, ",")[[1]],"-"))
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
    ifelse(private$pStationDescChange | private$pHorizonChange, "*C0004", "*U0004"),
    ifelse(private$pStationDescChange, " $[.2s]{private$pStationDescChangeDay} $[.2s]{private$pStationDescChangeHour} $[.2s]{private$pStationDescChangeMin}", " -1 -1 -1"),
    " $[.2s]{surface} $[.2s]{topography}",
    "$[.80s]{address}",
    "$[.20s]{tel} $[.20s]{fax}",
    "$[.15s]{tcpip} $[.50s]{email}",
    " $[.7s]{latitude} $[.7s]{longitude} $[.4s]{altitude} $[.5s]{synop}",
    ifelse(private$pHorizonChange, " $[.2s]{private$pHorizonChangeDay} $[.2s]{private$pHorizonChangeHour} $[.2s]{private$pHorizonChangeMin}", " -1 -1 -1"),
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
    ifelse(is.null(private$pCloudAmount), "N", "Y"),
    ifelse(is.null(private$pCloudBaseHeight), "N", "Y"),
    ifelse(is.null(private$pCloudLiquid), "N", "Y"),
    ifelse(is.null(private$pCloudAerosol), "N", "Y"),
    ifelse(is.null(private$pWaterVapour), "N", "Y")
  )

  thisFormat <- paste(
    ifelse(private$pChange, "*C0007", "*U0007"),
    ifelse(private$pChange, " $[.2s]{private$pChangeDay} $[.2s]{private$pChangeHour} $[.2s]{private$pChangeMin}", " -1 -1 -1"),
    "$[.80s]{CloudAmount}",
    "$[.80s]{CloudBaseHeight}",
    "$[.80s]{CloudLiquid}",
    "$[.80s]{CloudAerosol}",
    "$[.80s]{WaterVapour}",
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
lr0008GetBsrnFormat <- function(change = FALSE, printLr = FALSE){

  stopIfValuesMissing(message = "LR0008", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste(
    paste(ifelse(private$pChange, " $[.2s]{private$pChangeDay} $[.2s]{private$pChangeHour} $[.2s]{private$pChangeMin}", " -1 -1 -1"), ifelse(private$pOperating, "Y", "N")),
    "$[.30s]{Manufacturer} $[.15s]{Model} $[.18s]{SerialNumber} $[.8s]{DateOfPurchase} $[.5s]{Identification}",
    "$[.80s]{Remarks}",
    " $[2s]{PyrgeometerBody} $[2s]{PyrgeometerDome} $[.7s]{WavelenghBand1} $[.7s]{BandwidthBand1} $[.7s]{WavelenghBand2} $[.7s]{BandwidthBand2} $[.7s]{WavelenghBand3} $[.7s]{BandwidthBand3} $[.2s]{MaxZenithAngle} $[.2s]{MinSpectral}",
    "$[.30s]{Location} $[.40s]{Person}",
    "$[.8s]{StartOfCalibPeriod1} $[.8s]{EndOfCalibPeriod1} $[.2s]{NumOfComp1} $[.12s]{MeanCalibCoeff1} $[.12s]{StdErrorCalibCoeff1}",
    "$[.8s]{StartOfCalibPeriod2} $[.8s]{EndOfCalibPeriod2} $[.2s]{NumOfComp2} $[.12s]{MeanCalibCoeff2} $[.12s]{StdErrorCalibCoeff2}",
    "$[.8s]{StartOfCalibPeriod3} $[.8s]{EndOfCalibPeriod3} $[.2s]{NumOfComp3} $[.12s]{MeanCalibCoeff3} $[.12s]{StdErrorCalibCoeff3}",
    "$[.80s]{RemarksOnCalib1}",
    "$[.80s]{RemarksOnCalib2}",
    sep = '\n'
  )

  if (printLr)
    thisFormat <- paste(ifelse(change, "*C0008", "*U0008"), thisFormat, sep = "\n")

  res <- str_interp(thisFormat)
  return(res)
}


#' LR0009 get BSRN format function
#'
#' @return A char with the BSRN format
#'
lr0009GetBsrnFormat <- function(change = FALSE, printLr = FALSE){

  stopIfValuesMissing(message = "LR0009", self)

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  thisFormat <- paste0(
    if (printLr) ifelse(change, "*C0009\n", "*U0009\n"),
    paste(
      ifelse(private$pChange, " $[.2s]{private$pChangeDay} $[.2s]{private$pChangeHour} $[.2s]{private$pChangeMin}", " -1 -1 -1"),
      "$[.9s]{RadiationQuantityMeasured} $[.5s]{Identification} $[.2s]{NumOfBand}"
    )
  )

  res <- str_interp(thisFormat)
  return(res)
}
