lr0008_1 <- LR0008$new(
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

lr0008_2 <- LR0008$new(
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

lr0008_3 <- LR0008$new(
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

lr0008_4 <- LR0008$new(
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


cat(
  lr0008_1$getBsrnFormat(printLr = TRUE),
  lr0008_2$getBsrnFormat(),
  lr0008_3$getBsrnFormat(),
  lr0008_4$getBsrnFormat(),
  lr0008_1$getBsrnFormat(printLr = TRUE, LR0009Format = TRUE),
  lr0008_2$getBsrnFormat(LR0009Format = TRUE),
  lr0008_3$getBsrnFormat(LR0009Format = TRUE),
  lr0008_4$getBsrnFormat(LR0009Format = TRUE),
  sep = "\n"
)
