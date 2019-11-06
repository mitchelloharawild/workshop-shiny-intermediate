library(shiny)
function(input, output, session) {
  # 1. Create a reactive value for the current painting's row number
  rv <- reactiveValues(painting = 1)
  
  # 2. Create a reactive expression for the current painting's data
  current_painting <- reactive({
    paintings[rv$painting,]
  })
  
  # 3. Create a text renderer for the current painting's title
  output$title <- renderText({
    sprintf(
      "%s: %s",
      current_painting()$episode,
      current_painting()$title
    )
  })
  
  # 4. Complete the image renderer's code for the current painting's image
  output$painting <- renderImage({
    list(src = file.path("../", "paintings", current_painting()$image))
  }, deleteFile = FALSE)
  
  # 5. Use observeEvent() to make the buttons switch between paintings
  observeEvent(input$btn_previous, {
    rv$painting <- max(1, rv$painting - 1)
  })
  
  observeEvent(input$btn_next, {
    rv$painting <- min(NROW(paintings), rv$painting + 1)
  })
  
  # 6. Add sliders for quickly choosing the season and episode
  observe({
    chosen_episode <- sprintf("S%iE%i", input$season, input$episode)
    rv$painting <- match(chosen_episode, paintings$episode)
  })
}
