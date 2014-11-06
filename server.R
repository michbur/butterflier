library(shiny)
source("plot_nice_image.R")



# server for the Shiny app
shinyServer(function(input, output) {
  
  output[["nice_image"]] <- renderPlot({
    p <- plot_nicely(what = input[["what_plot"]], input[["number_points"]],
                     input[["min_points"]], input[["max_points"]])
    print(p)
  }, height=800)
   
})
