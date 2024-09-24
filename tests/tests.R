rm(list = ls())
library(rBSRN)

# LR0001 ------------------------------------------------------------------
lr0001 <- LR0001$new(stationNumber = 82, month = 7, year = 2020, version = 1)
lr0001
lr0001$showBsrnFormat()

# LR0002 ------------------------------------------------------------------
lr0002 <- LR0002$new(
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
lr0003 <- LR0003$new(message = "Some important message")
lr0003
lr0003$showBsrnFormat()

# LR0004 ------------------------------------------------------------------
lr0004 <- LR0004$new(
  surfaceType = 11,
  topographyType = 1,
  address = "Energy Lab, University of La Reunion, 15 ave Rene Cassin, 97490 Sainte-Clotilde",
  telephone = "+262 262 93 86 53",
  latitude = 69.099,
  longitude = 235.484,
  altitude = 116,
  azimuth = "0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345",
  elevation = "0,0,0,0,0,0,0,0,6,6,8,8,11,10,9,8,7,6,3,0,0,0,0,0"
)
lr0004
lr0004$showBsrnFormat()

# LR0005 ------------------------------------------------------------------
lr0005 = LR0005$new(
  manufacturer = "Kipp 'n Zonen",
  location = "La Réunion",
  distanceFromSite = 120,
  identification = "AAAAA"
)
lr0005
lr0005$showBsrnFormat()

# LR0006 ------------------------------------------------------------------
lr0006 = LR0006$new(
  manufacturer = "Kipp 'n Zonen",
  location = "La Réunion",
  distanceFromSite = 120,
  identification = "AAAAA"
)
lr0006
lr0006$showBsrnFormat()

# LR0007 ------------------------------------------------------------------
lr0007 = LR0007$new()
lr0007
lr0007$showBsrnFormat(synop = lr0004$synop)

# LR0008 ------------------------------------------------------------------
lr0008 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CMP 22",
  serialNumber = "140114",
  identification = 82001,
  radiationQuantityMeasured = 2,
  pyrgeometerDome = 2,
  location = "PMOD-WRC",
  person = "N. Mingard",
  startOfCalibPeriod1 = "05/16/16",
  endOfCalibPeriod1 = "06/30/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = 8.8000,
  stdErrorCalibCoeff1 = 0.0600,
  remarksOnCalib1 = "uV/W.m2"
)
lr0008
lr0008$showBsrnFormat(printLr = T)
lr0008$showBsrnFormat(printLr = T, LR0009Format = T)


# LR4000CONST -------------------------------------------------------------
# Method 1
lr4000const <- LR4000CONST$new(
  serialNumber_Manufacturer = "050783",
  serialNumber_WRMC = "61008",
  certificateCodeID = "2021-2380-01",
  C = 9.62,
  k1 = 0.02,
  k2 = 0.9974
)
lr4000const$showBsrnFormat()
lr4000const_1 <- lr4000const$getBsrnFormat()

# Method 2
lr4000const <- LR4000CONST$new(
  serialNumber_Manufacturer = "050783",
  serialNumber_WRMC = "61008",
  yyyymmdd = 20211026,
  manufact = "KZ",
  model = "CH1",
  C = 9.62,
  k1 = 0.02,
  k2 = 0.9974
)
lr4000const$showBsrnFormat(method = 2)
lr4000const_2 <- lr4000const$getBsrnFormat(method = 2)

lr0003 <- LR0003$new(message = "Some important message")
lr0003
lr0003$showBsrnFormat(lr4000const_1, lr4000const_2)

# LR0100 ------------------------------------------------------------------
lr0100 <- LR0100$new()
lr0100$yearMonth <- "2012-01"
# lr0100$global2_avg <- 1:100
lr0100$global2_avg <- rep(1, 44640)
lr0100
lr0100$showBsrnFormat(changed = F)

# LR4000 ------------------------------------------------------------------
lr4000 <- LR4000$new()
lr4000$yearMonth <- "2012-01"
# lr4000$global2_avg <- 1:100
lr4000$bodyT_down <- rep(1, 44640)
lr4000
lr4000$showBsrnFormat(changed = F)
