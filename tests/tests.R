rm(list = ls())
library(rBSRN)

ls(getNamespace("rBSRN"), all.names=FALSE) # Shows unhidden functions
ls(getNamespace("rBSRN"), all.names=TRUE) # Shows all functions.

# LR0001 ------------------------------------------------------------------
lr0001 = LR0001$new(stationNumber = 2, month = 12, year = 2019, version = 3)
lr0001$showBsrnFormat()
lr0001

# LR0002 ------------------------------------------------------------------
lr0002 = LR0002$new(
  scientistChange = FALSE,
  scientistName = "Mathieu Delsaut",
  scientistTel = "+262600000000",
  scientistFax = "+262600000000",
  scientistMail = "mathieu.delsaut@univ-reunion.fr",
  scientistAddress = "10 rue de Paris, 97400 Saint Denis",
  deputyChange = FALSE,
  deputyName = "Mathieu Delsaut",
  deputyAddress = "10 rue de Paris, 97400 Saint Denis",
  deputyTel = "+262600000000",
  deputyFax = "+262600000000",
  deputyTcpip = "8.8.8.8",
  deputyMail = "mathieu.delsaut@univ-reunion.fr"
)
lr0002$showBsrnFormat()
lr0002

# LR0003 ------------------------------------------------------------------
lr0003 = LR0003$new(message = "Hello world")
lr0003$showBsrnFormat()
lr0003
