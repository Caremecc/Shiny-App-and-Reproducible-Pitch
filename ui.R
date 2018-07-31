library(shiny)
library(ggplot2)

IrisData <- iris[-c(5)]

shinyUI(fluidPage(
  titlePanel("Iris Data"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("sampleSize", "Sample size:", min = 20, max = nrow(IrisData), value = min(20, nrow(IrisData)), 
                   step = 5, round = 0),
       selectInput("x", "X-axis", names(IrisData)),
       selectInput("y", "Y-axis", names(IrisData), names(IrisData)[[2]]),

       # checkboxInput('jitter', 'Jitter'),
       checkboxInput('smooth', 'Smooth')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Graph of the Iris Dataset"),
       plotOutput("myplot")
    )
  )
))