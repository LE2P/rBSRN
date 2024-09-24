#' LR0100 get BSRN format function
#'
#' @param changed boolean did LR0100 changed this month ?
#'
#' @return A char with the BSRN format
#'
lr0100GetBsrnFormat <- function(changed){

  res <- ifelse(changed, "*C0100", "*U0100")

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  nd <- numberOfDays(yearMonth)
  daysOfMonth <-  rep(1:nd, each = 1440) %>% formatC(format = 'd', width = 2)
  minutesOfDay <- rep(0:1439, nd) %>%  formatC(format = 'd', width = 4)

  fullMatrix <- data.frame(
    daysOfMonth, minutesOfDay, global2_avg, global2_std, global2_min,
    global2_max, direct_avg, direct_std, direct_min, direct_max,diffuse_avg,
    diffuse_std, diffuse_min, diffuse_max, downward_avg, downward_std,
    downward_min, downward_max, temperature, humidity, pressure)

  strData <- paste(
    fullMatrix %>% str_glue_data(" {daysOfMonth} {minutesOfDay}   {global2_avg} {global2_std} {global2_min} {global2_max}   {direct_avg} {direct_std} {direct_min} {direct_max}"),
    fullMatrix %>% str_glue_data("           {diffuse_avg} {diffuse_std} {diffuse_min} {diffuse_max}   {downward_avg} {downward_std} {downward_min} {downward_max}    {temperature} {humidity} {pressure}"),
    sep = '\n')
  res <- paste(c(res, strData), collapse = '\n')

  return(res)
}

#' LR4000 get BSRN format function
#'
#' @param changed boolean did LR4000 changed this month ?
#'
#' @return A char with the BSRN format
#'
lr4000GetBsrnFormat <- function(changed){

  res <- ifelse(changed, "*C4000", "*U4000")

  for (varName in names(private$.params))
    assign(varName, self$getFormatValue(varName))

  nd <- numberOfDays(yearMonth)
  daysOfMonth <-  rep(1:nd, each = 1440) %>% formatC(format = 'd', width = 2)
  minutesOfDay <- rep(0:1439, nd) %>%  formatC(format = 'd', width = 4)

  fullMatrix <- data.frame(
    daysOfMonth, minutesOfDay, domeT1_down, domeT2_down, domeT3_down,
    bodyT_down, longwave_down, domeT1_up, domeT2_up, domeT3_up,
    bodyT_up, longwave_up)

  strData <- paste(
    fullMatrix %>% str_glue_data(" {daysOfMonth} {minutesOfDay} {domeT1_down} {domeT2_down} {domeT3_down} {bodyT_down} {longwave_down}  {domeT1_up} {domeT2_up} {domeT3_up} {bodyT_up} {longwave_up}"),
    sep = '\n')
  res <- paste(c(res, strData), collapse = '\n')

  return(res)
}
