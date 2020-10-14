rm(list = ls())
library(rBSRN)

ls(getNamespace("rBSRN"), all.names=FALSE) # Shows unhidden functions
ls(getNamespace("rBSRN"), all.names=TRUE) # Shows all functions.

# LR0001 ------------------------------------------------------------------
lr0001 = LR0001$new(stationNumber = 82, month = 7, year = 2020, version = 1)
lr0001
lr0001$showBsrnFormat()

# LR0002 ------------------------------------------------------------------
lr0002 = LR0002$new(
  scientistName = "Beatrice Morel",
  scientistTel = "+262 262 93 82 22",
  scientistFax = "+262 262 93 86 73",
  scientistMail = "beatrice.morel@univ-reunion.fr",
  scientistAddress = "Energy Lab, University of La Reunion, 15 ave Rene Cassin, 97490 Sainte-Clotilde",
  deputyName = "Patrick Jeanty",
  deputyTel = "+262 262 93 86 53",
  deputyFax = "+262 262 93 86 73",
  deputyMail = "patrick.jeanty@univ-reunion.fr",
  deputyAddress = "Energy Lab, University of La Reunion, 15 ave Rene Cassin, 97490 Sainte-Clotilde",
)
lr0002
lr0002$showBsrnFormat()

# LR0003 ------------------------------------------------------------------
lr0003 = LR0003$new(message = "")
lr0003
lr0003$showBsrnFormat()

# LR0004 ------------------------------------------------------------------
lr0004 = LR0004$new(
  surfaceType = 11,
  topographyType = 1,
  address = "Energy Lab, University of La Reunion, 15 ave Rene Cassin, 97490 Sainte-Clotilde",
  telephone = "+262 262 93 86 53",
  latitude = 69.099,
  longitude = 235.484,
  altitude = 116,
  azimuthElevation = "0-0,15-0,30-0,45-0,60-0,75-0,90-0,105-0,120-6,135-6,150-8,165-8,180-11,195-10,210-9,225-8,240-7,255-6,270-3,285-0,300-0,315-0,330-0,345-0"
)
lr0004
lr0004$showBsrnFormat()

# LR0005 ------------------------------------------------------------------
# A FAIRE
lr0005 = LR0005$new()
lr0005$showBsrnFormat()
lr0005

# LR0006 ------------------------------------------------------------------
# A FAIRE
lr0006 = LR0006$new()
lr0006$showBsrnFormat()
lr0006

# LR0007 ------------------------------------------------------------------
lr0007 = LR0007$new()
lr0007$showBsrnFormat(synop = lr0004$synop)
lr0007

# LR0008 ------------------------------------------------------------------
lr0008 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CMP 22",
  serialNumber = "140114",
  identification = "82001",
  radiationQuantityMeasured = 2, # TODO : mettre dans LR0009
  pyrgeometerDome = 2,
  location = "PMOD-WRC",
  person = "N. Mingard",
  startOfCalibPeriod1 = "05/16/16",
  endOfCalibPeriod1 = "06/30/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = "8.8000",
  stdErrorCalibCoeff1 = "0.0600",
  remarksOnCalib1 = "uV/W.m2"
)
lr0008
lr0008$showBsrnFormat(anyChange = T, printLr = T)
