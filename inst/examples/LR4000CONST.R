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

# Adding @LR4000CONST to LR0003 message
lr0003 <- LR0003$new(message = "Some important message")
lr0003

lr0003$showBsrnFormat(
  lr4000const_1,
  lr4000const_2
)
