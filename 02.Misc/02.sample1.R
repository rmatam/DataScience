setwd("F:\\Rpractise")
practise_train=read.table("iris.txt",sep = ",")
practise_train
dim(practise_train)
str(practise_train)
dir(dir())
dir()
getwd()
function1<- function(x){
 
  y=2*x+3
  z=y*x
}

function1()
a=function1(2)
a
b=function1(3)
b
help("read.csv")
practise_train$V1
names(practise_train)
head(practise_train)
tail(practise_train)
attributes(practise_train)
nlevels(practise_train)
help("read.ftable")
help("read.fwf")
ls()
mean(practise_train$V1)
typeof(a)
typeof(practise_train$V1)
summary(practise_train)
x<-seq(-20,20,by=0.5)
x
y<-dchisq(x,df = 12)
print(y)
plot(x,y)
help("stripchart")
stripchart(x, method = "stack")
boxplot(x)
help("boxplot")
boxplot(y~x)

#correlation between two variables
x<- rnorm(100,mean = 2,sd = 1)
y<-2.5*x+ 1.0 +rnorm(100,mean = 4,sd = 2)
print(x)
print(y)
cor(x,y)
plot(x,y, xlab = "Independent",ylab = "dependent", main = "Random Stuff")
