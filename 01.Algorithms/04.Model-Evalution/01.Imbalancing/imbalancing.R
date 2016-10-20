install.packages("ROSE")
library(ROSE)
data(hacide)
str(hacide.train)
table(hacide.train$cls)
prop.table(table(hacide.train$cls))
library(rpart)
treeimb<-rpart(cls~.,data = hacide.train)
pred.treeimb<-predict(treeimb,newdata = hacide.test)
accuracy.meas(hacide.test$cls,pred.treeimb[,2])
roc.curve(hacide.test$cls,pred.treeimb[,2],plotit = FALSE)

#over sampling
data_balanced_over<-ovun.sample(cls~.,data = hacide.train ,method = "over", N = 1960)$data
table(data_balanced_over$cls)

#under sampling
data_balanced_under<-ovun.sample(cls~.,data = hacide.train ,method = "under", N = 40, seed = 1)$data
table(data_balanced_under$cls)

#both
# p refers to probability of postive class in newly generated sample
data_balanced_both<-ovun.sample(cls~.,data = hacide.train ,method = "both", p = 0.5,N = 1000, seed = 1)$data
table(data_balanced_both$cls)

#build decision tree models

#tree.rose <- rpart(cls ~ ., data = data.rose)
tree.over <- rpart(cls ~ ., data = data_balanced_over)
tree.under <- rpart(cls ~ ., data = data_balanced_under)
tree.both <- rpart(cls ~ ., data = data_balanced_both)

#make predictions on unseen data
pred.tree.over<-predict(tree.over, newdata = hacide.test)
pred.tree.under<-predict(tree.under, newdata = hacide.test)
pred.tree.both<-predict(tree.both, newdata = hacide.test)

#capture ROC metric


#AUC Oversampling
#roc.curve(hacide.test$cls, pred.tree.over[,2])
#Area under the curve (AUC): 0.798

#AUC Undersampling
roc.curve(hacide.test$cls, pred.tree.under[,2])
#Area under the curve (AUC): 0.867

#AUC Both
roc.curve(hacide.test$cls, pred.tree.both[,2])
#Area under the curve (AUC): 0.798  

ROSE.holdout <- ROSE.eval(cls ~ ., data = hacide.train, learner = rpart, method.assess = "holdout", extr.pred = function(obj)obj[,2], seed = 1)
ROSE.holdout
  
