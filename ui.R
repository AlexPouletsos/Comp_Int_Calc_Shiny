library(shiny)
shinyUI(fluidPage(
        titlePanel("Compound Interest Calculator"),
        sidebarLayout(
                sidebarPanel(
                        numericInput("box1", "Principal", value = 5000, min=1, step=1),
                        numericInput("box2", "Interest Rate", value = .05, min=.01, max=1, step=.01),
                        sliderInput("sliderRtrn", "Years", 0, 50, value = 10)
                ),
                mainPanel(
                        plotOutput("plot1"),
                        textOutput("Return")
                )
        )
))

