library(shiny)

ui <- fluidPage(
  h1("Look at the mean"),
  sliderInput("n", "Number of data points:", 10, 100, 50),

  # plotOutput in ui.R goes with renderPlot in server.ui
  plotOutput("hist"),

  # plotTable in ui.R goes with renderTable in server.ui
  tableOutput("table")
)
