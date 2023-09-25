# INTRO ################

#' For our Unit 2 tidy exercises, we will be working with 
#' the survey data, log data, and gradebook data from unit 1. 
#' 
#' In the space below, complete the folloiwn code to 
#' load the tidyverse packages and import the survey, 
#' grade-book and log-data CSV files located in the data folder.
#' 
#' Save your each of your data sets to a new object with appropriate names.  

library()

survey_data <- 

grade_data <- 

log_data <- 

# RESHAPE DATA ####################

## pivot_longer ########

### Exercise 1 #################

#' The gather() function introduced in the primers has been 
#' superseded by the new  pivot_longer() function, which works just like 
#' gather() but is easier to use, more featureful, and still being 
#' actively updated. 
#' 
#' First, run the following code to open up the help menu
#' for the pivot_longer() function and take a look at the arguments 
#' and examples for this function: 

?pivot_longer

#' Let's use the new pivot_longer() function in order to 
#' transform our survey data from wide format to long format. 
#' 
#' Using the help menu as a guide, complete the following code 
#' to select our student id and survey question 1:10 and then 
#' transform our survey data from wide format to long. 

survey_long <- survey_data |>
  select(student_id, course_id, q1:q10) |>
  pivot_longer(cols = ,
               names_to = ,
               values_to = )

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
#' So why do this? Here are some situations in which pivoting data to a long format can be useful:
#' 
# 1.	Visualization: Certain types of graphs or plots, especially those in software tools like ggplot2 in R or seaborn in Python, expect data in a long format. For instance, to create line plots, box plots, or bar plots that compare multiple categories, a long-format dataset can often be easier to work with.
# 2.	Statistical Analysis and Modeling: Some statistical functions and models require data in long format. For example, mixed-effects models or repeated measures ANOVA often expect data in a long format.
# 3.	Consistent Structure: If you're working with time-series data where measurements are taken at irregular intervals, a long format can ensure a consistent structure, where each time point is a new row rather than a new column.
# 4.	Data Concatenation: If you're combining multiple datasets that capture similar types of observations but over different variables (like measurements across different years), converting to long format can make the concatenation process smoother.
# 5.	Data Exploration: It can be easier to filter, summarize, and explore data when it's in a long format, especially when trying to understand distributional properties across different categories.
# 6.	Reducing Redundancy: In wide format, metadata (like units of measurement or other descriptor variables) might be repeated across many column names. By pivoting to long format, this information can be stored just once, in a single column.
# 7.	Storage: In some scenarios, long format can be more space-efficient, especially when the wide data has many missing values. Rather than having a column for every potential attribute (many of which might be empty or NaN for a given observation), the long format only stores entries for attributes that have been observed.
# 8.	Flexibility: A dataset in long format can be more flexible for a variety of analyses. With the data in a standardized structure, it's often easier to pivot back to a wide format or any other desired structure.
#'

## pivot_wider ########

### Exercise 2 #################

# However, it's worth noting that pivoting to a long format isn't always the best choice. The decision should be based on the specific needs of the analysis or operation at hand. There are certainly situations where wide format is preferable, especially when the relationship between columns is critical or when performing operations that require column-wise calculations.
#'
#' If we want to convert our data from a long format back to a wide format, 
#' the pivot_wider() "widens" data, increasing the number of columns and decreasing the number of rows. This is the inverse transformation of pivot_longer().
#' 
#' Run the following code to open up the help menu
#' for the pivot_wider() function and take a look at the arguments and 
#' examples for this function: 

?pivot_wider

#' Now use the pivot_wider function to transform our survey_long
#' data back to a wide format and save as survey_wide: 
#' 
#' Hint: You'll need to include arguments that specify where the 
#' new column names will come from and where the values 
#' for each column are from. 

survey_wide <- pivot_wider()


# Separate & Unite ####################

## Separate Columns #####

#### Exercise 3 ##################

#' Although the separate() function introduced in the primers, still works
#' perfectly well, separate() has been superseded in favour of
#' separate_wider_position() and separate_wider_delim() because the two
#' functions make the two uses more obvious, the API is more polished, and the
#' handling of problems is better. Superseded functions will not go away, but
#' will only receive critical bug fixes. 
#' 
#' First, run the following code to open up the help menu
#' for the separate_wider_delim() function and take a look at the arguments 
#' and examples for this function: 

?separate_wider_delim

#' Scroll down to the examples provided and see if you can complete 
#' the following code to separate the course_id variable into 
#' three colulmns named course, semester, and section. 

course_time <- log_data |>
  select(student_id, course_id, time_spent) |>
  separate_wider_delim(        , 
                       delim = ,
                       names = )

#### Exercise 4 ##################

#' Now try completing the following code to "unite" them back together into 
#' a column named course_id. 

course_time <- course_time |>
  unite( )



# Join Data Sets ####################

## Mutating Joins #####

### Exercise 5 ##################

#' In the space below, use the one of the join functions introduced 
#' in the primers to merge our course_time and survey_long datasets 
#' into a single data set that contains all survey responses and 
#' time spent in the course for every student and assign to an object
#' with a name of your own choosing.
#' 
#' Hint: Some student take more that one course so you will need
#' to join by using both their student_id and their course_id. 



#' In the space below explain which type of join you used and and why the 
#' number of observations in your joined data set may differ than the 
#' number of observations in your survey_long data set. 




