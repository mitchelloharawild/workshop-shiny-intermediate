library(shiny)
function(input, output, session) {
  # 1. Create a reactive value for the current painting's row number
  rv <- reactiveValues(row_num = 2)
  
  # 2. Create a reactive() expression for the current painting's data
  # Hint: The full dataset is created in the global.R file
  # Hint: Use rv$row_num to extract the painting's row
  current_painting <- reactive({
    paintings[rv$row_num,] # Extract row rv$row_num from paintings
    
    # paintings %>%
    #   filter(row_number() == rv$row_num)
  })
  
  # 3. Create a text renderer for the current painting's title
  # S1E1: A Walk in the Woods
  #
  # Hint: Look at the UI to figure out the ID
  # Hint: Access the episode with current_painting()$episode
  # Hint: Use paste0() to combine the episode with title
  output$title <- renderText({
    work <- current_painting()
    paste0(work$episode, ": ", work$title)
    # sprintf("%s: %s", work$episode, work$title)
  })
  
  # Ctrl + Shift + C
  # 4. Complete the image renderer's code for the current painting's image
  output$painting <- renderImage({
    work <- current_painting()
    list(src = file.path("data", "images", work$image))
  }, deleteFile = FALSE)

  # 5. Use observeEvent() to make the buttons switch between paintings
  observeEvent(input$btn_previous, {
    rv$row_num <- rv$row_num - 1
  })

  observeEvent(input$btn_next, {
    rv$row_num <- min(nrow(paintings), rv$row_num + 1)
  })
}
