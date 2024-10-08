% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/2_R6Class_headers.R
\name{LR0004}
\alias{LR0004}
\title{R6 Class representing BSRN LR0004 (Logical Record 0004)}
\arguments{
\item{stationDescChange}{[mandatory] Logical. Indicates if the station description changed this month (`TRUE` or `FALSE`).}

\item{stationDescChangeDay}{[optional] Numeric. The day of the month when the station description changed.}

\item{stationDescChangeHour}{[optional] Numeric. The hour when the station description changed (0-23).}

\item{stationDescChangeMinute}{[optional] Numeric. The minute when the station description changed (0-59).}

\item{surfaceType}{[mandatory] Numeric. The type of surface (refer to the table of surface types).}

\item{topographyType}{[mandatory] Numeric. The type of topography (refer to the table of topography types).}

\item{address}{[mandatory] Character. The full address of the station.}

\item{telephone}{[optional] Character. The telephone number of the station.}

\item{fax}{[optional] Character. The fax number of the station.}

\item{tcpip}{[optional] Character. The TCP/IP number of the station.}

\item{mail}{[optional] Character. The e-mail address of the station.}

\item{latitude}{[mandatory] Numeric. The latitude of the station in degrees (0 = South Pole, positive values indicate northward).}

\item{longitude}{[mandatory] Numeric. The longitude of the station in degrees (0 = 180W, positive values indicate eastward).}

\item{altitude}{[mandatory] Numeric. The altitude of the station in meters above sea level.}

\item{synop}{[optional] Character. The identification of the 'SYNOP' station.}

\item{horizonChange}{[mandatory] Logical. Indicates if the horizon changed this month (`TRUE` or `FALSE`).}

\item{horizonChangeDay}{[optional] Numeric. The day of the month when the horizon changed.}

\item{horizonChangeHour}{[optional] Numeric. The hour when the horizon changed (0-23).}

\item{horizonChangeMinute}{[optional] Numeric. The minute when the horizon changed (0-59).}

\item{azimuth}{[optional] Numeric vector. The azimuth values in degrees from north, clockwise, in the format 'A1, A2, ..., An'.}

\item{elevation}{[optional] Numeric vector. The elevation values in degrees in the format 'E1, E2, ..., En'.}
}
\description{
A LR0004 contain object.
\itemize{
  \item LR0004$new() : Create a new LR0004 object
  \item isMandatory() : Is variable version is mandatory ?
  \item isMissing() : Is variable version is missing ?
  \item isValuesMissing() : Is any value is missing ?
  \item mandatories() : List of mandatory variable.
  \item missings() : List of missing variables.
  \item setDefault() : Set a variable to default value.
  \item getFormatValue () : Get value with the correct format.
  \item getBsrnFormat() : Get the BSRN format of the object.
  \item showBsrnFormat() : Print the BSRN format.
  \item print() : Generic print method.
}
}
\examples{
lr0004 <- LR0004$new(
  surfaceType = 11,
  topographyType = 1,
  address = "123 Main Street, Anytown, USA 12345",
  telephone = "+1 800 123 4567",
  latitude = 69.099,
  longitude = 235.484,
  altitude = 116,
  azimuth = "0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345",
  elevation = "0,0,0,0,0,0,0,0,6,6,8,8,11,10,9,8,7,6,3,0,0,0,0,0"
)

lr0004$getBsrnFormat()
lr0004$showBsrnFormat()
lr0004
}
