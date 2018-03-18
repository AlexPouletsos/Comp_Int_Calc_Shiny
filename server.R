library(shiny)
shinyServer(function(input, output) {

        formula <- reactive({
        inv <- input$box1
        int <- input$box2
        year <- input$sliderRtrn
        round(inv*(1+int)^year, digits=2)
        })

        balTable <- reactive({
                bal <- input$box1
                df <- 0
                for (i in 1:50) {
                        bal <- bal*(1+input$box2)
                        df <- rbind(df, bal-input$box1)
                }
                print(df[,1])
        })

        output$plot1 <- renderPlot({
                plot(0:50, balTable(), xlab="Year", ylab="Interest Earned")
                points(input$sliderRtrn, formula()-input$box1, col = "red", pch = 16, cex = 1.75)

        })

        output$Return <- renderText({
                paste("Interest Earned: $", formula()-input$box1)
        })

})




