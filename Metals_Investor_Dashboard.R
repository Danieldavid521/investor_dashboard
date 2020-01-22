library(shinydashboard)
library(shinythemes)

ui <- dashboardPage(skin = "yellow",
  dashboardHeader(title = "Metal Prices & charts"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Metals", tabName = "Silver", icon = icon("coins"), menuSubItem("silver", tabName = "Silver"),menuSubItem("gold", tabName = "Gold")),
      menuItem("oil", tabName = "Gold", icon = icon("oil-can")),
      menuItem("Energy", tabName = "Energy", icon = icon("bolt")),
      menuItem("Agricultural", tabName = "ag", icon = icon("pastafarianism"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "Silver", 
              fluidRow(
                tableOutput("Silver_table")
              )
      ),
      tabItem(tabName = "Gold", 
              fluidRow(
                h1("Homepage 2")
              )
      ),
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


server <- function(input, output) { 
  output$Silver_table <- renderTable(head(mtcars))
  }

shinyApp(ui, server)
