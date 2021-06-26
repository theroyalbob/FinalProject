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
      selectInput("StarYear", "From:", choices = LaborData$Year),
      selectInput("EndYear", "To:", choices = LaborData$Year), #IDK how to ensure the user enters a year later than the first choice
      checkboxGroupInput("ChosenSex", "Sex", choices = c("Men", "Women"))
    ),
    
    mainPanel(
      h5("From the Bureau of Labor Statistics - Employment status of the civilian noninstitutional population 16 years and over 
         by sex, 1980 to 2020 ", align = "left", style = "color:blue"),
      
      
      plotOutput("bargraph"),
      
      plotOutput("scatterplot"),
      
      #Make a pie chart outlining civilian labor force (total working non-agriculture, total agriculture, total unemployed)
      plotOutput("piechart")
      
      
    )
  )
)

server <- function(input, output, session) {
  
  output$bargraph <- renderPlot({
    
  })
  
  output$scatterplot <- renderPlot({
    
  })
  
  output$piechart <- renderPlot({
    
  })
}

shinyApp(ui = ui, server = server)