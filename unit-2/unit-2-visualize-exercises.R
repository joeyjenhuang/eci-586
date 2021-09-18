# INTRO ################

data_to_viz <- read_csv(here("unit-2", "data", "data-to-explore.csv"))

view

library(tidyverse)


# VARIATION ####################

## Bar Charts ########

### Exercise 1 #################

#' In the space below, create a basic visualization
#' that examines a categorical variable of interest. 
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer. 
#' The first exercise has been done for you. 

ggplot(data_to_viz) +
  geom_bar(aes(x = subject))

# Which online course has the largest enrollment?


## Histograms & Similar Geoms #####

### Exercise 2 ####################

#' In the space below, create a basic visualization
#' that uses examines a continuous variable of interest.
#' This could be a histogram, frequency polygon, 
#' density curve or even a dot plot.   
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer. 

ggplot(data_to_viz) +
  geom_freqpoly(aes(x = time_spent_hours, color = subject))

# INSERT YOUR QUESTION HERE


# COVARIATION ####################

## Boxplots & Similar Geoms #####

#### Exercise 3 ##################

#' In the space below, create a basic visualization
#' that uses examines the relationship between
#' a categorical variable and a continuous variable.
#' This could be a boxplot or violin plot.   
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer.

ggplot(data_to_viz) +
  geom_boxplot(aes(x= time_spent_hours, y = subject))

# INSERT YOUR QUESTION HERE


## Counts #####

### Exercise 4 ##################

#' In the space below, create a basic visualization
#' that uses examines the relationship between
#' two categorical variables.
#' This could be a count plot or heatmap.   
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer.

data_to_explore %>% 
  count(subject, semester) %>% 
  ggplot() +
  geom_tile(mapping = aes(x = subject, y = semester, fill = n))

# INSERT QUESTION HERE


## Scatterplots #####

### Exercise 5 ##################

#' In the space below, create a basic visualization
#' that examines the relationship between
#' two continuous variables.
#' This could be a scatterplot with layers, 
#' a log-log or line plot, or one using coord functions.   
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer.

data_to_explore  %>% 
  select(subject, section, time_spent_hours, proportion_earned) %>%
  drop_na() %>%
  group_by(subject, section) %>% 
  summarise(mean_time = mean(time_spent_hours), 
            mean_grade = mean(proportion_earned)) %>% 
  ggplot(mapping = aes(x = mean_time, y = mean_grade)) +
  geom_point() +
  geom_label_repel(aes(label = subject)) +
  geom_smooth(method = lm)

# INSERT QUESTION HERE

## Line Plots & Simlar Geoms ####

### Exercise 6 ##################

#' In the space below, create a basic visualization
#' that examines the relationship between
#' two continuous variables.
#' This could be a scatterplot with layers, 
#' a log-log plot or one using coord functions.   
#' Add a commented line below your code that
#' poses a very simple research question your 
#' visualization might help to answer.

data_to_explore  %>% 
  select(subject, section, time_spent_hours, proportion_earned) %>%
  drop_na() %>%
  group_by(subject, section) %>% 
  summarise(mean_time = mean(time_spent_hours), 
            mean_grade = mean(proportion_earned)) %>% 
  ggplot(mapping = aes(x = mean_time, y = mean_grade)) +
  geom_point() +
  geom_label_repel(aes(label = subject)) +
  geom_smooth(method = lm)

# INSERT QUESTION HERE






