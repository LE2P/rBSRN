#' Table A1. BSRN station-to-archive file format.
#'
#' All logical records are compulsory definitions. The file is identified by the
#' station id no., the year and the month in logical record 0001. The dates of
#' change in logical records 0002, 0004, 0005, 0006, 0007, 0008, and 0009 are given
#' by day, hour, and minute with ranges 1... 31, 0... 23, and 0... 59. The dates of
#' measurement in logical records 0100, 0200, ... are given by day and minute with
#' ranges 1... 31 and 0... 1439 also for quantities measured in hour intervals
#'
"A1_formats"


#' Table A2. BSRN stations.
#'
#' For more information see: http://www.bsrn.awi.de/en/stations/listings/.
#'
"A2_bsrnStations"


#' Table A3. Quantity measured.
#'
#' Every radiation value is measured by exactly one radiation instrument.
#' If a value in height is missing, the quantity is measured only once at
#' standard height. The id. no. of instruments not measured at standard height
#' consists of the id. no. measured at standard height followed by 6 numericals
#' expressing the height of the instruments above ground in cm.
#'
"A3_quantities"


#' Table A4. Types of surface.
#'
"A4_surfaces"


#' Table A5. Types of topography.
#'
"A5_topographies"


#' Table A6. Pyrgeometer body temperature compensation codes.
#'
"A6_pyrgeometers"


#' Table A7. Pyrgeometer dome temperature compensation codes.
#'
"A7_pyrgeometers"
