## Optimiser parse et eval
dot <- function(var) if(substr(var, 1, 1) == ".") return(var) else return(paste0(".", var))
undot <- function(var) if(substr(var, 1, 1) == ".") return(substr(var, 2, nchar(var))) else return(var)

genericActiveBinding <- function(argument){
  eval(
    parse(
      text = paste0(
        "function(value){
           if (missing(value)) return(private$", argument, "$value)
           else {
             private$", argument, "$validateFunction(value)
             private$", argument, "$value <- value
           }
         }"
      )
    )
  )
}

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

genericIsMandatory <- function(var) private[[dot(var)]]$mandatory
genericIsMissing <- function(var) is.null(private[[dot(var)]]$value)
genericMandatories <- function(){lapply(names(private), function(var) if(self$isMandatory(var)) undot(var)) %>% unlist()}
genericMissings <- function(){lapply(names(private), function(var) if(self$isMandatory(var) & self$isMissing(var)) undot(var)) %>% unlist()}
genericIsValuesMissing = function(){!is.null(self$missings())}
genericGetDefault = function(var){private[[dot(var)]]$value <- private[[dot(var)]]$defaultValue}
genericGetMissingCode <- function(var){private[[dot(var)]]$missingCode}
genericGetLabel <- function(var){private[[dot(var)]]$label}
genericShowBsrnFormat <- function(...){self$getBsrnFormat(...) %>% cat()}
genericPrint <- function() if(self$isValuesMissing()) cat("The object is missing value(s).\n") else self$showBsrnFormat()

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

