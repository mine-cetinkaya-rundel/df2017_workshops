library(shiny)

ui <- fluidPage(
  # Download a CSS file from https://bootswatch.com and put in www folder
  theme = "bootstrap.css",
  
  titlePanel("title panel"),
  
  sidebarLayout(
    position = "left",
    sidebarPanel("sidebar panel"),
    mainPanel("main panel")
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)