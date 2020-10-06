rm(list = ls())
library(rBSRN)

rBSRN::LR0001

ls(getNamespace("rBSRN"), all.names=FALSE) # Shows unhidden functions
ls(getNamespace("rBSRN"), all.names=TRUE) # Shows all functions.

lr0001 = LR0001$new(stationNumber = 82, month = 12, version = 3)
lr0001$stationNumber = 2
lr0001$stationNumber = "2"

lr0001$mandatories()
lr0001$missings()
lr0001$isValuesMissing()

lr0001 = LR0001$new(stationNumber = 2, month = 12, year = 2002, version = 3)
lr0001$isValuesMissing()

lr0001$setDefault("month")
lr0001$month

lr0001$getMissingCode("month")
lr0001$getLabel("month")
lr0001$getLabel(".month")

lr0001 = LR0001$new(stationNumber = 2, year = 2002, version = 3)
lr0001
lr0001$getBsrnFormat()
lr0001$showBsrnFormat()

lr0001 = LR0001$new(stationNumber = 2, month = 12, year = 2002, version = 3)
lr0001
lr0001$getBsrnFormat()
lr0001$showBsrnFormat()

#' #' R6 Class representing a person
#' #'
#' #' A person has a name and a hair color.
#' #' @export
#' Person <- R6Class(
#'   "Person",
#'   public = list(
#'     #' @field name First or full name of the person.
#'     name = NULL,
#'
#'     #' @field hair Hair color of the person.
#'     hair = NULL,
#'
#'     #' @description
#'     #' Create a new person object.
#'     #' @param name Name.
#'     #' @param hair Hair color.
#'     #' @return A new `Person` object.
#'     initialize = function(name = NA, hair = NA) {
#'       self$name <- name
#'       self$hair <- hair
#'       self$greet()
#'     },
#'
#'     #' @description
#'     #' Change hair color.
#'     #' @param val New hair color.
#'     #' @examples
#'     #' P <- Person("Ann", "black")
#'     #' P$hair
#'     #' P$set_hair("red")
#'     #' P$hair
#'     set_hair = function(val) {
#'       self$hair <- val
#'     },
#'
#'     #' @description
#'     #' Say hi.
#'     greet = function() {
#'       cat(paste0("Hello, my name is ", self$name, ".\n"))
#'     }
#'   )
#' )
