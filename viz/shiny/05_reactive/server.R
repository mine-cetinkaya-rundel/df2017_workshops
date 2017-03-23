library(shiny)
library(ggplot2)
library(dplyr)

server <- function(input, output) {

    # reactive objects get updated only when the input value(s) it uses changes
    data <- reactive({
      n <- input $n
      data.frame(x=rnorm(n))
    })
    
    # invalidate later triggers an update at regular intervals
    time <- reactive({
      invalidateLater(1000)
      Sys.time()
    })
  
    output$time <- renderPrint(time())
    
    output$hist <- renderPlot({
    df <- data()
    g <- ggplot(df, aes(x=x)) + 
      geom_histogram(bins=nrow(df)/5) +
      geom_vline(xintercept = mean(df$x), color="red")
    g
  })
  
  output$table <- renderTable({
    df <- data()
    df %>% summarise(mean=mean(x), median=median(x), sd=sd(x))
  })
}
