

library(tidymodels)
library(tidyverse)

sci_mo_with_text <- read_csv("data/sci-mo-with-text.csv")


course_data <- 
  sci_mo_with_text |>
  clean_names() |>
  mutate(pass_fail = ifelse(final_grade >= 60, "pass", "on_time")) |>
  select(student_id,
         int,
         uv,
         pc,
         time_spent,
         final_grade,
         subject,
         enrollment_reason,
         semester,
         enrollment_status,
         cogproc,
         social,
         posemo,
         negemo,
         n) %>%   
  na.omit() %>% 
  mutate_if(is.character, as.factor)

course_data

course_data %>% 
  count(arr_delay) %>% 
  mutate(prop = n/sum(n))

 #split data

set.seed(123)



