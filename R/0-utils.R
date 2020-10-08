#' Put a dot on a variable name
#'
#' Internal function.
#' This function put a dot behind the variable name : "foo" => ".foo".
#'
#' @param varName char - Variable Name
#'
#' @return The variable name with a dot.
#'
#' @examples
#' dot('foo')
dot <- function(varName) {
  if(substr(varName, 1, 1) == ".")
    return(varName)
  else
    return(paste0(".", varName))
}


#' Remove dot on a variable name
#'
#' Internal function.
#' This function remove a dot behind the variable name : ".foo" => "foo
#'
#' @param varName char - Variable Name
#'
#' @return The variable name without a dot.
#'
#' @examples
#' undot(".foo")
undot <- function(varName){
  if(substr(varName, 1, 1) == ".")
    return(substr(varName, 2, nchar(varName)))
  else
    return(varName)
}


#' Generic active binding
#'
#' Internal function.
#' Create binding between private variable and R6 object.
#'
#' @param varName char - Variable Name
#'
#' @return Binding for the varName.
#'
#' @examples
#' \dontrun{
#' username = genericActiveBinding(".username")
#' }
genericActiveBinding <- function(varName){
  parse(
    text = paste0(
      "function(value){
         if (missing(value)) return(private$", varName, "$value)
         else {
           private$", varName, "$validateFunction(value)
           private$", varName, "$value <- value
         }
       }"
    )
  ) %>% eval()
}


#' Generic function to create initialize
#'
#' Internal function.
#' Create an initialize R6 function (see R6 documentation).
#'
#' @param ... list of function args needed for the initialize
#'
#' @return Initialize function.
#'
genericInitialize <- function(...){
  dots <- list(...)
  thisArgs <- paste(names(dots), "=", dots, collapse = ", ")
  parse(
    text = paste0(
      "function(", thisArgs, "){
         for (var in ls()){
           value <- get(var)
           .var <- dot(var)
           if(!is.null(value)){
             private[[.var]]$validateFunction(value)
             private[[.var]]$value <- value
           }
         }
       }"
    )
  ) %>% eval()
}


#' Generic function to control mandatory
#'
#' Internal function.
#' Allow to create an R6 public method to know if private$varName$mandatory.
#'
#' @param varName char - Variable Name
#'
genericIsMandatory <- function(varName){
  private[[dot(varName)]]$mandatory
}


#' Generic function to control missing value
#'
#' Internal function.
#' Allow to create an R6 public method to know if private$varName$value is null (missing).
#'
#' @param varName char - Variable Name
#'
genericIsMissing <- function(varName){
  is.null(private[[dot(varName)]]$value)
}


#' Generic function to list all mandatory variable
#'
#' Internal function.
#' This function give a list of all mandatory variable names.
#'
genericMandatories <- function(){
    lapply(names(private), function(varName) if (self$isMandatory(varName)) undot(varName)) %>% unlist()
}


#' Generic function to list all missing vairable
#'
#' Internal function.
#' This function give a list of all missing variable names, i.e. the variable
#' is empty and mandatory.
#'
genericMissings <- function(){
  lapply(
    names(private),
    function(varName){
      if(self$isMandatory(varName) & self$isMissing(varName))
        undot(varName)
    }
  ) %>% unlist()
}


#' Generic function return true is the is missing mandatory variables
#'
#' Internal function.
#'
#' @return TRUE is there is mandatory value missing / FALSE if not.
#'
genericIsValuesMissing = function(){
  !is.null(self$missings())
}


#' Generic function to set value to it default value
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
genericSetDefault = function(varName){
  private[[dot(varName)]]$value <- private[[dot(varName)]]$defaultValue
}

#' Generic function to get missing code
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
genericGetMissingCode <- function(varName){
  private[[dot(varName)]]$missingCode
}

#' Generic function to get label
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
genericGetLabel <- function(varName){
  private[[dot(varName)]]$label
}


#' Generic function to show BSRN format (cat)
#'
#' Internal function.
#'
#' @param ...
#'
genericShowBsrnFormat <- function(...){
  self$getBsrnFormat(...) %>% cat()
}


#' Generic function define Print method
#'
#' Internal function.
#'
genericPrint <- function(){
  if(self$isValuesMissing())
    cat("The object is missing value(s).\n")
  else
    self$showBsrnFormat()
}


#' Generic function to apply the right format on the value
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
applyFormat <- function(varName){
  value <- private[[dot(varName)]]$value
  switch(
    EXPR = private[[dot(varName)]]$format,
    "I2" = value %>% format(width = 2),
    "I3" = NULL,
    "I4" = value %>% format(width = 4),
    "I5" = NULL,
    "I9" = NULL,
    "A1" = NULL,
    "A5" = NULL,
    "A8" = NULL,
    "A15" = NULL,
    "A18" = NULL,
    "A20" = NULL,
    "A25" = NULL,
    "A30" = NULL,
    "A38" = NULL,
    "A40" = NULL,
    "A50" = NULL,
    "A80" = NULL,
    "F7.3" = NULL,
    "F12.4" = NULL
  )
}
