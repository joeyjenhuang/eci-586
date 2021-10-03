

library(tidymodels)
library(tidyverse)

sci_mo_with_text <- read_csv("data/sci-mo-with-text.csv")

set.seed(123)

course_data <- 
  sci_mo_with_text %>% 
  clean_names() %>%
  mutate(
    at_risk = ifelse(final_grade >= 70, "late", "on_time"),
    # We will use the date (not date-time) in the recipe below
    date = lubridate::as_date(time_hour)
  ) %>% 
  # Include the weather data
  inner_join(weather, by = c("origin", "time_hour")) %>% 
  # Only retain the specific columns we will use
  select(dep_time, flight, origin, dest, air_time, distance, 
         carrier, date, arr_delay, time_hour) %>% 
  # Exclude missing data
  na.omit() %>% 
  # For creating models, it is better to have qualitative columns
  # encoded as factors (instead of character strings)
  mutate_if(is.character, as.factor)