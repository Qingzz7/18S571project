# MATH 571 section 3 regression
# Data used is clean data set in csv format from previous step
# Multiple regression models are applied
# yuqing zhao, March 27,2018


# read data
# assuming loss in the water processing is tiny. we use enfluent flow data to simulate input flow data

#df2=read.csv('completeMwrd_03_18_2018.csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)
#df=read.csv('ALL_MWRD (version 1).csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)
df3=read.csv('completeMwrd_03_25_2018.csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)
summary(df3)
dfn=df3[,-(1:2)]  
summary(dfn)  

#dfn=sapply(df[,-1],as.numeric)
#dfn=na.omit(dfn)
#dfn=as.data.frame(dfn)

# TODO
# split data set into two groups: location 1-6 and location 7-8 
# dfn1=
# dfn2=

# Normalize whole dataset for future models since some models prefer standardized predictors
dfn=data.frame(scale(dfn))  
  
# split training and testing data set
library('caret')
set.seed(0)
inTrain <- createDataPartition(y = dfn[,'TKN'], p = 0.8, list = FALSE)
train <- dfn[inTrain,]
test <- dfn[-inTrain,]
stopifnot(nrow(train) + nrow(test) == nrow(dfn))
x.train=train[,-6]
y.train=train[,6]
x.test=test[,-6]
y.test=test[,6]



# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)

# models related information: http://topepo.github.io/caret/train-models-by-tag.html

# Basic linear model
lm2 =glm(TKN ~., data = train)
par(mfrow=c(2,2)) #combine separate boxplots into one figure 
plot(lm2)

lm_model=train(TKN ~., data=train, method="lm", trControl=controlParameter)
lm_pred=predict(lm_model,test)

library(leaps)
# All subset linear regression
# allsub_model=train(TKN ~., data=train, method = ' ', trControl=controlParameter)
# allsub_pred=predict(allsub_model,test)

# Linear regression model with Forward selection
forward_model=train(TKN ~., data=train, method = 'leapForward', trControl=controlParameter)
forward_pred=predict(forward_model,test)

# Linear regression model with Backward selection
backward_model=train(TKN ~., data=train, method = 'leapBackward', trControl=controlParameter)
backward_pred=predict(backward_model,test)

# Linear regression model with Stepwise Selection
step_model=train(TKN ~., data=train, method = 'leapSeq', trControl=controlParameter)
step_pred=predict(step_model,test)


library(Matrix)
library(foreach)
library(glmnet)

# The lasso
lassoGrid=expand.grid(alpha=1,lambda=c(0,5,0.0001))
lasso_model=train(TKN ~., data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=lassoGrid)
#lasso_model=cv.glmnet(x.train,y.train,type.measure="mse", alpha=1,family="gaussian")
lasso_pred=predict(lasso_model,test)

# Ridge Regression
ridgeGrid=expand.grid(alpha=0,lambda=c(0,5,0.0001))
ridge_model=train(TKN ~., data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=ridgeGrid)
#ridge_model=cv.glmnet(x.train,y.train,type.measure="mse", alpha=0,family="gaussian")
ridge_pred=predict(ridge_model,test)


# Elasticnet
elas_model=train(TKN ~., data=train, method = 'glmnet', trControl=controlParameter)
#elas_model=cv.glmnet(x.train,y.train,type.measure="mse",family="gaussian")
elas_pred=predict(elas_model,test)

# predictions for stepwise and lm is the same

# calculate the MSE of test data for each model to evaluate its performance
lm_mse=mean((y.test - lm_pred)**2)
#allsub_mse=mean((y.test - allsub_pred)**2)
forward_mse=mean((y.test - forward_pred)**2)
backward_mse=mean((y.test - backward_pred)**2)
step_mse=mean((y.test - step_pred)**2)
lasso_mse=mean((y.test - lasso_pred)**2)
ridge_mse=mean((y.test - ridge_pred)**2)
elas_mse=mean((y.test - elas_pred)**2)



# calculate the R**2 of test data for each model to evaluate its performance
lm_r2=sum((lm_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
#allsub_mse=sum((allsub_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
forward_mse=sum((forward_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
backward_mse=sum((backward_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
step_r2=sum((step_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
lasso_r2=sum((lasso_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
ridge_r2=sum((ridge_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
lm_r2=sum((lm_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)
elas_r2=sum((elas_pred - mean(y.test))**2)/sum((y.test - mean(y.test))**2)





# method 2 ???
library(boot)
train2=as.data.frame(train)
set.seed(0)

lm2 =glm(TKN ~., data = train2)
plot(lm2)
glm2lm=cv.glm(train2,lm2,K=10)
lm_prederr=glm2lm$delta[1]
#lm_pred2=predict(glm2lm, newx=x.test)
#lm_mse2=mean((y.test - lm_pred2)**2)

library(glmnet)

glmnet2lasso=cv.glmnet(as.matrix(x.train),y.train,alpha=1,nfolds = 10)
glmnet2lassom=glmnet(as.matrix(x.train),y.train,alpha=1)
lasso_pred2=predict(glmnet2lassom,s=glmnet2lasso$lambda.min, newx=as.matrix(x.test))
lasso_mse2=mean((y.test - lasso_pred2)**2)


glmnet2ridge=cv.glmnet(as.matrix(x.train),y.train,alpha=0,nfolds = 10)
glmnet2ridgem=glmnet(as.matrix(x.train),y.train,alpha=0)
ridge_pred2=predict(glmnet2ridgem,s=glmnet2ridge$lambda.min, newx=as.matrix(x.test))
ridge_mse2=mean((y.test - ridge_pred2)**2)



glmnet2elas=cv.glmnet(as.matrix(x.train),y.train,nfolds = 10)
glmnet2elasm=glmnet(as.matrix(x.train),y.train)
elas_pred2=predict(glmnet2elasm,s=glmnet2ridge$lambda.min, newx=as.matrix(x.test))
elas_mse2=mean((y.test - elas_pred2)**2)


