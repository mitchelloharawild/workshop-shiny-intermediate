library(shiny)
library(leaflet)
library(tidyverse)
function(input, output, session) {
  output$map_id <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$CartoDB.Positron)
  })
  
  bbq_shown <- reactive({
    bbq %>% 
      filter(`BBQ TYPE` %in% input$type)
  })
  
  observe({
    leafletProxy("map_id", session) %>% 
      clearMarkers() %>% 
      addCircleMarkers(lng= ~LONGITUDE, lat= ~LATITUDE,
                       stroke = FALSE, fillOpacity = 0.5,
                       data = bbq_shown())
  })
}
