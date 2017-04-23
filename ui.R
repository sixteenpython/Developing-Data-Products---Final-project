#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

# Seting the overall GUI

shinyUI(
  
  fluidPage(    
    
    titlePanel("VA Deaths by Age & Population Groups per 1,000 Population"),
    
    sidebarLayout(      
      
      sidebarPanel(
        selectInput("population_group", "Select Population Group...", 
                    choices=colnames(VADeaths)),
        hr(),
        helpText("This shiny app shows the number of Deaths by Age & Population Group per 1,000 Population in Virgina in in 1940. 
                 To update the graph, select the desired Population Group using the dropdown above. 
                 The chart will automatically update to show the # of Dealths per 1,000 Population, grouped by Age Group,
                 Additionally, the total number of Deaths for the selected Population Group 
                 can be seen below the chart.
                 
                 For further reference, the ui.R & server.R scripts can be found here: https://github.com/AlanGaunt/Developing-Data-Products")
        ),
      
      mainPanel(
        plotOutput("finalPlot"),
        h4('Total Number of Deaths for Population Grouup'),
        verbatimTextOutput("deathcount")
      )
      
        )
      )
  )