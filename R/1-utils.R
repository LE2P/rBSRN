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
#'
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
#'
undot <- function(varName){
  if(substr(varName, 1, 1) == ".")
    return(substr(varName, 2, nchar(varName)))
  else
    return(varName)
}


#' Return parameters for a specific logical record
#'
#' @param lr char logical record ("LR0001", "LR0002", ...)
#'
#' @return params list
#'
#' @examples
#' getParams("LR0001")
getParams <- function(lr){
  data("A1_formats"); p <- A1_formats
  p <- p[p$lr == lr, ]
  params <- apply(p[, -1], 1, as.list)
  names(params) <- p$name
  for(n in names(params))
    params[[n]]$validateFunction <- get(params[[n]]$validateFunction)
  return(params)
}


#' Return privates variables for a specific logical record
#'
#' @param lr char logical record ("LR0001", "LR0002", ...)
#'
#' @return list of private variables
#'
getPrivateVars <- function(lr){
  privatesVars <- NULL
  ps <- getParams(lr)
  for (p in ps){
    privatesVars <- paste0(privatesVars, ".", p$name, ' = ', p$defaultValue, ',\n')
  }
  privatesVars <- paste0(privatesVars, '.params = getParams("', lr, '")')
  vars <- eval(parse(text=paste0('list(',privatesVars,')')))
  return(vars)
}


#' Generic read and write active binding
#'
#' Internal function.
#' Create read and write binding between private variable and R6 object.
#'
#' @param varName char - Variable Name
#'
#' @return Binding for the varName.
#'
#' @examples
#' \dontrun{
#' username = rw_ActiveBinding("username")
#' }
#'
rw_ActiveBinding <- function(varName){
  parse(
    text = paste0(
      "function(value){
         if (missing(value)) return(private$", dot(varName), ")
         else {
           err <- private$.params$", varName, "$validateFunction(value)
           if(!is.null(err)) stop(paste(", varName, ", err$message), call. = F)
           private$", dot(varName), " <- value
         }
       }"
    )
  ) %>% eval()
}


#' Generic read only active binding
#'
#' Internal function.
#' Create read and write binding between private variable and R6 object.
#'
#' @param varName char - Variable Name
#'
#' @return Binding for the varName.
#'
#' @examples
#' \dontrun{
#' username = r__ActiveBinding("username")
#' }
#'
r__ActiveBinding <- function(varName){
  message <- paste("Can't change the", varName)
  parse(
    text = paste0(
      "function(value){
         if (missing(value)) return(private$", dot(varName), ')
         else {
            stop("', message, '", call. = F)
         }
       }'
    )
  ) %>% eval()
}


#' Return actives bindings for a specific logical record
#'
#' @param lr char logical record ("LR0001", "LR0002", ...)
#'
#' @return list of actives bindings
#'
getActiveBindings <- function(lr){
  vars <- names(getParams(lr))
  activesBindings <- list()
  for(v in vars) activesBindings[[v]] <- rw_ActiveBinding(v)
  activesBindings$params <- r__ActiveBinding("params")
  return(activesBindings)
}


#' Generic function to create initialize
#'
#' Internal function.
#' Create an initialize R6 function (see R6 documentation).
#'
#' @param vars char args needed for the initialize (R notation)
#'
#' @return Initialize function.
#'
genericInitialize <- function(vars){
  parse(
    text = paste0(
      "function(", vars, "){
         for (var in ls()){
           value <- get(var)
           if(!is.null(value)){
             err <- private$.params[[var]]$validateFunction(value)
             if(!is.null(err)) stop(paste(var, err$message), call. = F)
             private[[dot(var)]] <- value
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
  private$.params[[varName]]$mandatory
}


#' Generic function to control missing value
#'
#' Internal function.
#' Allow to create an R6 public method to know if private$varName$value is null (missing).
#'
#' @param varName char - Variable Name
#'
genericIsMissing <- function(varName){
  is.null(private[[dot(varName)]])
}


#' Generic function to list all mandatory variable
#'
#' Internal function.
#' This function give a list of all mandatory variable names.
#'
genericMandatories <- function(){
    lapply(private$.params, function(ele) if(ele$mandatory) ele$name) %>% unlist()
}


#' Generic function to list all missing vairable
#'
#' Internal function.
#' This function give a list of all missing variable names, i.e. the variable
#' is empty and mandatory.
#'
genericMissings <- function(){
  lapply(
    self$mandatories(),
    function(varName) if(self$isMissing(varName)) varName
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
  private[[dot(varName)]] <- private$.param[[varName]]$defaultValue
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
  message <- ""
  if(self$isValuesMissing())
    message <- paste0(message, "WARNING : The object is missing value(s).\n")
  vars <- names(private$.params)
  mVars <- self$mandatories()
  for(v in vars)
    message <- paste0(
      message, if(v %in% mVars) "[mandatory] " else "[optional] ",
      v, ' (', private$.params[[v]]$label, ") : ", private[[dot(v)]], "\n")
  cat(message)
}


#' Return public methods for a specific logical record
#'
#' @param lr char logical record ("LR0001", "LR0002", ...)
#'
#' @return list of private variables
#'
getPublicMethods <- function(lr){
  ps <- getParams(lr)
  vars <- lapply(ps, function(ele) paste(ele$name, "=", ele$defaultValue)) %>%
    paste(collapse = ", ")
  publicMethods <- list(
    initialize = genericInitialize(vars),
    isMandatory = genericIsMandatory,
    isMissing = genericIsMissing,
    isValuesMissing = genericIsValuesMissing,
    mandatories = genericMandatories,
    missings = genericMissings,
    setDefault = genericSetDefault,
    getFormatValue = getFormatValue,
    getBsrnFormat = get(paste0(tolower(lr), "GetBsrnFormat")),
    showBsrnFormat = genericShowBsrnFormat,
    print = genericPrint
  )
  return(publicMethods)
}


#' Generic function to validate data
#'
#' Internal function.
#'
genericValidateFunction <- function(value){
  stopifnot(TRUE)
}


#' Generic function to apply the right format on the value
#'
#' Internal function.
#'
#' @param varName char - Variable Name
#'
getFormatValue <- function(varName){
  value <- private[[dot(varName)]]
  if (is.null(value)) value <- private$.params[[varName]]$missingCode
  switch(
    EXPR = private$.params[[varName]]$format,
    "L"   = if (value) "Y" else "N", # TODO : TRUE FORMAT "A1"
    "I2"  = value %>% format(width = 2),
    "I3"  = value %>% format(width = 3),
    "I4"  = value %>% format(width = 4),
    "I5"  = value %>% format(width = 5),
    "I9"  = value %>% format(width = 9),
    "A"   = value %>% str_wrap(width = 80),
    "A1"  = value %>% format(width = 1),
    "A5"  = value %>% format(width = 5),
    "A8"  = value %>% format(width = 8),
    "A15" = value %>% format(width = 15),
    "A18" = value %>% format(width = 18),
    "A20" = value %>% format(width = 20),
    "A25" = value %>% format(width = 25),
    "A30" = value %>% format(width = 30),
    "A38" = value %>% format(width = 38),
    "A40" = value %>% format(width = 40),
    "A50" = value %>% format(width = 50),
    "A80" = value %>% format(width = 80),
    "F7.3" = value %>% format(width = 7), # TODO : mettre le bon format en fixed point
    "F12.4" = value %>% format(width = 12),
    value
  )
}


#' Get the BSRN format for LR0004 azimuth and elevation
#'
#' Internal function.
#'
#' @param azimuth (string) azimuth at format "A1,A2,...,An"
#' @param elevation (string) elevation at format "E1,E2,...,En"
#'
#' @return (string) Azimuth and elevation at LR0004 format
#'
getAzimuthElevation <- function(azimuth = NULL, elevation = NULL){
  if (is.null(azimuth) | is.null(elevation)){
    AzimuthElevation <- "  -1 -1"
  } else {
    azimuth <- strsplit(azimuth, ",")[[1]] %>% as.numeric()
    elevation <- strsplit(elevation, ",")[[1]] %>% as.numeric()
    n <- length(azimuth)
    if (n != length(elevation)) stop("azimuth and elevation must have same size")
    azimuth <- c(azimuth, rep(-1, 11 - n %% 11)) %>% format(width = 3)
    elevation <- c(elevation, rep(-1, 11 - n %% 11)) %>% format(width = 2)
    aziEle <- rbind(azimuth, elevation) %>% c() %>%  matrix(nrow = 22) %>% t()
    AzimuthElevation <- paste0(" ", apply(aziEle, 1, paste, collapse = " ") %>% paste(collapse = "\n "))
  }
  return(AzimuthElevation)
}


#' Stop is some mandatory variables are missing
#'
#' @param message A message if stop
#' @param self self of the R6 object
#'
stopIfValuesMissing <- function(message = NULL, self){
  if(self$isValuesMissing()) {
    tmp <- paste(self$missings(), collapse = ', ')
    message <- paste(message, if(!is.null(message)) '\n ', 'missing value(s) :', tmp)
    stop(message, call. = F)
  }
}

