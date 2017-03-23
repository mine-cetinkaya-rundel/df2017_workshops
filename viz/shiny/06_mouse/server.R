library(shiny)
library(ggplot2)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(df, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) +
      geom_point()
  })
  
  output$click <- renderPrint({
    nearPoints(df, input$click)
  })
  
  output$dblclick <- renderPrint({
    nearPoints(df, input$dblclick)
  })
  
  output$hover <- renderPrint({
    nearPoints(df, input$hover)
  })

  output$brush <- renderPrint({
    brushedPoints(df, input$brush)
  })
}
