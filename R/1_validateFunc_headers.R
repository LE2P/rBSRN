#' Integer validation function
#'
#' @param value value to validate
#' @param digits number of digits
#'
I_validateFunction <- function(value, digits, min = 0, max = (10^digits) - 1){
  if (!is.numeric(value)) return(simpleError("must be a numerical value"))
  if (value%%1 != 0) return(simpleError("must be an integer"))
  if (value < min | value > max )
    return(simpleError(paste('must be between', min, 'and', max)))
}


#' Character validation function
#'
#' @param value value to validate
#' @param maxLenght maximun lenght of value
#'
A_validateFunction <- function(value, maxLenght = Inf){
  if (!is.character(value)) return(simpleError('must be a character'))
  n <- nchar(value)
  if (n < 1 | n > maxLenght)
    return(simpleError(paste('number of character must be between 1 and', maxLenght)))
}


#' Fixed point format validation fonction
#'
#' @param value value to validate
#' @param w w of Fw.d
#' @param d d of Fw.d
#'
F_validateFunction <- function(value, w, d){
  if (!is.numeric(value)) return(simpleError("must be a numerical value"))
  s <- strsplit(as.character(value), "\\.")[[1]]
  if (length(s) >= 1){
    if (nchar(s[1]) >= (w - d)) return(simpleError(paste0("must be at format F", w, ".", d)))
  }
  if (length(s) > 1){
    if (nchar(s[2]) > d) return(simpleError(paste0("must be at format F", w, ".", d)))
  }
}


#' Logical validation function
#'
#' @param value value to validate
#'
L_validateFunction <- function(value){
  if (!is.logical(value))
    return(simpleError("must be a logical value (TRUE or FALSE)"))
}


#' I2 validation function
#'
#' @param value value to validate
#'
I2_validateFunction <- function(value){
  err <- I_validateFunction(value, 2)
  if(!is.null(err)) return(err)
}


#' I3 validation function
#'
#' @param value value to validate
#'
I3_validateFunction <- function(value){
  err <- I_validateFunction(value, 3)
  if(!is.null(err)) return(err)
}


#' I4 validation function
#'
#' @param value value to validate
#'
I4_validateFunction <- function(value){
  err <- I_validateFunction(value, 4)
  if(!is.null(err)) return(err)
}


#' I5 validation function
#'
#' @param value value to validate
#'
I5_validateFunction <- function(value){
  err <- I_validateFunction(value, 5)
  if(!is.null(err)) return(err)
}


#' month validation function
#'
#' @param value value to validate
#'
month_validateFunction <- function(value){
  err <- I_validateFunction(value, 2, 1, 12)
  if(!is.null(err)) return(err)
}


#' year validation function
#'
#' @param value value to validate
#'
year_validateFunction <- function(value){
  err <- I_validateFunction(value, 4, 1992)
  if(!is.null(err)) return(err)
}


#' day validation function
#'
#' @param value value to validate
#'
day_validateFunction <- function(value){
  err <- I_validateFunction(value, 2, 1, 31)
  if(!is.null(err)) return(err)
}


#' hour validation function
#'
#' @param value value to validate
#'
hour_validateFunction <- function(value){
  err <- I_validateFunction(value, 2, 0, 23)
  if(!is.null(err)) return(err)
}


#' minute validation function
#'
#' @param value value to validate
#'
minute_validateFunction <- function(value){
  err <- I_validateFunction(value, 2, 0, 59)
  if(!is.null(err)) return(err)
}

#' A5 validation function
#'
#' @param value value to validate
#'
A5_validateFunction <- function(value){
  err <- A_validateFunction(value, 5)
  if(!is.null(err)) return(err)
}


#' A15 validation function
#'
#' @param value value to validate
#'
A15_validateFunction <- function(value){
  err <- A_validateFunction(value, 15)
  if(!is.null(err)) return(err)
}


#' A18 validation function
#'
#' @param value value to validate
#'
A18_validateFunction <- function(value){
  err <- A_validateFunction(value, 18)
  if(!is.null(err)) return(err)
}


#' A25 validation function
#'
#' @param value value to validate
#'
A25_validateFunction <- function(value){
  err <- A_validateFunction(value, 25)
  if(!is.null(err)) return(err)
}


#' A30 validation function
#'
#' @param value value to validate
#'
A30_validateFunction <- function(value){
  err <- A_validateFunction(value, 30)
  if(!is.null(err)) return(err)
}


#' A38 validation function
#'
#' @param value value to validate
#'
A38_validateFunction <- function(value){
  err <- A_validateFunction(value, 38)
  if(!is.null(err)) return(err)
}


#' A40 validation function
#'
#' @param value value to validate
#'
A40_validateFunction <- function(value){
  err <- A_validateFunction(value, 40)
  if(!is.null(err)) return(err)
}


#' A80 validation function
#'
#' @param value value to validate
#'
A80_validateFunction <- function(value){
  err <- A_validateFunction(value, 80)
  if(!is.null(err)) return(err)
}


#' telephone validation function
#'
#' @param value value to validate
#'
telephone_validateFunction <- function(value){
  err <- A_validateFunction(value, 20)
  if(!is.null(err)) return(err)

  telephoneRegex <- "^[+]?[[:digit:][:space:]]{8,20}$"
  if(!str_detect(value, telephoneRegex))
    return(simpleError("must have a telephone format"))
}


#' tcpip validation function
#'
#' @param value value to validate
#'
tcpip_validateFunction <- function(value){
  err <- A_validateFunction(value, 15)
  if(!is.null(err)) return(err)

  tcpipRegex <- "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
  if(!str_detect(value, tcpipRegex))
    return(simpleError("must have a TCP/IP format"))
}


#' email validation function
#'
#' @param value value to validate
#'
email_validateFunction <- function(value){
  err <- A_validateFunction(value, 50)
  if(!is.null(err)) return(err)

  emailRegex <- "^[[:alnum:]._-]+@[[:alnum:]-]+[.]{1}[[:alnum:]]{2,4}$"
  if(!str_detect(value, emailRegex))
    return(simpleError("must have a e-mail format"))
}


#' radiation quantities measured validation function
#'
#' @param value value to validate
#'
quantities_validateFunction <- function(value){
  if (!value %in% A3_quantities)
    return(simpleError("must be in A3_quantities (package table)"))
}


#' surface validation function
#'
#' @param value value to validate
#'
surface_validateFunction <- function(value){
  if (!value %in% A4_surfaces)
    return(simpleError("must be in A4_surfaces (package table)"))
}


#' topography type validation function
#'
#' @param value value to validate
#'
topography_validateFunction <- function(value){
  if (!value %in% A5_topographies)
    return(simpleError("must be in A5_topographies (package table)"))
}


#' pyrgeometer body validation function
#'
#' @param value value to validate
#'
body_validateFunction <- function(value){
  if (!value %in% A6_pyrgeometers)
    return(simpleError("must be in A6_pyrgeometers (package table)"))
}


#' pyrgeometer dome validation function
#'
#' @param value value to validate
#'
dome_validateFunction <- function(value){
  if (!value %in% A7_pyrgeometers)
    return(simpleError("must be in A7_pyrgeometers (package table)"))
}


#' F7.3 validation function
#'
#' @param value value to validate
#'
F7.3_validateFunction <- function(value){
  err <- F_validateFunction(value, 7, 3)
  if(!is.null(err)) return(err)
}


#' F12.4 validation function
#'
#' @param value value to validate
#'
F12.4_validateFunction <- function(value){
  err <- F_validateFunction(value, 12, 4)
  if(!is.null(err)) return(err)
}


#' latitude validation function
#'
#' @param value value to validate
#'
latitude_validateFunction <- function(value){
  err <- F_validateFunction(value, 7, 3)
  if(!is.null(err)) return(err)

  latitudeRegex <- "^(?:1[0-7][0-9]|[0-9]?[0-9])\\.[0-9]{3}$"
  if(!str_detect(value, latitudeRegex))
    return(simpleError("must have a latitude format"))
}


#' longitude validation function
#'
#' @param value value to validate
#'
longitude_validateFunction <- function(value){
  err <- F_validateFunction(value, 7, 3)
  if(!is.null(err)) return(err)

  longitudeRegex <- "^(?:3[0-5][0-9]|2[0-9][0-9]|[01]?[0-9]?[0-9])\\.[0-9]{3}$"
  if(!str_detect(value, longitudeRegex))
    return(simpleError("must have a longitude format"))
}


#' date validation function
#'
#' format : (MM/DD/YY)
#'
#' @param value value to validate
#'
date_validateFunction <- function(value){
  err <- A_validateFunction(value, 8)
  if(!is.null(err)) return(err)

  if (is.na(as.Date(value, format = '%m/%d/%Y')))
    return(simpleError('must have format "MM/DD/YY"'))
}


#' zenith validation function
#'
#' @param value value to validate
#'
zenith_validateFunction <- function(value){
  err <- I_validateFunction(value, 2, 0, 90)
  if(!is.null(err)) return(err)
}


#' azimuth validation function
#'
#' @param value value to validate
#'
azimuth_validateFunction <- function(value){
  err <- A_validateFunction(value)
  if(!is.null(err)) return(err)

  azimuthRegex <- "^(?:(?:3[0-5][0-9]|2[0-9][0-9]|[01]?[0-9]?[0-9]),)*(?:(?:3[0-5][0-9]|2[0-9][0-9]|[01]?[0-9]?[0-9]){1})$"
  if(!str_detect(value, azimuthRegex))
    return(simpleError("must have a azimuth format (A1,A2,...,An)"))
}


#' elevation validation function
#'
#' @param value value to validate
#'
elevation_validateFunction <- function(value){
  err <- A_validateFunction(value)
  if(!is.null(err)) return(err)

  elevationRegex <- "^(?:(?:[0-8]?[0-9]),)*(?:(?:[0-8]?[0-9]){1})$"
  if(!str_detect(value, elevationRegex))
    return(simpleError("must have a elevation format (E1,E2,...,En)"))
}

