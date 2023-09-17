# INTRO ################

#' For our Unit 2 exercises, we will be working with 
#' the data_to_explore data frame we created in Unit 1
#' consisting of our merged gradebook, log data, and survey data.
#' 
#' In the space below, load the tidyverse and here packages and
#' import the data-to-explore.csv file located in the data folder.
#' 
#' Save your data to a new object named data_to_viz.  

library(tidyverse)

data_to_viz <- read_csv("unit-2/data/data-to-explore.csv")

# VARIATION ####################

## Bar Charts ########

### Exercise 1 #################

#' In the space below, create a basic visualization
#' that examines a categorical variable of interest. 
#' 
#' Add an appropriate title to your chart.
#' 
#' Add a caption that poses a question educators may have 
#' about this data that your visualization could help answer.
#' 
#' The first exercise has been done for you. 

ggplot(data_to_viz) +
  geom_bar(aes(x = subject)) +
  labs(title = "Number of Student Enrollments per Subject",
       caption = "Which online courses have had the largest enrollment?")


## Histograms & Similar Geoms #####

### Exercise 2 ####################

#' In the space below, create a basic visualization
#' that examines a continuous variable of interest.
#' 
#' This could be a histogram, frequency polygon, 
#' density curve or even a dot plot.   
#' 
#' Add an appropriate title to your chart.
#' 
#' Add a caption that poses a question educators may have 
#' about this data that your visualization could help answer.



# COVARIATION ####################

## Boxplots & Similar Geoms #####

#### Exercise 3 ##################

#' In the space below, create a basic visualization
#' that examines the relationship between a categorical 
#' variable and a continuous variable.
#' 
#' This could be a boxplot or violin plot.   
#' 
#' Add an appropriate title to your chart.
#' 
#' Add a caption that poses a question educators may have 
#' about this data that your visualization could help answer.




## Counts #####

### Exercise 4 ##################

#' In the space below, create a basic visualization
#' that examines the relationship between two categorical variables.
#' 
#' This could be a count plot or heatmap.   
#' 
#' Add an appropriate title to your chart.
#' 
#' Add a caption that poses a question educators may have 
#' about this data that your visualization could help answer.




## Scatterplots & Line Plots #####

### Exercise 5 ##################

#' In the space below, create a basic visualization
#' that examines the relationship between two continuous variables.
#' 
#' This could be a scatterplot with layers, 
#' a log-log or line plot, or one using coord functions.   
#' 
#' Add an appropriate title to your chart.
#' 
#' Add a caption that poses a question educators may have 
#' about this data that your visualization could help answer.




## Big Data & Customizing Plots ####

### Exercise 6 ##################

#' In the space below, select one of your graphs
#' from above or create an entirely new viz. 
#' 
#' Add an appropriate title to your chart.
#' 
#' Add or adjust any aesthetics to improve the 
#' readability of visual appeal of your viz. 
#' 
#' Zoom or clip your x and/or y axis if needed to
#' better see key data points. 
#' 
#' Add or adjust any labels such as graph titles, 
#' subtitles, captions, axis titles, or annotations
#' that you think will help others interpret your chart. 
#' 
#' Add a theme you find attractive and adjust if needed. 
#' 
#' Use a color scale if appropriate to modify the 
#' default colors used by ggplot. 
#' 
#' Adjust or remove your legend as appropriate. 



