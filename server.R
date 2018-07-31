library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  IrisData <- reactive( {
    iris[sample(nrow(iris), input$sampleSize),]
  })

  output$myplot <- reactivePlot(function() {
    plot <- ggplot(IrisData(), aes_string(x = input$x,  y = input$y, color = "Species")) + geom_point() + 
      scale_color_manual(values = c("Red", "Blue", "Black"))

    # if(input$jitter)
    #       plot <- plot + geom_jitter()
    if(input$smooth)
      plot <- plot + geom_smooth()

    print(plot)
    
  }
  )
})