setwd("G:/ATH/Apu/LAB/LAB5/Workspace")

#load packages
#install.packages("rFerns")
library("rFerns")
#install.packages("randomForestSRC")
library("randomForestSRC")
library("mlr")

#load data
data <- read.csv("smartfony_data.csv")
data
data <- data[3:9]
data
data[, 7] <- factor(data[, 7])

#set task
task = makeClassifTask(
  id = deparse(substitute(data)), 
  data,                              
  target = "ocena",                  
  weights = NULL, 
  blocking = NULL, 
  coordinates = NULL,
  positive = NA_character_,
  fixup.data = "warn",
  check.data = TRUE
)

# set teachers - check algorithms
lrns <- makeLearners(
  c(
    "lda",
    "rpart",
    "C50",
    "rFerns",
    "randomForestSRC"
  ),
  type = "classif"
)

#define test and run teachers
bench <- benchmark(
  learners = lrns,
  tasks = task,
  resamplings = cv5
)

#check results - mean - error rate
bench
