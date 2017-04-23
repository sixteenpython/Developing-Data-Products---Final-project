#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

pal = c("pink", "lightgreen", "lightblue", "grey", "black")

shinyServer(function(input, output) {
  
  output$deathcount <- renderPrint({sum(VADeaths[,input$population_group])})
  output$finalPlot <- renderPlot({
    
    barplot(VADeaths[,input$population_group], 
            main = input$population_group,
            ylab = "Deaths per 1,000 Population",
            ylim = c(0, 100),
            xlab = "Age Group",
            col = pal)
  })
  
})