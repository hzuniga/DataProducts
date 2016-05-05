
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# Load cars dataset and basic data manipulation in order to apply a multiple regression model.
data(mtcars)
mtcars$am <- factor(mtcars$am)
attach(mtcars)
# Generate a regression model; based on past calculations, this is the best option(predictors).
model <- lm(mpg ~ wt + qsec + am, data=mtcars)


shinyServer(function(input, output) {
   
  # Set the variable as reactive variable
  values <- reactiveValues()
  # Get the input values as a reactive values.
  values$df <- data.frame(Transmission = numeric(0), Weigth = numeric(0),
                          Speed = numeric(0),Mpg=numeric(0))
  
  # Once the action button is pressed, then get the input values and use them as input for the
  # lm prediction model
  observeEvent(input$go,{
    newdata <- data.frame(wt=input$wt,qsec=input$qsec,am=input$trans)
    newvalue <- predict(model,newdata)
    # Get the predicted value that will be displayed in the UI
    output$mpg <- renderText({newvalue})
    
    # Do a basic string translation for transmmission value
    if (input$trans == 1){ ma <- "Automatic" } else { ma <- "Manual" }
    
    # Add the input values used for the prediction and the mpg predicted value to a table
    isolate(values$df[nrow(values$df) + 1,] <- c(ma,input$wt, input$qsec,newvalue))
    
    # Display the updated table in the UI
    output$table <- renderTable({values$df})
  })
  
  
    
})
