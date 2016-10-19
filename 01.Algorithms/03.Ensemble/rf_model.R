install.packages("randomForest")
library(randomForest)

#create a function that created a 2d classification problem
classification<-function(){
  x<-c(rnorm(50,mean = 0),rnorm(50,mean = 4))
  y<-c(rnorm(50,mean = 4),rnorm(50,mean = 0))
  z<-c(rep("1",50),rep("0",50))
  data<-data.frame(x,y,z)
}

#get data
data<-classification()

#split data into train and test(67%33%)
training_set=sample(100,67)
train<-data[training_set,]
train
test<-data[(1:100)[-training_set],]
test

#constructing a model using Navie bayes
rf_model=randomForest(z~.,data = train)
rf_model

#summarize model
summary(rf_model)

#summarize the tables
rf_model$ntree
rf_model$forest$ndbigtree
print(rf_model)

#plot the model(tree vs errors)
plot(rf_model)

#make predictions
rf_predictions<-predict(rf_model,test[,1:2])

#summarize the predictions
table(rf_predictions,test$z)

