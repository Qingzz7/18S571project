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

#Global Variables
TARGET<-'BOD5'
XVARS<- c("TKN", 'NH3.N','P.TOT', 'SS', 'FLOW', 'Rainfall', 'Location','Season')
modelForm<-createModelFormula(TARGET,XVARS)
modelNames<-c("Linear","Forward","Backward","StepWise","Lasso","Ridge","Elastic","Principal Component","XEtreme Boosting Linear","Random Forest")

#Read In Data
water.data.raw<-read.csv('completeMwrd_BOD5_04_08_2018.csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)

#Separate Date in 3 columns Year, Month, Day
water.data<-separate(water.data.raw,DATE,c('Year','Month','Day'),sep='-',remove=TRUE)
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
water.data<-data.frame('Month'=as.factor(water.data$Month),water.data,'Season'=as.factor(Season))
#Get rid of numeric month data
water.data<-water.data[,-2]

#Check all the columns are the correct data type
sapply(water.data,class)  

#Cor Matrix
cor(water.data[,2:8])

#Scale Data
water.data.scale<-scale(water.data[,2:8],center=FALSE)
water.data.scale<-data.frame('Location'=water.data$Location,'Month'=water.data$Month,'Season'=water.data$Season,water.data.scale)

#Check data type
sapply(water.data.scale,class)

#Create Training and Test Set
set.seed(0)
inTrain<-createDataPartition(y=water.data.scale[,TARGET],p=0.8,list=FALSE)
train<-water.data.scale[inTrain,]
test<-water.data.scale[-inTrain,]
y.test<-test[,4]
x.test<-test[,-4]
# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)


# Models
lm_model<-train(modelForm,data=train,method='lm',trControl=controlParameter)

forward_model=train(modelForm,data=train,method='leapForward',trControl=controlParameter)

backward_model=train(modelForm,data=train,method='leapBackward',trControl=controlParameter)

step_model=train(modelForm,data=train,method='leapSeq')

lassoGrid=expand.grid(alpha=1,lambda=c(0,5,0.0001))
lasso_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=lassoGrid)

ridgeGrid=expand.grid(alpha=0,lambda=c(0,5,0.0001))
ridge_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=ridgeGrid)

elas_model=train(modelForm, data=train, method = 'glmnet', trControl=controlParameter)

pcr_model<-train(modelForm,data=train, method='pcr',trControl=controlParameter)

set.seed(0)
#random200_model_season_month=train(modelForm,data=train,method='rf',ntree=150,trControl=controlParameter)
#saveRDS(random200_model_season_month,file="random200_model.rds")
random200_model<-readRDS("random200_model.rds")
set.seed(0)
#xgblinear<-train(modelForm,data=train,method='xgbLinear',trControl=controlParameter,tunelength=4)
#saveRDS(xgblinear,file="xgbLinear.rds")
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
Performance<-data.frame("AdjR^2"=adjR2,"MSE"=mse)
rownames(Performance)<-modelNames
#Sort by MSE
Performance.sorted<-Performance[order(-Performance$AdjR.2,-Performance$MSE),]
Performance.sorted


#Data with a square root transformation
water.data.scale.sqrt<-data.frame(sqrt(water.data.scale[,4:10]),water.data.scale[,1:3])

set.seed(0)
inTrain<-createDataPartition(y=water.data.scale.sqrt[,TARGET],p=0.8,list=FALSE)
train<-water.data.scale.sqrt[inTrain,]
test<-water.data.scale.sqrt[-inTrain,]
y.test<-test[,4]
x.test<-test[,-4]
# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)
# Models
lm_model<-train(modelForm,data=train,method='lm',trControl=controlParameter)

forward_model=train(modelForm,data=train,method='leapForward',trControl=controlParameter)

backward_model=train(modelForm,data=train,method='leapBackward',trControl=controlParameter)

step_model=train(modelForm,data=train,method='leapSeq')

lassoGrid=expand.grid(alpha=1,lambda=c(0,5,0.0001))
lasso_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=lassoGrid)

ridgeGrid=expand.grid(alpha=0,lambda=c(0,5,0.0001))
ridge_model=train(modelForm, data=train, method = 'glmnet',trControl=controlParameter,tuneGrid=ridgeGrid)

elas_model=train(modelForm, data=train, method = 'glmnet', trControl=controlParameter)

pcr_model<-train(modelForm,data=train, method='pcr',trControl=controlParameter)

set.seed(0)
#xgblinear.sqrt<-train(modelForm,data=train,method='xgbLinear',trControl=controlParameter,tunelength=4)
#saveRDS(xgblinear.sqrt,file="xgblinear_sqrt.rds")
xgbLinear_model.sqrt<-readRDS("xgbLinear_sqrt.rds")

set.seed(0)
#random200_model.sqrt<-train(modelForm,data=train,method='rf',trControl=controlParameter,ntree=200)
#saveRDS(random200_model.sqrt,file="random200_model_sqrt.rds")
random200_model.sqrt<-readRDS("random200_model_sqrt.rds")

#Prediction
lm_pred<-predict(lm_model,test)
forward_pred<-predict(forward_model,test)
backward_pred<-predict(backward_model,test)
step_pred<-predict(step_model,test)
lasso_pred<-predict(lasso_model,test)
ridge_pred<-predict(ridge_model,test)
elas_pred<-predict(elas_model,test)
pcr_pred<-predict(pcr_model,test)
xgblinear_pred<-predict(xgbLinear_model.sqrt,test)
random200_pred<-predict(random200_model.sqrt,test)

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

#adjuR2
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

#Create a vector for adjR2 and mse
adjR2<-c(lm_adjR2,forward_adjR2,backward_adjR2,step_adjR2,lasso_adjR2,ridge_adjR2,elas_adjR2,pcr_adjR2,xgblinear_adjR2,random200_adjR2)
mse<-c(lm_mse,forward_mse,backward_mse,step_mse,lasso_mse,ridge_mse,elas_mse,pcr_mse,xgblinear_mse,random200_mse)
#Data Frame
Performance<-data.frame("AdjR^2"=adjR2,"MSE"=mse)
rownames(Performance)<-modelNames
  
Performance.sorted.sqrt<-Performance[order(-Performance$AdjR.2,Performance$MSE),]
Performance.sorted.sqrt


