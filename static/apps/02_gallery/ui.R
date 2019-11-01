library(shiny)

fluidPage(
  titlePanel("Bob Ross gallery"),
  
  sidebarLayout(
    sidebarPanel(
      img(src = "joy_of_painting.jpg", style = "padding-bottom:25px;width:100%"),
      
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
