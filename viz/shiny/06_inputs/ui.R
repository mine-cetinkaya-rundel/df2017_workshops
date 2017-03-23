library(shiny)

ui <- fluidPage(
  h2("Free inputs"),
  textInput("text", "Text widget", value="Enter some text"),
  numericInput("numeric", "Numeric widget", min=0, max=10, value=5),
  sliderInput("slider", "Slider widget",  min=0, max=10, value=5),  
  
  hr(),
  
  h2("List inputs"),
  selectInput("select", "Select widget", choices=c(ann="a", bob="b", charlie="c")),
  checkboxGroupInput("checkboxgroup", "Checkbox group widget", 
                     choices=c(ann="a", bob="b", charlie="c"), 
                     selected = c("a", "c")),
  radioButtons("radio", "Radio button widget", 
               choices=c(ann="a", bob="b", charlie="c"), 
               selected = "a"),
  
  hr(),
  
  h2("Date inputs"),
  dateInput("date", "Date", value = "2017-03-23", min="2017-01-01", max="2017-12-31"),
  dateRangeInput("date", "Date", min="2017-01-01", max="2017-12-31"),
  
  hr(),
  
  h2("File inputs"),
  fileInput("file", "File widget"),
  
  hr(),
  
  h2("Buttons"),
  actionButton("action", "Action widget"),
  submitButton("submit"),
  downloadButton("download")
  )
