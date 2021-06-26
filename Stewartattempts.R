require(shiny)
require(tidyverse)

ui<- fluidPage(
  titlePanel("US Workforce"),
  selectInput(inputId = "year1", label = "from: ", choices = unique(LaborData$Year)),
  selectInput("year2", label = "end year", choices = unique(LaborData$Year)),
  selectInput("sex", "Sex", choices = unique(LaborData$Sex)),
  plotOutput("point")
)

server<- function (input, output){
  reactive(LaborData%>%
    filter(Year>= input$year1, Year<= input$year2))
  observe(output$point<- renderPlot(ggplot(LaborData, aes(y = Total.Employed, x = Year, color = Sex))+
                            geom_point()))
}

shinyApp(ui,server)
