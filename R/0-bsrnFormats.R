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


#' #' LR0003 get BSRN format function
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
