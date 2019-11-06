library(shiny)

fluidPage(
  titlePanel("The gallery of Bob Ross"),
  
  sidebarLayout(
    sidebarPanel(
      img(src = "joy_of_painting.jpg", style = "padding-bottom:25px;width:100%"),
      
      sliderInput("season", "Season:", min = 1, max = 31, value = 1),
      sliderInput("episode", "Episode:", min = 1, max = 13, value = 1),
      
      textInput("text", "Enter S?E? text:", placeholder = "S1E1"),
      
      checkboxInput("carousel_enable", label = "Carousel Mode:",
                    value = FALSE),
      sliderInput("carousel_speed", label = "Carousel speed:",
                  min = 0.5, max = 10, step = 0.5, value = 3),
      
      actionButton("btn_previous", label = NULL, icon = icon("arrow-left"), width = "20%"),
      span(style = "display:inline-block;width:56%"),
      actionButton("btn_next", label = NULL, icon = icon("arrow-right"), width = "20%")
    ),
    
    mainPanel(
      textOutput("title"),
      imageOutput("painting")
    )
  )
)
