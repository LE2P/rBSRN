lr4000 <- LR4000$new()

lr4000$yearMonth <- "2012-01"
lr4000$bodyT_down <- rep(1, 44640)

lr4000
lr4000$showBsrnFormat(changed = TRUE)
