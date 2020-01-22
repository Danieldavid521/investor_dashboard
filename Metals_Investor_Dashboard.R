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
              fluidRow(
                tableOutput("Silver_table")
              )
      ),
      tabItem(tabName = "Gold", 
              fluidRow(
                tableOutput("Gold_table")
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
  output$Silver_table <- renderTable(silver_data)
  output$Gold_table <- renderTable(gold_data)
  }

shinyApp(ui, server)

