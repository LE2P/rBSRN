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
 - Fonction qui genere le BSRN header en entier. Est qu'une R6 classe dans une liste reste classe ? 
 - Attention au sens de lecture, les classes doivent etre lues en dernier à la compilation. Le mettre dans la doc.
 - Exemple de gestion de la sauvegarde.
 - Est ce que justify est necessaire dans le bsrn format ?
 - Fonction pour generer list sensors à partir d'une liste de LR0008.
 - Mettre le bon format en fixed point pour les valeurs en F7.3 et F12.4
