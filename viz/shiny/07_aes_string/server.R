library(shiny)
library(ggplot2)

function(input, output) {
  output$scatter <- renderPlot({
    col <- colnames(iris)
    g <- ggplot(iris,
                aes_string(x=col[input$i],
                           y=col[input$j],
                           color="Species")) +
           geom_point()
    g
  })
}
