rm(list = ls())
library(magrittr)

dot <- function(varName) {
  if(substr(varName, 1, 1) == ".")
    return(varName)
  else
    return(paste0(".", varName))
}

undot <- function(varName){
  if(substr(varName, 1, 1) == ".")
    return(substr(varName, 2, nchar(varName)))
  else
    return(varName)
}



genericActiveBinding <- function(varName){
  parse(
    text = paste0(
      "function(ele){
         if (missing(ele)) return(private$", varName, ")
         else {
           private$", varName, " <- ele
         }
       }"
    )
  ) %>% eval()
}


genericInitialize <- function(...){
  dots <- list(...)
  thisArgs <- paste(names(dots), "=", dots, collapse = ", ")
  parse(
    text = paste0(
      "function(", thisArgs, "){
      print(ls())
         for (var in ls()){
           thisValue <- get(var)
           print(thisValue)
           .var <- dot(var)
           if(!is.null(thisValue)){
             private[[.var]] <- thisValue
           }
         }
       }"
    )
  ) %>% eval()
}


BSRNVAR <- R6::R6Class(
  classname = "BSRNVAR",
  private = list(
    .value = NULL,
    .name = NULL,
    .type = NULL,
    .label = NULL,
    .missingCode = NULL,
    .justifyRight = FALSE,
    .format = NULL,
    .mandatory = FALSE,
    .defaultValue = NULL
  ),
  active = list(
    value = genericActiveBinding(".value"),
    name = genericActiveBinding(".name"),
    type = genericActiveBinding(".type"),
    label = genericActiveBinding(".label"),
    missingCode = genericActiveBinding(".missingCode"),
    justifyRight = genericActiveBinding(".justifyRight"),
    format = genericActiveBinding(".format"),
    mandatory = genericActiveBinding(".mandatory"),
    defaultValue = genericActiveBinding(".defaultValue")
  ),
  public = list(
    initialize = genericInitialize(
      value = NULL,
      name = NULL,
      type = NULL,
      label = NULL, missingCode = NULL, justifyRight = FALSE, format = NULL, mandatory = FALSE, defaultValue = NULL)
  )
)

bsrnvar = BSRNVAR$new(value = NULL,  defaultValue = NULL, name = "test", type = "bool", label = "Test Label", missingCode = "xxx", justifyRight = FALSE, format = "I4", mandatory = FALSE)
bsrnvar$value <- 15
bsrnvar$value



LR0003 <- R6::R6Class(
  classname = "LR0003",
  private = list(
    .message =
      BSRNVAR$new(
      value = NULL,
      name = "message",
      type = "character",
      label = "Messages not to be inserted in the BSRN database",
      missingCode = "XXX",
      justifyRight = FALSE,
      format = "A80",
      mandatory = FALSE,
      defaultValue = NULL
    )
  ),
  active = list(
    message = function(message) {
      if (missing(message)) return(private$.message) else private$.message$value <- message ## TODO : bonne façon de le faire
    }
    ),
  public = list(
    initialize = NULL
  )
)

bsrnvar = BSRNVAR$new()
bsrnvar$value


lr0003 <- LR0003$new()
lr0003$message <- "test"
lr0003$message$value <- "test2" # probleme :=> du au mauvais binding
lr0003$message$value
lr0003$message$name
lr0003$message$label <- "test" ## On ne doit pouvoir que modifier la value
#####

