library(shiny)

ui <- fluidPage(
  titlePanel("Title"),
  
  sidebarLayout( 
    sidebarPanel(
      h2("Free inputs"),
      textInput("text", "Text widget", value="Enter some text"),
      numericInput("numeric", "Numeric widget", min=50, max=100, value=50),
      sliderInput("slider", "Slider widget",  min=0, max=10, value=5)
    ),

    mainPanel(
      tabsetPanel(
      tabPanel("Text", verbatimTextOutput("text")),
      tabPanel("Numeric", 
               textOutput("number"),
               plotOutput("numeric.plot")),
      tabPanel("Slider", textOutput("slider"))
      )
    )
  )
)
