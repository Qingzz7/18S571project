# MATH 571 section 3 regression
# Data used is clean data set in csv format from previous step
# time series models is applied
# yuqing zhao, April 10,2018


# read data
# assuming loss in the water processing is tiny. we use enfluent flow data to simulate input flow data

dfori=read.csv('completeMwrd_03_28_2018.csv',header = TRUE,sep = ',',stringsAsFactors=FALSE)
dfn=df4[,(1:2)]
dfn[,1]=as.Date(dfn[,1],"%Y-%m-%d")

# seperate data by location
for (i in 1:8){
  assign(paste0("df",i),dfn[dfori$Location==i,]) 
}

# fill out the missing date and use n/a for missing value
alldate1=seq.Date(from = df1$DATE[1],to=df1$DATE[length(df1$DATE)],by='day')
df1n=as.data.frame(alldate1)
colnames(df1n)='DATE'
df1nn=merge(x=df1n,y=df1,by='DATE',all.x = TRUE)
df1nn[is.na(df1nn)]=0

# Normalize the target data for future modeling
# dfn[,2]=data.frame(scale(dfn[,2]))  

# for each data frame create time series data
# use package forecast for potentially multiple seasonalities
library(forecast)

BOD5ts1=ts(df1nn$BOD5,start = c(2011,1,1),frequency = 365.25)
plot.ts(BOD5ts1)

BOD5msts1 = msts(BOD5ts1,seasonal.periods=c(7,365.25))
model = tbats(BOD5msts1)
plot(forecast(model, h=365.25))
forecast(model, h=365.25)
accuracy(model)



  
