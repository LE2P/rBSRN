# rBSRN

An R package to facilitate the generation of BSRN station-to-archive files. The package is currently still in development, as it only allows generation up to logical record 100 (LR0100). Contact the author if you want to contribute or add more functionality.

## Instalation

Install first the devtools package if not installed.

```R
install.packages("devtools")
```

Then install the rBSRN package :

```R
devtools::install_github("LE2P/rBSRN")
```

## Help

Consult the package help on R :

```R
??rBSRN
```

## Usage

### Logical Record R6 Class

```R
rBSRN::LR0001 # LR0001 Class.
lr0001 = LR0001$new(month = 12, year = 2019, version = 3) # New object.
lr0001$stationNumber = "2" # ERROR : Station number must be a character.
lr0001$stationNumber = 2 # Affect value.
lr0001$stationNumber
lr0001$params$month$label <- "test" # ERROR : can't update the parameter,
lr0001$params$stationNumber$mandatory # but consult is OK.
lr0001$mandatories() # List of mandatories variables.
lr0001$missings() # List of empty mandatory variables.
lr0001$isValuesMissing() #  There is some missing ?
lr0001$setDefault("month") # Set the default value.
lr0001$month # Missing = NULL
lr0001$month = 1
lr0001$getBsrnFormat() # Get BSRN Format.
lr0001$showBsrnFormat() # Show BSRN Format.
lr0001 # Print the object - a.k.a. print infos.
```

### Create station-to-archive file with rBSRN

```R
# Load library ------------------------------------------------------------
library(rBSRN)


# LR0001 ------------------------------------------------------------------
lr0001 <- LR0001$new(
  stationNumber = 82,
  month = 7,
  year = 2020,
  version = 1
)

# LR0002 ------------------------------------------------------------------
lr0002 <- LR0002$new(
  scientistName = "John Doe",
  scientistTel = "+1 800 123 4567",
  scientistFax = "+1 800 123 4567",
  scientistMail = "john.doe@example.com",
  scientistAddress = "123 Main Street, Anytown, USA 12345",
  deputyName = "Jane Doe",
  deputyTel = "+1 800 123 4567",
  deputyFax = "+1 800 123 4567",
  deputyMail = "jane.doe@example.com",
  deputyAddress = "123 Main Street, Anytown, USA 12345",
)

# LR0003 ------------------------------------------------------------------
lr0003 <- LR0003$new(message = "some messages")


# LR0004 ------------------------------------------------------------------
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

# LR0007 ------------------------------------------------------------------
lr0007 = LR0007$new()

# LR0008 ------------------------------------------------------------------
lr0008_1 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CMP 22",
  serialNumber = "140114",
  identification = 82001,
  radiationQuantityMeasured = 2,
  pyrgeometerDome = 2,
  location = "PMOD-WRC",
  person = "N. Mingard",
  startOfCalibPeriod1 = "05/16/17",
  endOfCalibPeriod1 = "06/30/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = 8.8000,
  stdErrorCalibCoeff1 = 0.0600,
  remarksOnCalib1 = "uV/W.m2"
)

lr0008_2 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CMP 22",
  serialNumber = "120360",
  identification = 82002, 
  remarks = "DHI",
  radiationQuantityMeasured = 4,
  pyrgeometerDome = 4,
  location = "PMOD-WRC",
  person = "N. Mingard",
  startOfCalibPeriod1 = "06/09/17",
  endOfCalibPeriod1 = "06/30/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = 9.5500,
  stdErrorCalibCoeff1 = 0.0600,
  remarksOnCalib1 = "uV/W.m2"
)

lr0008_3 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CH 1",
  serialNumber = "040374",
  identification = 82003,
  radiationQuantityMeasured = 3,
  location = "PMOD-WRC",
  person = "N. Mingard",
  startOfCalibPeriod1 = "05/16/17",
  endOfCalibPeriod1 = "05/30/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = 9.0200,
  stdErrorCalibCoeff1 = 0.0300,
  remarksOnCalib1 = "uV/W.m2"
)

lr0008_4 = LR0008$new(
  manufacturer = "Kipp & Zonen",
  model = "CGR4",
  serialNumber = "150123",
  identification = 82004,
  remarks = "FIR",
  radiationQuantityMeasured = 5,
  pyrgeometerDome = 4,
  location = "PMOD-WRC",
  person = "C. Thomann",
  startOfCalibPeriod1 = "05/11/17",
  endOfCalibPeriod1 = "06/20/17",
  numOfComp1 = 1,
  meanCalibCoeff1 = 10.2200,
  stdErrorCalibCoeff1 = 0.3200,
  remarksOnCalib1 = "uV/W.m2"
)

# LR0100 ------------------------------------------------------------------
lr0100 <- LR0100$new()

lr0100$yearMonth <- "2020-07"
lr0100$global2_avg <- rep(1, 44640) # set here your data
lr0100$diffuse_avg <- rep(1, 44640) 
# ...

# Generate file ------------------------------------------------------------------
filename <- "run0720.dat"

con <- file(filename, open = "w")
cat(
  lr0001$getBsrnFormat(),
  lr0002$getBsrnFormat(),
  lr0003$getBsrnFormat(),
  lr0004$getBsrnFormat(),
  lr0007$getBsrnFormat(synop = lr0004$synop),
  lr0008_1$getBsrnFormat(printLr = T),
  lr0008_2$getBsrnFormat(),
  lr0008_3$getBsrnFormat(),
  lr0008_4$getBsrnFormat(),
  lr0008_1$getBsrnFormat(printLr = T, LR0009Format = T),
  lr0008_2$getBsrnFormat(LR0009Format = T),
  lr0008_3$getBsrnFormat(LR0009Format = T),
  lr0008_4$getBsrnFormat(LR0009Format = T),
  lr0100$getBsrnFormat(changed = T),
  file = con,
  sep = "\n"
)
close(con)

```
