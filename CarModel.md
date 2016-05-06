Motor Trend Magazine (MPG Prediction)
========================================================
author: Hector Z.
date: 05/05/2016

Introduction
========================================================

- The purpouse of the application is to predict the fuel consumption (MPG) or in other words, if MPG is affected by the car transmission or not.

- Some analysis was made to get the predictor variables which they be highly correlated besides
the car transmisson.

- The selected predictors were Weigth, Speed and Transmission.


Regression Model
========================================================

- The chosen model was the model with variables having significant P-values, higher Adjusted
R-squared and confident intervals where 0 it's not included.



```r
model <- lm(mpg ~ wt + qsec + am +wt:am, data=mtcars)
```

- The selected model has all the variables as significant, the higher Ajusted R-squared
**0.8804219** and confident intervals.



How it works!
========================================================

 - The application has as input variables the predictors for the model.
 
 - Transmission, it could be Manual or Automatic.
 
 - Weight, the car weight expresed in 1000 tons.
 
 - Speed, which is the 1/4 mille speed expresed in seconds.
 
 - Once all the predictors has been selected, the "Predict" button will generated the MPG predicted
 value.
 
 
 How it works!
========================================================
 - On the right side of the application, we will see as output the predicted valued for MPG based
 on the input values.
 
 - Below the prediction, we can see a table which will be updated everytime a new prediction is generated.
 
 - With the table value, we can easily identify the behaivor of fuel consumption(MPG).
 
 Transmission | Weight  | Speed  |  Mpg
------------- | ------- | ------ | ---------
Manual        |   2     |   10   |  14.01973
Automatic     |   2     |   10   |  19.8164  
 
