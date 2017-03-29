
#Workshop
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

# Fit a linear model with all interaction terms
lm2 = lm(medv ~ crim*rm*indus, data=Boston)

# See coefficient estimates. Find the coefficient associated with 'indus'.
# Has it changed now that we're accounting for interactions between variables?
summary(lm2)

# Now fit a linear model with all variables, but no interactions
lm3 = lm(medv ~ ., data=Boston)

# Find how many of the variables are significant
summary(lm3)

############################### Shrinkage Methods (Ridge and Lasso) #################################
# Note need to delete the intercept term, glmnet automatically adds that in
X = model.matrix(medv ~  . - 1, data=Boston) 
Y = Boston$medv

# Fit a lasso model
lasso = cv.glmnet(X, Y)

# First plot to see the mean-squared error as a function of the shrinkage parameter
plot(lasso)

# Find the coefficients of the optimal model
coef(lasso, s = "lambda.min")

# Find the optimal value of the shrinkage parameter
lasso$lambda.min

# Fit a ridge model
ridge = cv.glmnet(X, Y, alpha = 0)

# Find the coefficients of the optimal model
coef(ridge, s = "lambda.min")

# Save the fitted values of the ridge regression
ridge.fitted = predict(ridge, newx=X, s = "lambda.min")

# Save the fitted values for the lasso model
lasso.fitted = predict(lasso, newx=X, s="lambda.min")

# Compare the first couple values, are they similar?
# Do they match the true median home values?
head(ridge.fitted)
head(lasso.fitted)
head(Boston$medv)

# Plot the fitted values versus the true data
plot(ridge.fitted, Boston$medv)
abline(a=0, b=1)

plot(lasso.fitted, Boston$medv)
abline(a=0, b=1)

# Or we can do this using ggplot, and it will look much nicer
plot_data = data.frame(Boston$medv, lasso.fitted, ridge.fitted)
names(plot_data) = c("MedValue", "Lasso", "Ridge")
p = ggplot(plot_data, aes(y = MedValue))
p + geom_point(aes(x = Lasso), color="Blue") + geom_point(aes(x = Ridge), color="red") + geom_abline(slope=1)


############################### Random Forest #################################

# Fit a random forest using the Boston data
rf = randomForest(medv ~ ., data=Boston, importance=TRUE)

# Plot the mean squared error
plot(rf)

# Find the variable importance - what are the most important variables?
importance(rf)

# Save the predicted values
rf.fitted = predict(rf)

# Plot the predicted values versus the truth
plot(rf.fitted, Boston$medv)
abline(a = 0, b = 1)

# Now let's do this with ggplot and compare all 3 methods
plot_data = data.frame(Boston$medv, lasso.fitted, ridge.fitted, rf.fitted)
names(plot_data) = c("MedValue", "Lasso", "Ridge", "Random.Forest")
p = ggplot(plot_data, aes(y = MedValue))
p + geom_point(aes(x = Lasso), color="Blue") +
  geom_point(aes(x = Ridge), color="red") +
  geom_point(aes(x = Random.Forest), color="green") +
  geom_abline(slope=1) + xlab("Fitted Value") + xlim(-5, 50) + ylim(-5, 50)

# Which looks visually the best? - Random Forest

# Which method has the lowest mse? - Random Forest

############################### Logistic Regression #################################
#Get the Smarket data
library(ISLR)

# Fit the Logistic Regression
glm1 = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket, family=binomial)

# See the options
names(glm1)

# Get the summary and coefficients
summary(glm1)

# Get the fitted values
glm1.fitted = predict(glm1, type="response")

# Create a table and evaluate the error rate
table(glm1.fitted > 0.5, Smarket$Direction)
accuracy = (507) / (457 + 507)

# Now let's separate the data into training and test
train = subset(Smarket, Year < 2005)
test = subset(Smarket, Year == 2005)

# Train the model on the training data
glm2 = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=train, family=binomial)

# Get predictions
glm2.predict = predict(glm2, test, type="response")

# Evaluate accuracy with a table
table(glm2.predict > 0.5, test$Direction)
44 / (34 + 44)

# Evaluate accuracy of the null model - always choosing Up
sum(test$Direction == "Up") / length(test$Direction)
