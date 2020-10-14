#' R6 Class representing BSRN Variable
#'
BSRNVAR <- R6::R6Class(
  classname = "BSRNVAR",
  private = list(
    .value = NULL,
    .formatedValue = NULL,
    .name = NULL,
    .type = NULL,
    .label = NULL,
    .missingCode = NULL,
    .justifyRight = FALSE,
    .format = NULL,
    .mandatory = FALSE,
    .applyFormat = function(){
      v <- private$.value
      private$.formatedValue <- switch(
        EXPR = private$.format,
        "I2" = format(v, width = 2),
        "I3" = format(v, width = 3),
        "I4" = format(v, width = 4),
        "I5" = format(v, width = 5),
        "I9" = format(v, width = 9),
        "A1" = format(v, width = 1),
        "A5" = format(v, width = 5),
        "A8" = format(v, width = 8),
        "A15" = format(v, width = 15),
        "A18" = format(v, width = 18),
        "A20" = format(v, width = 20),
        "A25" = format(v, width = 25),
        "A30" = format(v, width = 30),
        "A38" = format(v, width = 38),
        "A40" = format(v, width = 40),
        "A50" = format(v, width = 50),
        "A80" = format(v, width = 80),
        "F7.3" = NULL,
        "F12.4" = NULL
      )
    },
    .validateFunction = NULL
  ),
  active = list(
    value = function(v){
      if (missing(v)) return(private$.value)
      else {
        print("lelelele")
        private$.validateFunction(v)
        private$.value <- v
        private$.applyFormat()
      }
    },
    formatedValue = genericActiveBinding("formatedValue"),
    name = genericActiveBinding("name"),
    type = genericActiveBinding("type"),
    label = genericActiveBinding("label"),
    missingCode = genericActiveBinding("missingCode"),
    justifyRight = genericActiveBinding("justifyRight"),
    format = genericActiveBinding("format"),
    mandatory = genericActiveBinding("mandatory")
  ),
  public = list(
    initialize = function(name, label, format, type, missingCode, value = NULL, justifyRight = FALSE, mandatory = FALSE, validateFunction = function(v) stopifnot(TRUE)){
      for (v in c("name", "type", "label", "missingCode", "format", "justifyRight", "mandatory")){
        if (is.null(get(v))) stop(paste(v, "can't be null"))
        private[[dot(v)]] <- get(v)
      }
      if (is.function(validateFunction))
        private$.validateFunction = validateFunction
      if (!is.null(value)){
        private$.validateFunction(value)
        private$.value <- value
        private$.applyFormat()
      } else {
        private$.formatedValue <- missingCode
      }
    },
    isMissing = function() private$.mandatory & is.null(value)
  )
)
