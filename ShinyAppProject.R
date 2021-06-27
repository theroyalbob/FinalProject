#Shiny App Project

library(tidyverse)
library(ggplot2)
library(shiny)

#HOUSEHOLD DATA - ANNUAL AVERAGES
#Employment status of the civilian noninstitutional population 16 years and over by sex, 1980 to 2020 (numbers in thousands)

LaborData <- read.csv("LaborStatisticsDataClean2.csv")
LaborData

#data(LaborData)
ui <- fluidPage(
  titlePanel("Labor Statistics Data"),
      h5("From the Bureau of Labor Statistics - Employment status of the civilian noninstitutional population 16 years and over 
         by sex, 1980 to 2020 ", align = "left", style = "color:blue"),
      
     #Input for Bargraph Visual
     checkboxGroupInput("SelectedSex", "Sex", choices = unique(LaborData$Sex),selected = c("Men", "Women")),
     selectInput("Var", "Variable", choices = names(LaborData[,c(-2,-1)]), selected = LaborData$Total.Employed),
     plotOutput("bargraph"),
  
     #Input for Table information based on selected year
     selectInput("SelectedYear","Year", choices = unique(LaborData$Year)),
     dataTableOutput("table")
)

server <- function(input, output, session) {
  
  output$bargraph <- renderPlot({
   df <- LaborData %>%
     filter(Sex == input$SelectedSex)
   
    ggplot(data = df, aes(Year, .data[[input$Var]], color = Sex))+
      geom_point()+
      geom_smooth(method = "lm")
  })
  
  
  output$table <- renderDataTable({
    LaborData %>%
      filter(Year == input$SelectedYear) -> df_table
    df_table
  })
}

shinyApp(ui = ui, server = server)
