install.packages("e1071")
library(e1071)

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
bayes_model=rpart(z~.,data = train)
bayes_model

#summarize model
summary(bayes_model)

#plot the model
x11()
plot(bayes_model)
text(bayes_model,use.n = TRUE)

#summarize the tables
bayes_model$cptable
bayes_model$frame
bayes_model$splits

#make predictions
bayes_predictions<-predict(bayes_model,test[,1:3])

#summarize the predictions
table(bayes_predictions,test$z)
