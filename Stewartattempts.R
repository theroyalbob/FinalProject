require(shiny)
require(tidyverse)

ui<- fluidPage(
  titlePanel("US Workforce"),
  numericInput(inputId = "year1", label = "start year", value = 1980),
  numericInput("year2", label = "end year", 2020),
  plotOutput("point")
)

server<- function (input, output){
  reactive(LaborData%>%
    filter(Year>= input$year1, Year<= input$year2))
  observe(output$point<- renderPlot(ggplot(LaborData, aes(y = Total.Employed, x = Year, color = Sex))+
                            geom_point()))
}

shinyApp(ui,server)
