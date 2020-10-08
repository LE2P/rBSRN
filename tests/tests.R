rm(list = ls())
library(rBSRN)

rBSRN::LR0001

ls(getNamespace("rBSRN"), all.names=FALSE) # Shows unhidden functions
ls(getNamespace("rBSRN"), all.names=TRUE) # Shows all functions.

lr0001 = LR0001$new(month = 12, year = 2019, version = 3)
lr0001$stationNumber = "2"

lr0001 = LR0001$new(month = 12, year = 2019, version = 3)
lr0001$stationNumber = 2
lr0001$stationNumber
lr0001$mandatories()
lr0001$missings()
lr0001$isValuesMissing()
lr0001$setDefault("month")
lr0001$month
lr0001$month = 1
lr0001$getMissingCode("month")
lr0001$getLabel("month")
lr0001$getBsrnFormat()
lr0001$showBsrnFormat()
lr0001
