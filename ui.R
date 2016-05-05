
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Motor Trend Magazine - Car Data"),

  # Application brief description and expectations
  tags$h5("Based on a regresion model, a car fuel efficiency is affected by the Weigth, Speed and Transmission."),
  tags$h5("Select input values to get a prediction."),
  
  # SideBar template
  sidebarLayout(
    # Show the input options for the MPG prediction model
    sidebarPanel(
      
      # Radio Buttons for car transmission
      radioButtons(inputId="trans",label="Transmission Type",choices=c("Manual"="0","Automatic"="1")),
      # Slider for the car weigth
      sliderInput("wt","Weigth (1000 lbs):",min = 1,max = 8,value = 2),
      # Slider for the car speed
      sliderInput("qsec","1/4 Mile Time (sec):",min =0,max = 100,value = 10),
      # Action button to reactive due the calculation or prediction for the car MPG
      actionButton(inputId="go",label="Predict")
    ),

    # Show the predicted value for MPG and a table for all the predicted values been generated
    # updated everytinme the action button is selected.
    mainPanel(
      tags$h3("Predicted Fuel Consumption (MPG):"),
      tags$b(h2(textOutput(outputId="mpg"))),
      tags$h3("Historic Predicted Values"),
      #tags$h5("Manual = 0 , Automatic = 1"),
      tableOutput(outputId="table")
    )
  )
))
