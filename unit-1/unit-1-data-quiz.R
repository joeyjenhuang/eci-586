# Working with Data ################

## 1. Tibbles ######################

#' Load the tidyverse package that contains functions to import data files.

library(tidyverse)

#' Run the following code to import the online science classes data
#' we will use this data again for data wrangling. 

sci_classes <- read_csv("unit-0/data/sci-online-classes.csv")

#' Examine the contents of sci_classes in your console.
#' Is your object a tibble?  

sci_classes

### View() function ################

#' Use the View() function to take a look at your data. 
View(sci_classes)

is_tibble(sci_classes)  


## 2. Isolating Data with dplyr ####

### select() function ####







