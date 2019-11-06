library(shiny)
library(leaflet)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "ACT BBQs"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Map", tabName = "map", icon = icon("map"))
    )
  ),
  dashboardBody(
    box(title = "Map controls", status = "primary",
        selectizeInput("type", label = "BBQ Type:", choices = unique(bbq$`BBQ TYPE`)),
        width = 3
    ),
    box(
      tabItem(tabName = "map",
              leafletOutput("map_id")),
      width = 12
    )
  )
)
