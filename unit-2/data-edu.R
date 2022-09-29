# install {remotes}
install.packages("remotes", repos = "http://cran.us.r-project.org")

# install the {dataedu} package (requires R version 3.6 or higher)
remotes::install_github("data-edu/dataedu")


course_data <- dataedu::course_data

sci_mo_with_text <- dataedu::sci_mo_with_text

view(sci_mo_with_text)

sci_mo_processed <- dataedu::sci_mo_processed

view(sci_mo_processed)
