library(shiny)

ui <- fluidPage(
  # Download a CSS file from https://bootswatch.com and put in www folder
  theme = "bootstrap.css",
  
  titlePanel("title panel"),
  
  sidebarLayout(
    position = "left",
    sidebarPanel("sidebar panel", 
                 img(src="duke.png", align="left")),
    mainPanel("main panel")
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)