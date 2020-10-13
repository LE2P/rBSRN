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
           private$", varName, '$formatedValue <- self$getFormatValue("', varName, '")
         }
       }'
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
             private[[.var]]$formatedValue <- self$getFormatValue(var)
           } else {
             private[[.var]]$formatedValue <- private[[.var]]$missingCode
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

#' Generic function to get formated value
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
genericGetFormatedValue <- function(varName){
  private[[dot(varName)]]$formatedValue
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
  # if (is.null(value)) value <- private[[dot(varName)]]$missingCode
  switch(
    EXPR = private[[dot(varName)]]$format,
    "I2" = value %>% format(width = 2),
    "I3" = value %>% format(width = 3),
    "I4" = value %>% format(width = 4),
    "I5" = value %>% format(width = 5),
    "I9" = value %>% format(width = 9),
    "A1" = value %>% format(width = 1),
    "A5" = value %>% format(width = 5),
    "A8" = value %>% format(width = 8),
    "A15" = value %>% format(width = 15),
    "A18" = value %>% format(width = 18),
    "A20" = value %>% format(width = 20),
    "A25" = value %>% format(width = 25),
    "A30" = value %>% format(width = 30),
    "A38" = value %>% format(width = 38),
    "A40" = value %>% format(width = 40),
    "A50" = value %>% format(width = 50),
    "A80" = value %>% format(width = 80),
    "F7.3" = NULL,
    "F12.4" = NULL
  )
}


#' Stop is some mandatory variables are missing
#'
#' @param message A message if stop
#' @param self self of the R6 object
#'
#' @export
#'
stopIfValuesMissing <- function(message = NULL, self){
  if(self$isValuesMissing()) {
    tmp <- paste(self$missings(), collapse = ', ')
    message <- paste(message, if(!is.null(message)) '\n ', 'missing value(s) :', tmp)
    stop(message)
  }
}
