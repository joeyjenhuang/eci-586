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

data_to_viz <- read_csv(here("unit-2", "data", "data-to-explore.csv"))

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




#' Once you are satisfied with your data visualization, 
#' create a new R Markdown file that you will use for 
#' your first "data product." 
#' 
#' Use the data-product-example.Rmd located in the 
#' files pane as a template for how your final 
#' markdown file should look. 
#' 
#' The first code chunk named "setup" runs the code
#' necessary for knitting your markdown file to an 
#' HTML webpage. Note that is includes the argument
#' include=FALSE which tells R not to include any code
#' or output in your final document. 
#' 
#' Repurpose one of the other code chunks to recreate 
#' the data visualization you made above. 
#' 
#' Note that you will need to add all the code necessary 
#' to make your visualization including loading required 
#' packages and importing your data. 
#' 
#' Also note that I included some additional arguments
#' to my code chunk to prevent messages and warnings 
#' from being displayed in my knitted document. 
#' 
#' In the YAML section at the top, be sure to change
#' the title and include your name as author. 
#' Also include the "cold_folding: hide" option 
#' as illustrated in the data-product-example.Rmd file. 
#' This will allow others to view your code if desired
#' to see you you created your data viz. 

