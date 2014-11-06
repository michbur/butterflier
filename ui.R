library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Butterflier"),
  sidebarPanel(
    radioButtons("what_plot", "What do you want to plot?",
                 c("Heart" = "heart",
                   "Butterfly" = "butterfly")),
    numericInput("number_points", "Number of points:", 1000,
                 min = 100, max = 1200, step = 10)
  ),
  mainPanel(
    plotOutput("nice_image")
  )
))
