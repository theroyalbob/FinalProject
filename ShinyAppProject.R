#Shiny App Project

library(tidyverse)
library(shiny)

#HOUSEHOLD DATA - ANNUAL AVERAGES
#Employment status of the civilian noninstitutional population 16 years and over by sex, 1980 to 2020 (numbers in thousands)

LaborData <- read.csv("LaborStatisticsDataSet.csv")
View(LaborData)


ui <- fluidPage(
  titlePanel("Labor Statistics Data"),
  
  sidebarLayout(
    sidebarPanel(
      #selectInput("StarYear", "From:", choices = LaborData$Year),
      #selectInput("EndYear", "To:", choices = LaborData$Year), 
      #We may run into some issues with a date range -- not sure how to either once the first selection is made, make the next choices only dates after that
      #IDK how to ensure the user enters a year later than the first choice
      
      selectInput("SelectedYear", "From:", choices = LaborData$Year),
      checkboxGroupInput("SelectedSex", "Sex", choices = LaborData$Sex), #Not sure how to make it so its only 1 option for Men and Women rather than 40 of both
    ),
    
    mainPanel(
      h5("From the Bureau of Labor Statistics - Employment status of the civilian noninstitutional population 16 years and over 
         by sex, 1980 to 2020 ", align = "left", style = "color:blue"),
      
<<<<<<< Updated upstream
      #Shell for three output graphs
      # plotOutput("bargraph"),
      
      # plotOutput("scatterplot"),
=======
     #Shell for three output graphs
     # plotOutput("bargraph"),
      
     # plotOutput("scatterplot"),
>>>>>>> Stashed changes
      
      #Maybe we can make a pie chart outlining civilian labor force (total working non-agriculture, total agriculture, total unemployed)
      #For a given the chosen year and gender selected 
      #plotOutput("piechart")
    )
    
  )
)

server <- function(input, output, session) {
  
  #output$bargraph <- renderPlot({
<<<<<<< Updated upstream
  
  #LaborDataBarGraph <- LaborData %>%
  # filter(Year == SelectedYear, Sex == SelectedSex) %>%
  #select(#pick variables to output)
  
  #ggplot (data = LaborDataBarGraph) +
  #   geom_bar()
  
  #})
  
  #output$scatterplot <- renderPlot({
  
  # })
  
  # output$piechart <- renderPlot({
  
=======
  
  #LaborDataBarGraph <- LaborData %>%
   # filter(Year == SelectedYear, Sex == SelectedSex) %>%
    #select(#pick variables to output)
  
  #ggplot (data = LaborDataBarGraph) +
  #   geom_bar()
    
  #})
  
  #output$scatterplot <- renderPlot({
    
 # })
  
 # output$piechart <- renderPlot({
    
>>>>>>> Stashed changes
  #})
}

shinyApp(ui = ui, server = server)