lr0001 <- LR0001$new(month = 12, year = 2019, version = 3) # New object.

lr0001$stationNumber = 2 # Affect value.
lr0001$stationNumber
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
