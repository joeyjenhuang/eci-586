# THE BASICS #######################

## 1. Programming Basics ###########

### a. Functions ###################

#' Use the round() function to round 3.14 to the 
#' nearest whole number.

round(3.14)


### b. Arguments ###################

#### args() function ###############

#' Take a look at the arguments for the round() function. 

args(round)

#' Round pi to the nearest 2 decimal places
round(pi, digits = 2)



### c. Objects #####################

####  <- Operator ###############

#' Assign a number between 1 and 10 to a new object call my_number.
#' Multiply my_number by 2 and save as my_product. 
#' Examing the contents of my_product. 

my_number <- 4
my_product <- my_number*2
my_product

### d. Vectors ######################

#### c() function ###################

#' Create a vector that contains the numbers 50-100, 
#' Save as a new object called my_vector., and
#' Extract the number 99 from your vector.

my_vector <- c(50:100)

#### [] brackets ###################
my_vector[50]



### e. Data Types ###################

#### typeof() function ##############

#' Create a character vector that contains the names of your four favorite
#' characters from TV or literature and then check to see if your
#' vector is truly a character data type. 




### f. Lists #########################

#### list() function #################

#' Make a list called my_list that contains 
#' a logical, numeric, and character element. 
#' Give each element a name. 
#' Save as a new object called my_list.
#' Examine the contents of your list.   

my_list <- list(character = "Muffins",
                logical = FALSE,
                numeric = 4)
my_list


#### data.frame() function ############

#' Make a data frame that contains columns for
#' name, grade, and gpa five students.
#' Examine the contents of your data frame.



#### $ operator #######################

#' Extract the student names from your data frame. 





### g. Packages #######################

#### install.packages() function ######

#' Install the tidyverse package. 

install.packages('tidyverse')



#### library() function ###############

#' Use the library() function to load the tidyverse package into R.

library("tidyverse")


#### ? operator ###############

#' Use the ? to look up the help file on the tidyverse package. 
?tidyverse





## 2. Visualization Basics #########

### a. Functions ###################

#' Use the round() function to round 3.14 to the 
#' nearest whole number.

round(3.14)




