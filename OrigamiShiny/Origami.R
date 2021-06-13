#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#Two tabs: 1. Demographics and 2. Predictions
#1. Demographics data 
#2. tab set up for prediction 

ui <- fluidPage(
    title = "Origami Data",
    tags$h2("Origami Lesson Analysis by the Five Find-Outers: "),
    tags$p("Here are our findings."),
    sidebarLayout(
        sidebarPanel(
            #1. Demographics data
            conditionalPanel( 
                'input.data === "Demographics"',
                helpText("Here we presented the relevant information on the break down on the classmates that participated in our synchronous origami lesson.")
            ),
            #2. tab set up for prediction
            conditionalPanel( 
                'input.data === "Predictions"',
                helpText("Decision tree algorithm - Basics and visual representation: The algorithm of decision tree models works by repeatedly partitioning the data into multiple sub-spaces, so that the outcomes in each final sub-space is as homogeneous as possible. This approach is technically called recursive partitioning. In the following html output you will see the entire process of data wrangling, analysis, and modeling results")
            )
        ),
        mainPanel(
            tabsetPanel(
                id = 'data',
                tabPanel("Demographics",
                         plotOutput("demo"),
                         plotOutput("pie"),
                         plotOutput("pie2"),
                         plotOutput("pie3"),
                         plotOutput("pie4")
                ),
                tabPanel("Predictions", htmlOutput("pred"))
            )
        )
    )
)

server <- function(input, output) {
    
    output$demo <- renderPlot({
        mytable1
    })
    
    output$pie <- renderPlot({
        myTable2
    })
    
    output$pie2 <- renderPlot({
        myTable3
    })
    
    output$pie3 <- renderPlot({
        myTable4
    })
    
    output$pie4 <- renderPlot({
        myTable5
    })
    
    getPage<-function() {
        return(includeHTML("Origami_Prediction.html"))
    }
    output$pred<-renderUI({getPage()})
}

shinyApp(ui, server)