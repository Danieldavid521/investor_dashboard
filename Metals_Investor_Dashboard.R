library(shinydashboard)
library(shinythemes)
library(tidyverse)

silver_data <- read.csv("data/silverprices.csv")
gold_data <-  read.csv("data/gold_prices.csv")
  
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
              fluidRow(column(1,
                
                infoBox("Current Price", "$18.00", icon = icon("chart-bar"), color = "green",
                  tableOutput("Silver_table")),)
               
              )
      ),
      tabItem(tabName = "Gold", 
              fluidRow(column(1,
                infoBox("Current Price", "$1550.00", icon = icon("chart-bar"), color = "green",
                tableOutput("Gold_table")),)
              )
      ),
      tabItem(tabName = "Metals"),
      
      # Second tab content
      tabItem(tabName = "Gold",
              h2("Widgets tab content")
      )
    )
  )
)


server <- function(input, output) { 
  output$Silver_table <- renderTable(silver_data, width = "auto")
  output$Gold_table <- renderTable(gold_data)
  
  }

shinyApp(ui, server)

