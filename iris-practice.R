# Loading Iris dataset
iris <- read.csv(file.choose())

# View the data
View(iris)

# Head(first 5 data) / Tail(last 5 data)
head(iris,5)
tail(iris,5)

# Summary(min, median, mean, max no of rows etc)
summary(iris)
# Summary with $ which is filtering / selecting specific variable from data
summary(iris$Sepal.Length)

# Check to see if there is any missing data
sum(is.na(iris))

# skimr -> expands on summary by providing larger set of statics
install.packages("skimr")
library(skimr)

# Performing skim to display summary statistics
skim(iris)

# Grouping the data by species then performing skim
iris %>%
  dplyr::group_by(Species) %>%
  skim()

# Data Visualization with R base plot

# Panel Plot
plot(iris)
plot(iris, col="red") # turns column into red from the default color

# Scatter Plot
# Sepal width in X axis & Sepal length in Y axis
plot(iris$Sepal.Width, iris$Sepal.Length)
plot(iris$Sepal.Width, iris$Sepal.Length, col="red")
# Changing the label for x & y axis
plot(iris$Sepal.Width, iris$Sepal.Length, col="green",xlab = "Sepal Width",ylab="Sepal Length")

# Histogram Plot
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, col="orange")

# Feature Plot -> shows vox plots for 4 var as func of 3 classes
install.packages('caret', dependencies = TRUE)
library(caret)
featurePlot(x = iris[,1:4], y = iris$Species, plot = "box",strip=strip.custom(par.strip.text=list(cex=.7)),scales = list(x = list(relation="free"), y = list(relation="free")))

# To achieve reproducible model; set the random seed nmber 
set.seed(100)

# Performs random split of the data set 
TraningIndex <- createDataPartition(iris$Species, p=0.8,list=FALSE)
TraningSet <- iris[TraningIndex,] #Training set
TestingTest <- iris[-TraningIndex,] #Test set



















