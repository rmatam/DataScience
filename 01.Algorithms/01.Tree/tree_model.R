install.packages("rpart")
library(rpart)

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

#constructing a model using CART
tree_model=rpart(z~x+y,data = train)
tree_model

#summarize model
summary(tree_model)

#plot the model
x11()
plot(tree_model)
text(tree_model,use.n = TRUE)
