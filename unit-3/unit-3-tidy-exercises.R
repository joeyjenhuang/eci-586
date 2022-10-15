pacman::p_load(tidyverse,
               flexdashboard)

course_minutes <- dataedu::course_minutes

course_data <- dataedu::course_data

course_text <- dataedu::sci_mo_with_text

write_csv(course_text, "unit-3/data/course-text.csv")
