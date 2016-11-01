# ensure results are repeatable
set.seed(7)
install.packages("pROC")
# load the library
library(mlbench)
library(caret)
# load the dataset
data(PimaIndiansDiabetes)
PimaIndiansDiabetes
dim(PimaIndiansDiabetes)
# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
control$savePredictions

# train the model
model <- train(diabetes~., data=PimaIndiansDiabetes, method="lvq", preProcess="scale", trControl=control)
# estimate variable importance
importance <- varImp(model, scale=FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)
