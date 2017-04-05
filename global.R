library(plotly)

bggdata <- read.csv("bgg100_20170404.csv", stringsAsFactors = FALSE)

choices <- c(
    "Year" = "Year",
    "Minimum # of players" = "MinPlayers",
    "Maximum # of players" = "MaxPlayers",
    "Suggested # of players" = "SuggestedPlayers",
    "Suggested minimum age" = "SuggestedAge",
    "Average play time (minutes)" = "PlayTime",
    "Average rating" = "AvgRating",
    "\"Geek\" Rating" = "GeekRating"
)
