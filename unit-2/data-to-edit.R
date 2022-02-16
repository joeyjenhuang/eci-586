library(DataEditR)

data_to_explore <- read.csv("unit-2/data/data-to-explore.csv")

data_to_edit <- data_edit(data_to_explore,
                          save_as = "data-to-edit.csv",
                          code = "explore-script.R")

library(esquisse)

esquisser()
