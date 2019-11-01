library(shiny)
function(input, output, session) {
  # 1. Create a reactive value for the current painting's row number
  rv <- reactiveValues(???)
  
  # 2. Create a reactive expression for the current painting's data
  # Hint: The full dataset is created in the global.R file
  current_painting <- ???
  
  # 3. Create a text renderer for the current painting's title
  output$??? <- ???
  
  # 4. Complete the image renderer's code for the current painting's image
  output$??? <- ???({
    list(src = ???)
  }, deleteFile = FALSE)
  
  # 5. Use observeEvent() to make the buttons switch between paintings
  observeEvent(input$???, {
    ???
  })
  
  observeEvent(input$???, {
    ???
  })
}
