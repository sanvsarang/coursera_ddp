#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(diamonds)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data <- reactive({
        diamonds[sample(nrow(diamonds),input$size),]
    })
    
    output$distText <- renderText({
    nrow(data())    
    })
    
    output$distPlot <- renderPlot({

        #generate x and y axis and color based on input from ui.R
        p <- ggplot(data(), aes_string(x = input$x, y = input$y))
        
        
        if(input$col == 'blue') p <- p + geom_jitter(col = "blue", size = 7, alpha = 0.2)
        else p <- p + geom_jitter(aes_string(col = input$col), size = 7, alpha = 0.2)
        
        print(p)
        
    }, height = 600)

})
