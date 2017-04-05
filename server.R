library(shiny)

shinyServer(function(input, output) {
    
    output$range <- renderUI({
        minval <- min(bggdata[,input$xvar])
        maxval <- max(bggdata[,input$xvar])
        sliderInput("xrange", "x limits", minval, maxval,
                    sep = "", value = c(minval, maxval))
    })
    
    newbgg <- eventReactive(input$plot, {
        bggdata[bggdata[,input$xvar] >= input$xrange[1] &
                    bggdata[,input$xvar] <= input$xrange[2],]
    })
    
    plotlm <- reactive({
        model <- lm(newbgg()[,input$yvar] ~ newbgg()[,input$xvar])
        c(coef(model)[1], coef(model)[2],
          summary(model)$coefficients[2,3], summary(model)$coefficients[2,4])
    })
    
    output$scatterplot <- renderPlotly({
        gg <- ggplot(newbgg(), aes_(as.name(input$xvar), as.name(input$yvar))) +
            geom_point(aes(text = Title), alpha = 0.5) +
            geom_abline(slope = plotlm()[2], intercept = plotlm()[1],
                        color = "red") +
            labs(
                x = names(choices)[match(input$xvar, choices)],
                y = names(choices)[match(input$yvar, choices)]
            ) +
            theme_bw(base_size = 16)
        ggplotly(gg, tooltip = c("text")) %>%
            config(displayModeBar = FALSE) %>%
            layout(xaxis = list(fixedrange = TRUE),
                   yaxis = list(fixedrange = TRUE))
    })
    
    output$slope <- renderText({
        plotlm()[2]
    })
    
    output$lowerconf <- renderText({
        plotlm()[3]
    })
    
    output$upperconf <- renderText({
        plotlm()[4]
    })
    
})
