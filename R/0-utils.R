#' Put a dot on a variable name
#'
#' This function put a dot behind the variable name : "foo" => ".foo".
#'
#' @param varName char - Variable Name
#'
#' @return The variable name with a dot
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
#' This function remove a dot behind the variable name : ".foo" => "foo
#'
#' @param varName char - Variable Name
#'
#' @return The variable name without a dot
#'
#' @examples
#' undot(".foo")
undot <- function(varName){
  if(substr(varName, 1, 1) == ".")
    return(substr(varName, 2, nchar(varName)))
  else
    return(varName)
}


#' Internal function : generic active binding
#'
#' Create binding between private variable and R6 object.
#'
#' @param varName char - Variable Name
#'
#' @return Binding for the varName
#'
#' @examples
#' \dontrun{
#' username = genericActiveBinding(".username")
#' }
genericActiveBinding <- function(varName){
  eval(
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
    )
  )
}


#' Internal function : generic initialize
#'
#' @param ... list of function args needed for the initialize
#'
#' @return Initialize function
genericInitialize <- function(...){
  dots <- list(...)
  thisArgs <- paste(names(dots), "=", dots, collapse = ", ")
  eval(
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
    )
  )
}


#' Title
#'
#' @param var
#'
#' @return
genericIsMandatory <- function(var){
  private[[dot(var)]]$mandatory
}

#' Title
#'
#' @param var
#'
#' @return
genericIsMissing <- function(var){
  is.null(private[[dot(var)]]$value)
}

#' Title
#'
#' @return
genericMandatories <- function(){
    lapply(names(private), function(var) if (self$isMandatory(var)) undot(var)) %>% unlist()
}

#' Title
#'
#' @return
genericMissings <- function(){
  lapply(names(private), function(var) if(self$isMandatory(var) & self$isMissing(var)) undot(var)) %>% unlist()}

#' Title
#'
#' @return
genericIsValuesMissing = function(){!is.null(self$missings())}

#' Title
#'
#' @param var
#'
#' @return
genericGetDefault = function(var){private[[dot(var)]]$value <- private[[dot(var)]]$defaultValue}

#' Title
#'
#' @param var
#'
#' @return
genericGetMissingCode <- function(var){private[[dot(var)]]$missingCode}

#' Title
#'
#' @param var
#'
#' @return
genericGetLabel <- function(var){private[[dot(var)]]$label}

#' Title
#'
#' @param ...
#'
#' @return
genericShowBsrnFormat <- function(...){self$getBsrnFormat(...) %>% cat()}

#' Title
#'
#' @return
genericPrint <- function(){
  if(self$isValuesMissing()) cat("The object is missing value(s).\n") else self$showBsrnFormat()
}

#' Title
#'
#' @param var
#'
#' @return
applyFormat <- function(var){
  value <- private[[dot(var)]]$value
  switch (private[[dot(var)]]$format,
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

