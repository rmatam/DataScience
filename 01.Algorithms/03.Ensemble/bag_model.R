install.packages("ipred")
library(ipred)

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
training_set=sample(100,67,FALSE)
train<-data[training_set,]
train
test<-data[(1:100)[-training_set],]
test

#constructing a model using bagging
bag_model=bagging(z~x+y, data = train)
#bag_model=bagging(z~x+y, data = train, 

#summarize model
summary(bag_model)

#summarize the tables
bag_model$OOB
print(bag_model)

#plot the model(tree vs errors)
#plot(bag_model)

#make predictions
bag_predictions<-predict(bag_model,test[,1:2])

#summarize the predictions
table(bag_predictions,test$z)

