library(shinydashboard)
library(shinythemes)

ui <- dashboardPage(skin = "yellow",
  dashboardHeader(title = "Metal Prices & charts"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Metals", tabName = "Silver", icon = icon("coins"), menuSubItem("silver"),menuSubItem("gold")),
      menuItem("oil", tabName = "Gold", icon = icon("oil-can")),
      menuItem("Energy", tabName = "", icon = icon("bolt")),
      menuItem("Agricultural", tabName = "ag", icon = icon("pastafarianism"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "Metals",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "Gold",
              h2("Widgets tab content")
      )
    )
  )
)


server <- function(input, output) { }

shinyApp(ui, server)
