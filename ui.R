library(shiny)

shinyUI(fluidPage(
    
    titlePanel("BoardGameGeek Top 100 Games"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("xvar", "x-axis variable", choices,
                        selected = "PlayTime"),
            selectInput("yvar", "y-axis variable", choices,
                        selected = "AvgRating"),
            uiOutput("range"),
            actionButton("plot", "Plot"),
            p("Choose variables for the x and y axes, then click \"Plot.\""),
            p(paste0("You can adjust the x range with the slider, ",
                     "then click \"Plot\" again to update the plot.")),
            p("The data come from ",
              a(href = "http://www.boardgamegeek.com", "BoardGameGeek.",
                target = "_blank")),
            p("Data were downloaded on April 4, 2017.")
        ),
        
        mainPanel(
            plotlyOutput("scatterplot", height = "600px", width = "600px"),
            br(), "Slope of the regression line: ",
            strong(textOutput("slope", inline = TRUE)),
            br(),
            em("t"),  " statistic: ",
            strong(textOutput("lowerconf", inline = TRUE)),
            br(),
            em("p"), "-value: ",
            strong(textOutput("upperconf", inline = TRUE))
        )
    )
))
