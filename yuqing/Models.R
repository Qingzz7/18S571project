library('rvest')
library('tidyr')
library('caret')
library('Matrix')
library('foreach')
library('glmnet')
library('pls')

#Create model form function
createModelFormula <- function(TARGET, XVARS, includeIntercept = TRUE){
  if(includeIntercept){
    modelForm <- as.formula(paste(TARGET, "~", paste(XVARS, collapse = '+ ')))
  } else {
    modelForm <- as.formula(paste(TARGET, "~", paste( XVARS, collapse = '+ '), -1))
  }
  return(modelForm)
}
require(miscTools)

adjR2_test<-function (pred,y.test){
  r2=miscTools::rSquared(y.test,resid = y.test-pred)
  n<-nrow(x.test)
  q<-ncol(x.test)  
  adjr2<-1-((1-r2^2)*(n-1)/(n-q))
}
get_Out<-function(data=water.data,row){
 outlier<- water.data[c(row-1,row,row+1),]
  
}
#Global Variables
TARGET<-'BOD5'
XVARS<- c("TKN", 'NH3.N','P.TOT', 'SS', 'FLOW', 'Rainfall', 'Location','Season','Pop.density')
modelForm<-createModelFormula(TARGET,XVARS)


#Read In Data
setwd('~/Documents/GitHub/18S571project/completedata')
water.data.raw<-read.csv('completeMwrd_BOD5.csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)
rownames(water.data.raw)<-water.data.raw$X
water.data<-water.data.raw[,-1]
head(water.data)
#Separate Date in 3 columns Year, Month, Day
water.data<-separate(water.data,DATE,c('Year','Month','Day'),sep='-',remove=TRUE)
head(water.data)
water.data<-water.data[,-c(1,3)]

#Convert to Numeric for creating season variable
water.data$Month<-as.numeric(water.data$Month)
#Convert Location to Factor
water.data$Location<-as.factor(water.data$Location)

#Create Season Variable
Season<-rep(0,nrow(water.data))
Season[water.data$Month>=1&water.data$Month<=3]<-1 #Winter
Season[water.data$Month>=4&water.data$Month<=6]<-2 #Spring
Season[water.data$Month>=7&water.data$Month<=9]<-3 #Summer
Season[water.data$Month>=10&water.data$Month<=12]<-4 #Fall

#Create Data frame, Make season and turn month back to factor for use in models
water.data<-data.frame(water.data,'Season'=as.factor(Season))
#water.data$Pop.density<-sapply(water.data$Pop.density,as.factor)
#Get rid of numeric month data
water.data<-water.data[,-1]
head(water.data)
#Check all the columns are the correct data type
sapply(water.data,class)  

#Cor Matrix
c=cor(water.data[,c(1:7,9)])
corrplot::corrplot(c)

#Scale Data
water.data.scale<-scale(water.data[,c(1:7,9)],center=FALSE)
water.data.scale<-data.frame('Location'=water.data$Location,'Season'=water.data$Season,water.data.scale)
head(water.data.scale)
#Check data type
sapply(water.data.scale,class)
dim(water.data.scale)
#Create Training and Test Set
set.seed(571)
inTrain<-createDataPartition(y=water.data.scale[,TARGET],p=0.8,list=FALSE)
train<-water.data.scale[inTrain,]
test<-water.data.scale[-inTrain,]
y.test<-test[,TARGET]
x.test<-test[,XVARS]
# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)


# Models
set.seed(571)
lm_model<-train(modelForm,data=train,method='lm',trControl=controlParameter)

set.seed(571)
forward_model=train(modelForm,data=train,method='leapForward',trControl=controlParameter)

set.seed(571)
backward_model=train(modelForm,data=train,method='leapBackward',trControl=controlParameter)

set.seed(571)
step_model=train(modelForm,data=train,method='leapSeq',trControl=controlParameter)

set.seed(571)
lassoGrid=expand.grid(alpha=1,lambda=c(0,5,0.0001))
lasso_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=lassoGrid)

set.seed(571)
ridgeGrid=expand.grid(alpha=0,lambda=c(0,5,0.0001))
ridge_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=ridgeGrid)

set.seed(571)
elas_model=train(modelForm, data=train, method = 'glmnet', trControl=controlParameter)

set.seed(571)
pcr_model<-train(modelForm,data=train, method='pcr',trControl=controlParameter)

set.seed(571)
random200_model<-train(modelForm,data=train,method='rf',ntree=200,trControl=controlParameter)
saveRDS(random200_model,file="random200_model.rds")
random200_model<-readRDS("random200_model.rds")
set.seed(571)
xgblinear<-train(modelForm,data=train,method='xgbLinear',trControl=controlParameter,tunelength=10)
saveRDS(xgblinear,file="xgbLinear.rds")
xgblinear<-readRDS("xgbLinear.rds")
#Prediction
lm_pred<-predict(lm_model,test)
forward_pred<-predict(forward_model,test)
backward_pred<-predict(backward_model,test)
step_pred<-predict(step_model,test)
lasso_pred<-predict(lasso_model,test)
ridge_pred<-predict(ridge_model,test)
elas_pred<-predict(elas_model,test)
pcr_pred<-predict(pcr_model,test)
xgblinear_pred<-predict(xgblinear,test)
random200_pred<-predict(random200_model,test)

# calculate the MSE of test data for each model to evaluate its performance
lm_mse<-mean((y.test - lm_pred)^2)
forward_mse<-mean((y.test - forward_pred)^2)
backward_mse<-mean((y.test - backward_pred)^2)
step_mse<-mean((y.test - step_pred)^2)
lasso_mse<-mean((y.test - lasso_pred)^2)
ridge_mse<-mean((y.test - ridge_pred)^2)
elas_mse<-mean((y.test - elas_pred)^2)
pcr_mse<-mean((y.test-pcr_pred)^2)
xgblinear_mse<-mean((y.test-xgblinear_pred)^2)
random200_mse<-mean((y.test-random200_pred)^2)

#AdjR2
lm_adjR2<-adjR2_test(lm_pred,y.test)
forward_adjR2<-adjR2_test(forward_pred,y.test)
backward_adjR2<-adjR2_test(backward_pred,y.test)
step_adjR2<-adjR2_test(step_pred,y.test)
lasso_adjR2<-adjR2_test(lasso_pred,y.test)
ridge_adjR2<-adjR2_test(ridge_pred,y.test)
elas_adjR2<-adjR2_test(elas_pred,y.test)
pcr_adjR2<-adjR2_test(pcr_pred,y.test)
xgblinear_adjR2<-adjR2_test(xgblinear_pred,y.test)
random200_adjR2<-adjR2_test(random200_pred,y.test)
#Create Vectors for mse and adjR2

adjR2<-c(lm_adjR2,forward_adjR2,backward_adjR2,step_adjR2,lasso_adjR2,ridge_adjR2,elas_adjR2,pcr_adjR2,xgblinear_adjR2,random200_adjR2)
mse<-c(lm_mse,forward_mse,backward_mse,step_mse,lasso_mse,ridge_mse,elas_mse,pcr_mse,xgblinear_mse,random200_mse)
#Dataframe for them
modelNames<-c("Linear","Forward","Backward","StepWise","Lasso","Ridge","Elastic","Principal Component","Xtreme Gradient Boosting","Random Forest")
Performance<-data.frame("AdjR^2"=adjR2,"MSE"=mse)
rownames(Performance)<-modelNames
#Sort by MSE
Performance.sorted<-Performance[order(-Performance$AdjR.2,-Performance$MSE),]
Performance.sorted

#Data with a square root transformation
head(water.data.scale)
dim(water.data.scale)
head(water.data)
water.data.scale.sqrt<-data.frame(water.data.scale[,1:2],sqrt(water.data.scale[,c(3:10)]))
head(water.data.scale.sqrt)

set.seed(571)
inTrain<-createDataPartition(y=water.data.scale.sqrt[,TARGET],p=0.8,list=FALSE)
train<-water.data.scale.sqrt[inTrain,]
test<-water.data.scale.sqrt[-inTrain,]
y.test<-test[,TARGET]
x.test<-test[,XVARS]

# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)
# Models
lm0<-lm(modelForm,data=train)
par(mfrow=c(2,2))
plot(lm0)

set.seed(571)
lm_model.sqrt<-train(modelForm,data=train,method='lm',trControl=controlParameter)
set.seed(571)
forward_model.sqrt<-train(modelForm,data=train,method='leapForward',trControl=controlParameter)
set.seed(571)
backward_model.sqrt<-train(modelForm,data=train,method='leapBackward',trControl=controlParameter)
set.seed(571)
step_model.sqrt<-train(modelForm,data=train,method='leapSeq',trControl=controlParameter)
set.seed(571)
lassoGrid.sqrt<-expand.grid(alpha=1,lambda=c(0,5,0.0001))
lasso_model.sqrt=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=lassoGrid)
set.seed(571)
ridgeGrid.sqrt<-expand.grid(alpha=0,lambda=c(0,5,0.0001))
ridge_model.sqrt<-train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=ridgeGrid)
set.seed(571)
elas_model.sqrt<-train(modelForm, data=train, method = 'glmnet', trControl=controlParameter)
set.seed(571)
pcr_model.sqrt<-train(modelForm,data=train, method='pcr',trControl=controlParameter)

set.seed(571)
xgblinear.sqrt<-train(modelForm,data=train,method='xgbLinear',trControl=controlParameter,tunelength=10)
saveRDS(xgblinear.sqrt,file="xgblinear_sqrt.rds")
xgbLinear_model.sqrt<-readRDS("xgblinear_sqrt.rds")

set.seed(571)
random200_model.sqrt<-train(modelForm,data=train,method='rf',trControl=controlParameter,ntree=200)
saveRDS(random200_model.sqrt,file="random5-0_model_sqrt.rds")
#random500_model.sqrt<-readRDS("random500_model_sqrt.rds")

#Prediction
lm_pred.sqrt<-predict(lm_model.sqrt,test)
forward_pred.sqrt<-predict(forward_model.sqrt,test)
backward_pred.sqrt<-predict(backward_model.sqrt,test)
step_pred.sqrt<-predict(step_model.sqrt,test)
lasso_pred.sqrt<-predict(lasso_model.sqrt,test)
ridge_pred.sqrt<-predict(ridge_model.sqrt,test)
elas_pred.sqrt<-predict(elas_model.sqrt,test)
pcr_pred.sqrt<-predict(pcr_model.sqrt,test)
xgblinear_pred.sqrt<-predict(xgbLinear_model.sqrt,test)
random200_pred.sqrt<-predict(random200_model.sqrt,test)

# calculate the MSE of test data for each model to evaluate its performance
lm_mse.sqrt<-mean((y.test - lm_pred.sqrt)^2)
forward_mse.sqrt<-mean((y.test - forward_pred.sqrt)^2)
backward_mse.sqrt<-mean((y.test - backward_pred.sqrt)^2)
step_mse.sqrt<-mean((y.test - step_pred.sqrt)^2)
lasso_mse.sqrt<-mean((y.test - lasso_pred.sqrt)^2)
ridge_mse.sqrt<-mean((y.test - ridge_pred.sqrt)^2)
elas_mse.sqrt<-mean((y.test - elas_pred.sqrt)^2)
pcr_mse.sqrt<-mean((y.test-pcr_pred.sqrt)^2)
xgblinear_mse.sqrt<-mean((y.test-xgblinear_pred.sqrt)^2)
random200_mse.sqrt<-mean((y.test-random200_pred.sqrt)^2)

#adjuR2
lm_adjR2.sqrt<-adjR2_test(lm_pred.sqrt,y.test)
forward_adjR2.sqrt<-adjR2_test(forward_pred.sqrt,y.test)
backward_adjR2.sqrt<-adjR2_test(backward_pred.sqrt,y.test)
step_adjR2.sqrt<-adjR2_test(step_pred.sqrt,y.test)
lasso_adjR2.sqrt<-adjR2_test(lasso_pred.sqrt,y.test)
ridge_adjR2.sqrt<-adjR2_test(ridge_pred.sqrt,y.test)
elas_adjR2.sqrt<-adjR2_test(elas_pred.sqrt,y.test)
pcr_adjR2.sqrt<-adjR2_test(pcr_pred.sqrt,y.test)
xgblinear_adjR2.sqrt<-adjR2_test(xgblinear_pred.sqrt,y.test)
random200_adjR2.sqrt<-adjR2_test(random200_pred.sqrt,y.test)

#Create a vector for adjR2 and mse
adjR2.sqrt<-c(lm_adjR2.sqrt,forward_adjR2.sqrt,backward_adjR2.sqrt,step_adjR2.sqrt,lasso_adjR2.sqrt,ridge_adjR2.sqrt,elas_adjR2.sqrt,pcr_adjR2.sqrt,xgblinear_adjR2.sqrt,random200_adjR2.sqrt)
mse.sqrt<-c(lm_mse.sqrt,forward_mse.sqrt,backward_mse.sqrt,step_mse.sqrt,lasso_mse.sqrt,ridge_mse.sqrt,elas_mse.sqrt,pcr_mse.sqrt,xgblinear_mse.sqrt,random200_mse.sqrt)
length(adjR2.sqrt)
length(mse.sqrt)
#Data Frame
Performance.sqrt<-data.frame("MSE.sqrt"=mse.sqrt,"AdjR2.sqrt"=adjR2.sqrt)
modelNames<-c("Linear","Forward","Backward","StepWise","Lasso","Ridge","Elastic","Principal Component","Xtreme Gradient Boosting","Random Forest")

rownames(Performance.sqrt)<-modelNames
modelNames
Performance.sqrt
Performance.sorted.sqrt<-Performance.sqrt[order(-Performance.sqrt$AdjR2.sqrt,-Performance.sqrt$MSE.sqrt),]
Performance.sorted.sqrt
Peformance.sorted




