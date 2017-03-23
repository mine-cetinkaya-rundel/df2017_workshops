library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      verbatimTextOutput("click"),
      verbatimTextOutput("dblclick"),
      verbatimTextOutput("hover"),
      verbatimTextOutput("brush")
    ),
    mainPanel(
      plotOutput("plot",
                 click = "click",
                 dblclick = "dblclick",
                 hover = "hover",
                 brush = "brush")
    )
  )
)
    