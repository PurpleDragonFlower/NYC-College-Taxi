# Load Libraries
library(mlbench)
library(caret)
library(caretEnsemble)
library("dplyr")
library("tidyr")



dataframe <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2015.csv', header = TRUE)
dataframe <- dataframe[,c(-1,-2,-4,-5,-9,-10,-13:-19)]
dataframe1 <- dataframe[,-6]
dataframe2 <- dataframe[,-5]

# Example of Stacking algorithms
# create submodels
control <- trainControl(method="repeatedcv", number=10, repeats=3, savePredictions=TRUE, classProbs=TRUE)
algorithmList <- c('lda', 'rpart', 'glm', 'knn', 'svmRadial') # 'mlp' multi-layer perceptron (neuralnet), 'nb' naive bayes,   
seed <- 7
set.seed(seed)
models <- caretList(dropoff_longitude~., data=dataframe1, trControl=control, methodList=algorithmList)
results <- resamples(models)
summary(results)
dotplot(results)



write.csv(dataframe1, 
          file = "C:/Users/abhishek.suntwal/Downloads/feb_2015_data.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)
