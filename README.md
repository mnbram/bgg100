# BoardGameGeek Top 100 Games
## Plotting and linear regression

A Shiny app for simple investigation of [BoardGameGeek](http://www.boardgamegeek.com)'s 100 highest-rated games.

Data for the top 100 games were downloaded from BoardGameGeek on April 4, 2017 using the [BGG XML API2](https://boardgamegeek.com/wiki/page/BGG_XML_API2).

Available variables for plotting are:
* Title
* Year
* Minimum # of players
* Maximum # of players
* Suggested # of players
* Suggested minimum age
* Average play time (minutes)
* Average rating
* "Geek" Rating

The "Geek" Rating is a Bayesian average that attempts to correct for bias in the ratings for newer games.

Suggested number of players is derived from a user poll. Ties are possible. In the event of a tie between adjacent integer numbers of players, the median is used here. In the event of a tie between non-adjacent integers, the lowest tied number is used.

Please note that the linear models in the Shiny app are extremely basic and do not account for problems such as heteroscedasticity. Plots and regressions are for investigatory purposes only and *p*-values from these models should not be taken as endorsement of actual relationships.
