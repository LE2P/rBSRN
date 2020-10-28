#' LR0100 get BSRN format function
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
