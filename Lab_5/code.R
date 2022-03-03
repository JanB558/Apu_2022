setwd("G:/ATH/Apu/LAB/LAB5/Workspace")

#install.packages("mlr")
#install.packages("party")
#install.packages("dplyr")
library("dplyr")
library("party")
library("mlr")
library("MASS")
library("C50")
library("rpart")

train <- force(iris)
summarizeColumns(train)

#head(train)

#CART

#podzial na dane testowe i treningowe
.data <- c("training", "test")
#head(.data)

splitData <-  split(train, .data)
#head(splitData)

tree <- rpart(Species ~ ., splitData$training)
plot(tree)

tree
summary(tree)

#C5.0
#na podstawie species
model <- C5.0(train[, -5], train[, 5], rules = TRUE)

model

summary(model)
