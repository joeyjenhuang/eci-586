library(shiny)

library(tidyverse)

data_to_explore <- read_csv("data/data-to-explore.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Course Grade Estimator"),

    # Sidebar layout with a sidebar and main panels
    sidebarLayout(position = "left",
        sidebarPanel(
            
            #Checkbox for courses
            checkboxGroupInput("subject", 
                               "Which course(s) are you taking?", 
                               choices = list("Anatomy",
                                              "Biology", 
                                              "Forensics", 
                                              "Oceanography", 
                                              "Physics"),
                               selected = "Anatomy"),
            
            #Slider to select minimum and maximum number of hours 
            sliderInput("hours",
                        "How much time do you plan to spend?",
                        min = 0,
                        max = 120,
                        value = c(0, 120),
                        step = 2), 
            
            helpText("Select a minimum and maximum amount of time you
                     think you will have to dedicate to this course.")
            
            
        ),

        # Displays the scatterplot and help text
        mainPanel(
            
            plotOutput("scatterplot"),
            
            p("In the scatter plot above, each point indicates the 
              amount of time a student spent and their percentage of 
              total points earned on assignments, which here is used 
              as a close approximation of their final grade."),
            
            p("Use the reference line to gague your estimated grade based
              on the past performance of students and the amount 
              of time they spent working online.")
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$scatterplot <- renderPlot({
        
        #Creates a data frame for scatter plot using reactive inputs from ui
        data_to_viz <- 
            data_to_explore  %>% 
                select(subject, 
                       section, 
                       time_spent_hours, 
                       proportion_earned) %>%
                mutate(subject = recode(subject, 
                                        "AnPhA" = "Anatomy",
                                        "BioA" = "Biology", 
                                        "FrScA" = "Forensics", 
                                        "OcnA" =  "Oceanography", 
                                        "PhysA" = "Physics")) %>%
                mutate(grade = proportion_earned * 100) %>%
                filter(time_spent_hours >= input$hours[1] 
                       & time_spent_hours <= input$hours[2]) %>%
                filter(subject %in% c(input$subject))
        
        #Creates scatterplot for main panel in the ui    
        ggplot(data_to_viz) +
            geom_point(mapping = aes(x = time_spent_hours, 
                                     y = grade,
                                     color = subject),
                       alpha = .25) +
            geom_smooth(mapping = aes(x = time_spent_hours, 
                                      y = grade,
                                      color = subject,
                                      weight = .5),
                        method = lm,
                        se = FALSE) +
            ylim(0, 100) +
            xlim(input$hours[1], input$hours[2]) +
            labs(y = "Course Grade",
                 x = "Hours Logged into Online Course",
                 caption = "Fine print: Time spent online does not necessarly account for all time students spent on the course, e.g, studying offline.") +
            theme_minimal() +
            theme(legend.position = "right") +
            scale_color_brewer(palette = "Set1",
                               name = "Course Subject")
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
