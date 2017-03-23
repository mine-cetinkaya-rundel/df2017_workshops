library(shiny)

server <- function(input, output) {
  output$text <- renderText({
    paste("Text value is", input$text)
  })
  
  numeric <- reactive({
    input$numeric
  })
  
  output$number <- renderText({
    paste("Number value is", numeric())
  })
  
  output$numeric.plot <- renderPlot({
    x <- rnorm(numeric())
    y <- rnorm(numeric())
    df <- data.frame(x=x, y=y)
    ggplot(df, aes(x=x, y=y)) + geom_point()
  }
  )
  
  output$slider <- renderText({
    paste("Slider value is", input$slider)
  })
}
