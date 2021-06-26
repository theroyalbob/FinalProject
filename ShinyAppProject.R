#Shiny App Project

library(tidyverse)
library(shiny)

#HOUSEHOLD DATA - ANNUAL AVERAGES
#Employment status of the civilian noninstitutional population 16 years and over by sex, 1980 to 2020 (numbers in thousands)

LaborData <- read.csv("LaborStatisticsDataclean.csv")
View(LaborData)

#data(LaborData)
ui <- fluidPage(
  titlePanel("Labor Statistics Data"),
      h5("From the Bureau of Labor Statistics - Employment status of the civilian noninstitutional population 16 years and over 
         by sex, 1980 to 2020 ", align = "left", style = "color:blue"),
      
      #Shell for three output graphs
      #selectInput(selectInput("SelectedYear","Year", choices = unique(LaborData$Year))),
      #plotOutput("piechart"),
      
     #Shell for three output graphs
     checkboxGroupInput("SelectedSex", "Sex", choices = unique(LaborData$Sex),selected = c("Men", "Women")),
     selectInput("Var", "Variable", choices = names(LaborData[,c(-2,-1,-3)]), selected = LaborData$Total.Employed),
     plotOutput("bargraph"),
      
     #plotOutput("table")
)

server <- function(input, output, session) {
  output$bargraph <- renderPlot({
    df <- LaborData%>%
      filter(Sex == input$SelectedSex)
    ggplot(data = df, aes(Year,.data[[input$Var]]))+
      geom_point(aes(color = Sex))
  })
}

shinyApp(ui = ui, server = server)
