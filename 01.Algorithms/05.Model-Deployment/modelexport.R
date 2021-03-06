library(rpart)
library(ggplot2)
library(caret)
setwd("E:/kaggle/titanic/data/")
titanic_train = read.csv("train.csv")
dim(titanic_train)
str(titanic_train)
titanic_train$Survived = as.factor(titanic_train$Survived)
titanic_train$Pclass = as.factor(titanic_train$Pclass)
titanic_train$Name = as.character(titanic_train$Name)

set.seed(50)
tr_ctrl = trainControl(method="cv", number = 10)

tree_model1 = train(Survived~Sex + Pclass + Embarked, titanic_train, method="rpart", trControl = tr_ctrl)
tree_model1
tree_model1$finalModel

rm(titanic_train)
rm(tr_ctrl)
save.image("tree-model.RData")

