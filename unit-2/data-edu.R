# install {remotes}
install.packages("remotes", repos = "http://cran.us.r-project.org")

# install the {dataedu} package (requires R version 3.6 or higher)
remotes::install_github("data-edu/dataedu")

library(tidyverse)
library(janitor)

grade_book <- dataedu::course_data |>
  clean_names()

write_csv(grade_book, "unit-2/data/grade-book.csv")

pre_survey <- dataedu::pre_survey

write_csv(sci_mo_processed, "unit-2/data/pre-survey.csv")


sci_mo_with_text <- dataedu::sci_mo_with_text

write_csv(sci_mo_with_text, "unit-2/data/sci-mo-with-text.csv")

View(sci_mo_with_text)

sci_mo_processed <- dataedu::sci_mo_processed |>
  clean_names()

View(sci_mo_processed)

write_csv(sci_mo_processed, "unit-2/data/processed-data.csv")

grade_book <- dataedu::gradebook

?dataedu
