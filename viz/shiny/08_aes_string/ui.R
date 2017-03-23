library(shiny)

fluidPage(
  numericInput("i", "Choose x column", 1, 1, 4),
  numericInput("j", "Choose y column", 2, 1, 4),
  plotOutput("scatter")
)
