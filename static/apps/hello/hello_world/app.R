ui <- fluidPage(
  textInput(
    inputId = "name", # ID to obtain text in server code
    label = "Enter your name, please :)", # Guide the user with what to input
    value = "" # Initial value in the box
  ),
  
  # Replace this with textOutput
  uiOutput(
    outputId = "greeting"
  ),
  # "Hello, Mitch!"
  
  sliderInput(
    "sample_sizes",
    label = "Number of samples",
    min = 1, max = 1000,
    value = 100
  ),
  
  # Make a plot
  plotOutput(
    outputId = "histogram"
  )
)
server <- function(input, output, session) {
  output$greeting <- renderUI({
    now <- Sys.time()
    p(
      "Hello",
      br(),
      input$name
    )
    # paste("Hello", input$name, "It is", now)
  })
  
  output$histogram <- renderPlot({
    # Make a plot
    input$name
    hist(rnorm(input$sample_size))
  })
}
shinyApp(ui, server)
# Ctrl + Shift + Enter
