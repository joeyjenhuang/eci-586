pacman::p_load(tidyverse,
               flexdashboard, 
               janitor)

course_minutes <- dataedu::course_minutes

course_data <- dataedu::course_data

course_text <- dataedu::sci_mo_with_text

write_csv(course_text, "unit-3/data/course-text.csv")

course_text <- read_csv("unit-3/data/course-text.csv") |>
  clean_names()

data_to_viz <- course_text |>
  select(course_id, 
         gender,
         time_spent_hours, 
         final_grade) |>
  separate(course_id, c("subject", "semester", "section")) |>
  mutate(subject = recode(subject, 
                          "AnPhA" = "Anatomy",
                          "BioA" = "Biology", 
                          "FrScA" = "Forensics", 
                          "OcnA" =  "Oceanography", 
                          "PhysA" = "Physics"))

data_to_viz |>
  group_by(subject) |>
  summarise(avg_grade = mean(final_grade, na.rm=TRUE),
            avg_time = mean(time_spent_hours, na.rm=TRUE))
