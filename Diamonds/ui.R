#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data("diamonds")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diamonds Dataset Feature relationship"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Documentation"),
            
            tags$ul(
                tags$li("Select slider Input to choose sample size"), 
                tags$li("Use X axis and Y axes dropdowns to select 2 features"), 
                tags$li("Use Colour dropdwon to integrate 3rd feature")
            ),
            
            sliderInput("size", 
                        "Sample size",
                        min = 100,
                        max = nrow(diamonds),
                        value = 100,
                        step = 100),
            
            
            selectInput("x",
                        "X axis:",
                        choices = names(diamonds)[c(1:7)]),
            
            selectInput("y",
                        "Y axis:",
                        choices = names(diamonds)[c(1:7)]),
            
            selectInput("col",
                        "Colour:",
                        choices = c("blue",names(diamonds)[c(1:7)]),
                        selected = "blue"),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Sample size = ",textOutput("distText")) ,
            plotOutput("distPlot")
        )
    )
))
