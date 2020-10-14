# rBSRN
An R package to facilitate BSRN header generation

## Instalation

Install first the devtools package if not installed. 

```R
install.packages("devtools")
```

Then install the rBSRN package : 

```R
devtools::install_github("LE2P/rBSRN")
```

## Usage

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

## TODO
 - fonction du genere le bsrn header
 - generate with changing month
 - renforcer le control validateFunction
 - Optimiser parse et eval
 - Private methods
 - Attention au sens de lecture, les classes doivent etre lues en dernier, le mettre dans la doc
 - gestion de la sauvegarde
 - Global variable avec bsrn var (csv) => .Rdata ?
 - Validate all validate functions
 - By default, nothing change. Note that somewhere
 - Valider le type en fonction de I, A ou F.. 
 - Prévoir aussi les types vecteurs, les types dans les listes BSRN
