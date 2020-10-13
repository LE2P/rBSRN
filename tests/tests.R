rm(list = ls())
library(rBSRN)

ls(getNamespace("rBSRN"), all.names=FALSE) # Shows unhidden functions
ls(getNamespace("rBSRN"), all.names=TRUE) # Shows all functions.

rBSRN::LR0001

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

rBSRN::LR0002

lr0002 = LR0002$new(
  scientistChange = FALSE,
  scientistName = "Mathieu Delsaut",
  scientistTel = "+262600000000",
  scientistFax = "+262600000000",
  scientistMail = "mathieu.delsaut@univ-reunion.fr",
  scientistAddress = "10 rue de Paris, 97400 Saint Denis",
  deputyChange = FALSE,
  deputyName = "Mathieu Delsaut",
  deputyTel = "+262600000000",
  deputyFax = "+262600000000",
  deputyTcpip = "8.8.8.8",
  deputyMail = "mathieu.delsaut@univ-reunion.fr"
)
lr0002$deputyAddress <- "10 rue de Paris, 97400 Saint Denis"
lr0002$deputyAddress
lr0002$mandatories()
lr0002$missings()
lr0002$isValuesMissing()
lr0002$setDefault("deputyTel")
lr0002$deputyTel
lr0002$deputyTel = "+262200000000"
lr0002$getMissingCode("deputyTel")
lr0002$getLabel("deputyTel")
lr0002$getBsrnFormat()
lr0002$showBsrnFormat()
lr0002

rBSRN::LR0003
lr0003 = LR0003$new(message = "Hello world")
lr0003$message <- "This is a message"
lr0003$message
lr0003$mandatories()
lr0003$missings()
lr0003$isValuesMissing()
lr0003$setDefault("message")
lr0003$message
lr0003$message <- "This is a new message"
lr0003$getMissingCode("message")
lr0003$getLabel("message")
lr0003$getBsrnFormat()
lr0003$showBsrnFormat()
lr0003


lr0003$message$test
