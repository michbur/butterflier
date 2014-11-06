library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Butterflier"),
  sidebarPanel(
    radioButtons("what_plot", "What do you want to plot?",
                 c("Heart" = "heart",
                   "Butterfly" = "butterfly")),
    numericInput("number_points", "Number of points:", 1000,
                 min = 100, max = 1200, step = 10),
    numericInput("min_points", "Minimum size of the point:", 1,
                 min = 1, max = 10, step = 1),
    numericInput("max_points", "Maximum size of the point:", 15,
                 min = 11, max = 20, step = 1)
  ),
  mainPanel(
    plotOutput("nice_image")
  )
))
