# WORKING WITH DATA ################

## 1. Tibbles ######################

#' Load the tidyverse package that contains functions to import data files

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



## 2. Isolating Data with dplyr ####

### select() function ####

#' Select student_id, subject, semester, and FinalGradeCEMS from sci_classes. 
#' Assign to a new object called student_grades.
#' Examine student_grades.  

student_grades <- select(sci_classes,
                         student_id,
                         subject,
                         semester,
                         FinalGradeCEMS)

student_grades


#' Select all columns except subject and section.
#' Assign to a new object.
#' Examine your data frame. 

new_object <- select(sci_classes,
                     -c(subject, section))

new_object


#' Select only the columns that start with Time.
#' Assign to a different object.
#' Examine your new data frame. 

time <- select(sci_classes, starts_with("Time"))

view(time)




###  filter() function ###############

#' 

male_students <- filter(sci_classes, Gender == "M")
head(male_students)





#'

bio_stars <- filter(sci_classes, percentage_earned >= .8 & subject == "BioA")
glimpse(bio_stars)



#'

complete_points <- filter(sci_classes, !is.na(Points_Earned))
tail(complete_points)


#'

my_classes <- filter(sci_classes, subject %in% c("BioA", "PhysA", "OcnA"))
my_classes

###  arrange() function ###############

#'
#'

ordered_classes <- arrange(sci_classes, subject, desc(percentage_earned))
view(ordered_classes)




### %>% operator ####

#'
#'

my_data <- sci_classes %>%
  select(subject, section, TimeSpent_hours, FinalGradeCEMS) %>%
  filter(subject == "OcnA" & FinalGradeCEMS > 60) %>%
  arrange(section, FinalGradeCEMS)

view(my_data)




## 3. Driving info with dplyr ########

### summarize() ######################

#'
#' 

sci_classes %>% summarise(courses = n_distinct(course_id))
  



### group_by() ######################

#' 
#' 


gender_stats <- sci_classes %>%
  filter(!is.na(FinalGradeCEMS)) %>%
  group_by(subject, Gender) %>%
  summarise(total = sum(student_id),
            grade = mean(FinalGradeCEMS), 
            time = mean(TimeSpent_hours)
            )


gender_stats




### mutate() ######################


sci_classes %>%
  mutate(score = percentage_earned * 100) %>%
  ggplot() +
  geom_point(mapping = aes(y = score, 
                           x = TimeSpent_hours,
                           color = Gender)) +
  facet_wrap(vars(subject))

