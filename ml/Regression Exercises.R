# Workshop

# install any packages that you don't have
install.packages("MASS")
install.packages("glmnet")
install.packages("randomForest")
install.packages("ggplot2")

# Load the libraries after installation
library(MASS)
library(glmnet)
library(randomForest)
library(ggplot2)

################################# Basic Linear Models ###################################

# Learn about the Boston Dataset
?Boston

# n = 506, p = 14, so right now we're probably not in an 'overfitting' situation
# Some of the variables are categorical, so they are actually more than one variable

# Fit a linear model with a few variables
lm1 = lm(medv ~ crim + rm + indus, data=Boston)

# See coefficient estimates, and significance levels.
# Find the coefficient associated with 'indus', or how industrial the neighborhood is
summary(lm1)

## To see more information contained in the linear model use:
names(lm1)
# And to access that information use the '$' operator:
lm1$coefficients

##### Questions:
# 1. What is the coefficient associated with 'Indus' or the level of industrialization?



# 2. How many of the variables are statistically significant?



# 3. What fraction of the variation in 'medv' is explained by this model (i.e. the r-squared value)?

# Fit a linear model with all interaction terms
lm2 = lm()

# See coefficient estimates.
##### Questions:
# 1. What is the coefficient value associated with ‘indus’?
# 2. How has it changed from the previous model?


# Now fit a linear model with all variables, but no interactions
lm3 = lm()

##### Questions:
# 1. What fraction of the variation in ‘medv’ is explained by this model? Why is this higher than in model 1?



# 2. How many of the variables are considered statistically significant?


##### Extra Exercises:



############################### Shrinkage Methods (Ridge and Lasso) #################################

# Putting the data into matrices instead of data frame, as required by glmnet
# Note that including '-1' in the formula deletes the intercept
# Need to delete the intercept term, glmnet automatically adds that in
X = model.matrix(medv ~  . - 1, data=Boston) 
Y = Boston$medv

# Fit a lasso model using cross validation
lasso = cv.glmnet(X, Y)

# First plot to see the mean-squared error as a function of the shrinkage parameter
plot(lasso)

# Find the coefficients of the optimal model
coef(lasso, s = "lambda.min")

##### Questions:
# 1. Which variables have been removed from the model?


# 2. Do these correspond to the statistically insignificant variables from the regular linear model?


# 3. What is the optimal value of the shrinkage parameter?
# Hint: use names(lasso) to find the information associated with the model


# Fit a ridge model
ridge = cv.glmnet(X, Y, alpha = 0)

##### Questions
# 1. Look at the coefficients of the optimal model. Have any covariates been eliminated from the model?



# 2. Save the fitted values of the ridge to the Boston data. What are the first 2 fitted values?

ridge.fitted = predict(ridge, newx=X, s = "lambda.min")
# Note that we are using the 'predict' function - if we set newx to be entirely new data, it would created predicted values
# Save the fitted values of the ridge regression


# 3. Now save the fitted values from the lasso model using the 'predict' function

# 4. Compare the first couple of values to the real data. How do the predictions look?

# 5. Plot the fitted values versus the true home values
# Add in a straight y = x line to the plot, which is where the fitted value actually equals the truth


# Challenge: Plot the fitted values from the lasso and ridge versus the true home values on the same plot
# Compare the two - are they significantly different in this scenario?



############################### Random Forest #################################

# Fit a random forest using the Boston data
rf = randomForest(medv ~ ., data=Boston, importance=TRUE)

# Plot the mean squared error
plot(rf)


##### Questions:
# 1. What are the most important variables?



# 2. Save the fitted values and plot them versus the true 'medv' values in the Boston dataset
# Hint: use the predict function again.



# 3. What is the mean squared error for the random forest with all 500 trees?



####### Model comparison ########

# Task: Plot all the fitted values from the lasso, ridge, and random forest models against the median home value
# Add in an x=y line to show an ideal model fit

##### Questions:

# Which looks visually the best? - Random Forest

# Which method has the lowest mse? - Random Forest


### If you're stuck on this task, then this code will help
### Here is ggplot code: You may use it, but note:
# lasso.fitted, ridge.fitted, and rf.fitted are my names for the fitted values from the 3 models
# You may need to change those in your plots

#plot_data = data.frame(Boston$medv, lasso.fitted, ridge.fitted, rf.fitted)
#names(plot_data) = c("MedValue", "Lasso", "Ridge", "Random.Forest")
#p = ggplot(plot_data, aes(y = MedValue))
#p + geom_point(aes(x = Lasso), color="Blue") +
#  geom_point(aes(x = Ridge), color="red") +
#  geom_point(aes(x = Random.Forest), color="green") +
#  geom_abline(slope=1) + xlab("Fitted Value") + xlim(-5, 50) + ylim(-5, 50)



############################### Logistic Regression #################################
#Get the Smarket data
install.packages("ISLR")
library(ISLR)

# Fit the Logistic Regression
glm1 = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket, family=binomial)

# See the available information contained in this model
names(glm1)

# Get the summary and coefficients
summary(glm1)


###### Questions:

# 1. What are the first 3 fitted values (these will be probabilities)
# What are the first 3 true directions in the stock market?

# 2. Create a table of the predicted decision versus the truth, evaluate the accuracy rate of the predictions
# That the market will increase
# Hint: Use the table function
# You will also need to use the logical symbol '>' or '<'

# Get the fitted values
glm1.fitted = predict(glm1, type="response")

# Create a table and evaluate the error rate



###### Task 2: Actually make some predictions, rather than just look at the data that was used to fit the model!
# This is crucial if we want to get a sense of how well the model will perform on real future data
# A model will always perform better on the data that was used to fit the model, than truely new data (of course)!



# Now let's separate the data into training and test datasets
train = subset(Smarket, Year < 2005)
test = subset(Smarket, Year == 2005)

#### Tasks:

# 1. Train the model on the training data



# 2. Get predictions for the test data (remember to use the predict function, but feed in 'test' data)

# 3. Evaluate accuracy with a table


# 4. Compare this accuracy to the accuracy of the null model. The null model is always choosing Up
# In other words, what fraction of market changes are positive? Could we beat the model just by always choosing 'up'?
