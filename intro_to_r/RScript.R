# load data
myData = read.csv("~/Dropbox/DataFest17_IntroToR/DFworkshop.csv", comment.char = "", quote = "", stringsAsFactors = FALSE)

# basic data viewing functions
dim(myData)    # "dimension"
names(myData)

# installing and loading packages
install.packages("mosaic")  # "" mandatory
library("mosaic")           # "" optional

# numerical summaries
table(myData$state)
table(myData$type)
summary(myData$var6)
summary(myData$var7)
mean(myData$var6)  # mean
sd(myData$var7)    # standard deviation

## basic eda for a single variable

# histogram
hist(myData$var6)

# histogram with custom bins
hist(myData$var6, breaks = 20)

# plotting options
hist(myData$var6, xlab = "Variable 6", ylab = "counts",
main = "Histogram of Variable 6", breaks = 20)

hist(myData$var6[myData$type == 1], xlab = "Variable 6",
ylab = "counts", main = "Histogram of Variable 6 of type 1")

## basic eda for two variables

# contingency table
table(myData$type, myData$state)

boxplot(myData$var6 ~ myData$type, ylab = "Variable 6",
main = "Boxplot of Variable 6")

boxplot(myData$var6 ~ myData$type, ylab = "Variable 6",
main = "Boxplot of Variable 6")

## basic statistical functionality

# t-tests
t.test(var6 ~ group, data = myData)

t.test(myData$var6 ~ myData$group))

# correlation
# requires "mosaic" package
cor(var6, var7, data = myData)
# will work regardless of whether "mosaic" is loaded
cor(myData$var6, myData$var7)

## basic regression
# perform and store the regression
regression.fit = lm(var7 ~ var6, data = myData) 

# view the results
summary(regression.fit)  

# view the results
summary(regression.fit)  

# nested functions
summary(lm(var7 ~ var6, data=myData))

# plotting a regression model
plot(myData$var6, myData$var7, xlab = "var6", ylab = "var7",
main = "regr. var7 vs. var6")
abline(regression.fit)
