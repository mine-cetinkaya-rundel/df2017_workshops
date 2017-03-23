library(shiny)
library(ggplot2)
library(dplyr)

server <- function(input, output) {

    # render in server.R goes with output in ui.R
    output$hist <- renderPlot({
    n <- input $n
    df <- data.frame(x=rnorm(n))
    g <- ggplot(df, aes(x=x)) +
      geom_histogram(bins=n/5) +
      geom_vline(xintercept = mean(df$x), color="red")
    g
  })

# render in server.R goes with output in ui.R
  output$table <- renderTable({
    n <- input $n
    df <- data.frame(x=rnorm(n))
    df %>% summarise(mean=mean(x), median=median(x), sd=sd(x))
  })
}
