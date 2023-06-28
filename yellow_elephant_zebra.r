#Library Installation
#install.packages("shiny")
install.packages("ggplot2")
install.packages("ggrepel")

#Data Set 
data <- read.csv("adventure_data.csv")

#User Interface 
ui <- shinyUI(fluidPage(
  titlePanel("The Adventure Collective"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("region","Choose a Region:",
                     c("Africa" = "africa",
                       "Antarctica" = "antarctica",
                       "Asia" = "asia",
                       "Europe" = "europe"),
                       selected = "africa"),

      checkboxGroupInput("activity", "Choose Activities:", 
                         c("Trekking" = "trekking",
                           "Climbing" = "climbing",
                           "Kayaking" = "kayaking",
                           "Skiing" = "skiing",
                           "Surfing" = "surfing")),

      sliderInput("cost", "Cost:",
                  min = min(data$cost),
                  max = max(data$cost),
                  value = c(min(data$cost), max(data$cost))),
      
      sliderInput("duration", "Duration:",
                  min = min(data$duration),
                  max = max(data$duration),
                  value = c(min(data$duration), max(data$duration)))
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Map",
                 leafletOutput("map", height = 500)),
                 
        tabPanel("Plot",
                 plotOutput("plot"))
      )
    )
  )
))

#Server Side Code 
server <- shinyServer(function(input, output) {

  #Filtering the dataset 
  filtered <- reactive({
    data[data$region == input$region &
           data$activity %in% input$activity &
           data$cost >= input$cost[1] &
           data$cost <= input$cost[2] &
           data$duration >= input$duration[1] &
           data$duration <= input$duration[2], ] 
  })
  
  # Create a map 
  output$map <- renderLeaflet({
    leaflet() %>% 
      addPolygons(data = filtered(),
                  label = ~location)
  })
  
  # Create a plot
  output$plot <- renderPlot({
    ggplot(data = filtered(),
           aes(x = duration,
               y = cost,
               label = location)) +
      geom_point() + 
      geom_text_repel() + 
      ggtitle("Cost vs Duration") +
      theme_minimal()
  })
})

#Execute Shiny App 
shinyApp(ui = ui, server = server)