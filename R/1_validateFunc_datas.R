#' LR0100 validation function
#'
#' @param value value to validate
#'
LR0100_validateFunction <- function(value){
  private <- get("private", envir = parent.frame(n=1))
  if (is.null(private$.yearMonth))
    return(simpleError("Please define yearMonth first"))
  n <- numberOfMinutes(private$.yearMonth)
  if (length(value) != n)
    return(simpleError(paste("The size of vector must be", n)))
  return()
}
