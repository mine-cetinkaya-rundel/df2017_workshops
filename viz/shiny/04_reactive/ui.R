library(shiny)

ui <- fluidPage(
  h1("Look at the mean"),
  sliderInput("n", "Number of data points:", 10, 100, 50),
  plotOutput("hist"),
  tableOutput("table")
)
