# INTRO ################

#' For our Unit 2 tidy exercises, we will be working with 
#' the survey data, log data, and gradebook data from unit 1
#' 
#' In the space below, load the tidyverse packages and
#' import the survey, grade-book and log-data CSV files located in the data folder.
#' 
#' Save your each of your data sets to a new object with appropriate names.  

library(tidyverse)

survey_data <- read_csv("unit-2/data/survey.csv")

grade_data <- read_csv("unit-2/data/grade-book.csv")

log_data <- read_csv("unit-2/data/log-data.csv")

# RESHAPE DATA ####################

## pivot_longer ########

### Exercise 1 #################

#' The gather() function introduced in the primers has been 
#' superseded by the new  pivot_longer() function, which works just like 
#' gather() but is easier to use, more featureful, 
#' and still being actively updated. 
#' 
#' First, run the following code to open up the help menu
#' for the pivot_longer() function and take a look at the 

?pivot_longer

#' Let's use the new pivot_longer() function in order to 
#' transform our survey data from wide format to long format. 
#' 
#' Using the help menu as a guide, complete the following code 
#' to transform our survey data from wide format to long. 

survey_long <- survey_data |>
  pivot_longer(cols = q1:q10,
               names_to = "question",
               values_to = "response")

#' By using pivot_longer(), we make it so that each 
#' question & response pair has its own line in the data. 
#' 
#' Therefore, since we have ten-question variables (columns) 
#' in the pre_survey dataset, after we use pivot_longer() 
#' we will end up with ten times as many observations (rows) 
#' as before, but 8 fewer variables since our 10 columns 
#' are reduced to 2, one for the question name and one for 
#' the response. 
#' 
#' That means instead of having 662 observations of 26 variables, 
#' we will now have 6,620 observations of 18 variables. 
#' 
#' Additionally, we no longer need a separate column for 
#' each individual question since each question-response 
#' pair is now on its own line. 
#' 
#' What was previously one row of data now takes up 
#' ten rows of data. So pivot_longer() automatically deletes 
#' those empty columns after condensing all the data. 




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

ggplot(data_to_viz) +
  geom_freqpoly(aes(x = time_spent_hours, color = subject))


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

ggplot(data_to_viz) +
  geom_boxplot(aes(x= time_spent_hours, y = subject))



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

data_to_explore %>% 
  count(subject, semester) %>% 
  ggplot() +
  geom_tile(mapping = aes(x = subject, y = semester, fill = n))



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
#' to my code chunk to prevent messages add warnings 
#' from being displayed in my knitted document. 
#' 
#' In the YAML section at the top, be sure to change
#' the title and include your name as author. 
#' Also include the "cold_folding: hide" option 
#' as illustrated in the data-product-example.Rmd file. 
#' This will allow others to view your code if desired
#' to see you you created your data viz. 

