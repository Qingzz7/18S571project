library(data.table)
library(lubridate)
library(dplyr)
library(readxl)
library(stringr)
library(plyr)
library(readr)

file<-'C:/Users/boltz/Desktop/CSP571/project/raw data/rainfall_ord.csv'

rainfall.data <- read.delim(file, sep = ",", col.names=c("STATION","NAME","DATE","RAINFALL","SNOW","SNWD"))

DATE<-rain.in<-seq.Date(as.Date("2011-01-01"), as.Date("2017-12-31"),"day")
rainfall.data<-data.frame('DATE'=DATE,'Rainfall'=rainfall.data$RAINFALL)

calumet.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=1)
calumet.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=2)
calumet.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=3)
calumet.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=4)
calumet.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=5)
calumet.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=6)
calumet.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Raw_2011-2020.xlsx',sheet=7)

#2011
calumet.data.2011<-as.data.frame(calumet.data.2011)
calumet.data.2011<-calumet.data.2011[3:367,]
#Date handling
calumet.data.2011$X__1<-as.numeric(calumet.data.2011$X__1)
calumet.data.2011$X__1<-as.Date(calumet.data.2011$X__1,origin="1899-12-30")
calumet.data.2011<-data.frame("DATE"=calumet.data.2011$X__1,"BOD5"=calumet.data.2011$BOD5,"TKN"=calumet.data.2011$TKN,"NH3-N"=calumet.data.2011$`NH3-N`,"P-TOT"=calumet.data.2011$`P-TOT`,"SS"=calumet.data.2011$SS)

#change variables to numeric
calumet.data.2011$BOD5<-as.numeric(as.character(calumet.data.2011$BOD5))
calumet.data.2011$TKN<-as.numeric(as.character(calumet.data.2011$TKN))
calumet.data.2011$NH3.N<-as.numeric(as.character(calumet.data.2011$NH3.N))
calumet.data.2011$P.TOT<-as.numeric(as.character(calumet.data.2011$P.TOT))
calumet.data.2011$SS<-as.numeric(as.character(calumet.data.2011$SS))

#2012
calumet.data.2012<-as.data.frame(calumet.data.2012)
calumet.data.2012<-calumet.data.2012[3:368,]
#Date handling
calumet.data.2012$X__1<-as.numeric(calumet.data.2012$X__1)
calumet.data.2012$X__1<-as.Date(calumet.data.2012$X__1,origin="1899-12-30")
calumet.data.2012<-data.frame("DATE"=calumet.data.2012$X__1,"BOD5"=calumet.data.2012$BOD5,"TKN"=calumet.data.2012$TKN,"NH3-N"=calumet.data.2012$`NH3-N`,"P-TOT"=calumet.data.2012$`P-TOT`,"SS"=calumet.data.2012$SS)

#change variables to numeric
calumet.data.2012$BOD5<-as.numeric(as.character(calumet.data.2012$BOD5))
calumet.data.2012$TKN<-as.numeric(as.character(calumet.data.2012$TKN))
calumet.data.2012$NH3.N<-as.numeric(as.character(calumet.data.2012$NH3.N))
calumet.data.2012$P.TOT<-as.numeric(as.character(calumet.data.2012$P.TOT))
calumet.data.2012$SS<-as.numeric(as.character(calumet.data.2012$SS))

#2013
calumet.data.2013<-as.data.frame(calumet.data.2013)
calumet.data.2013<-calumet.data.2013[3:367,]
#Date handling
calumet.data.2013$X__1<-as.numeric(calumet.data.2013$X__1)
calumet.data.2013$X__1<-as.Date(calumet.data.2013$X__1,origin="1899-12-30")
calumet.data.2013<-data.frame("DATE"=calumet.data.2013$X__1,"BOD5"=calumet.data.2013$BOD5,"TKN"=calumet.data.2013$TKN,"NH3-N"=calumet.data.2013$`NH3-N`,"P-TOT"=calumet.data.2013$`P-TOT`,"SS"=calumet.data.2013$SS)

#change variables to numeric
calumet.data.2013$BOD5<-as.numeric(as.character(calumet.data.2013$BOD5))
calumet.data.2013$TKN<-as.numeric(as.character(calumet.data.2013$TKN))
calumet.data.2013$NH3.N<-as.numeric(as.character(calumet.data.2013$NH3.N))
calumet.data.2013$P.TOT<-as.numeric(as.character(calumet.data.2013$P.TOT))
calumet.data.2013$SS<-as.numeric(as.character(calumet.data.2013$SS))

#2014
calumet.data.2014<-as.data.frame(calumet.data.2014)
calumet.data.2014<-calumet.data.2014[3:367,]
#Date handling
calumet.data.2014$X__1<-as.numeric(calumet.data.2014$X__1)
calumet.data.2014$X__1<-as.Date(calumet.data.2014$X__1,origin="1899-12-30")
calumet.data.2014<-data.frame("DATE"=calumet.data.2014$X__1,"BOD5"=calumet.data.2014$BOD5,"TKN"=calumet.data.2014$TKN,"NH3-N"=calumet.data.2014$`NH3-N`,"P-TOT"=calumet.data.2014$`P-TOT`,"SS"=calumet.data.2014$SS)

#change variables to numeric
calumet.data.2014$BOD5<-as.numeric(as.character(calumet.data.2014$BOD5))
calumet.data.2014$TKN<-as.numeric(as.character(calumet.data.2014$TKN))
calumet.data.2014$NH3.N<-as.numeric(as.character(calumet.data.2014$NH3.N))
calumet.data.2014$P.TOT<-as.numeric(as.character(calumet.data.2014$P.TOT))
calumet.data.2014$SS<-as.numeric(as.character(calumet.data.2014$SS))

#2015
calumet.data.2015<-as.data.frame(calumet.data.2015)
calumet.data.2015<-calumet.data.2015[3:367,]
#Date handling
calumet.data.2015$X__1<-as.numeric(calumet.data.2015$X__1)
calumet.data.2015$X__1<-as.Date(calumet.data.2015$X__1,origin="1899-12-30")
calumet.data.2015<-data.frame("DATE"=calumet.data.2015$X__1,"BOD5"=calumet.data.2015$BOD5,"TKN"=calumet.data.2015$TKN,"NH3-N"=calumet.data.2015$`NH3-N`,"P-TOT"=calumet.data.2015$`P-TOT`,"SS"=calumet.data.2015$SS)

#change variables to numeric
calumet.data.2015$BOD5<-as.numeric(as.character(calumet.data.2015$BOD5))
calumet.data.2015$TKN<-as.numeric(as.character(calumet.data.2015$TKN))
calumet.data.2015$NH3.N<-as.numeric(as.character(calumet.data.2015$NH3.N))
calumet.data.2015$P.TOT<-as.numeric(as.character(calumet.data.2015$P.TOT))
calumet.data.2015$SS<-as.numeric(as.character(calumet.data.2015$SS))

#2016
calumet.data.2016<-as.data.frame(calumet.data.2016)
calumet.data.2016<-calumet.data.2016[3:368,]
#Date handling
calumet.data.2016$X__1<-as.numeric(calumet.data.2016$X__1)
calumet.data.2016$X__1<-as.Date(calumet.data.2016$X__1,origin="1899-12-30")
calumet.data.2016<-data.frame("DATE"=calumet.data.2016$X__1,"BOD5"=calumet.data.2016$BOD5,"TKN"=calumet.data.2016$TKN,"NH3-N"=calumet.data.2016$`NH3-N`,"P-TOT"=calumet.data.2016$`P-TOT`,"SS"=calumet.data.2016$SS)

#change variables to numeric
calumet.data.2016$BOD5<-as.numeric(as.character(calumet.data.2016$BOD5))
calumet.data.2016$TKN<-as.numeric(as.character(calumet.data.2016$TKN))
calumet.data.2016$NH3.N<-as.numeric(as.character(calumet.data.2016$NH3.N))
calumet.data.2016$P.TOT<-as.numeric(as.character(calumet.data.2016$P.TOT))
calumet.data.2016$SS<-as.numeric(as.character(calumet.data.2016$SS))

#2017
calumet.data.2017<-as.data.frame(calumet.data.2017)
calumet.data.2017<-calumet.data.2017[3:367,]
#Date handling
calumet.data.2017$X__1<-as.numeric(calumet.data.2017$X__1)
calumet.data.2017$X__1<-as.Date(calumet.data.2017$X__1,origin="1899-12-30")
calumet.data.2017<-data.frame("DATE"=calumet.data.2017$X__1,"BOD5"=calumet.data.2017$BOD5,"TKN"=calumet.data.2017$TKN,"NH3-N"=calumet.data.2017$`NH3-N`,"P-TOT"=calumet.data.2017$`P-TOT`,"SS"=calumet.data.2017$SS)

#change variables to numeric
calumet.data.2017$BOD5<-as.numeric(as.character(calumet.data.2017$BOD5))
calumet.data.2017$TKN<-as.numeric(as.character(calumet.data.2017$TKN))
calumet.data.2017$NH3.N<-as.numeric(as.character(calumet.data.2017$NH3.N))
calumet.data.2017$P.TOT<-as.numeric(as.character(calumet.data.2017$P.TOT))
calumet.data.2017$SS<-as.numeric(as.character(calumet.data.2017$SS))



#calumet flow
calumet.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=1)
calumet.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=2)
calumet.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=3)
calumet.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=4)
calumet.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=5)
calumet.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=6)
calumet.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Calumet_Outfall_2011-2020.xls',sheet=7)

calumet.flow.2011<-as.data.frame(calumet.flow.2011)
colnames(calumet.flow.2011)[colnames(calumet.flow.2011)=="X__1"]<-"DATE"
colnames(calumet.flow.2011)[colnames(calumet.flow.2011)=="FLOW"|colnames(calumet.flow.2011)=="Flow"]<-"FLOW"
calumet.flow.2011$FLOW<-as.numeric(as.character(calumet.flow.2011$FLOW))
calumet.flow.2011<-calumet.flow.2011[3:367,]
calumet.flow.2011$DATE<-as.numeric(calumet.flow.2011$DATE)
calumet.flow.2011$DATE<-as.Date(calumet.flow.2011$DATE,origin="1899-12-30")
calumet.flow.2011<-data.frame("DATE"=calumet.flow.2011$DATE,"FLOW"=calumet.flow.2011$FLOW)

calumet.flow.2012<-as.data.frame(calumet.flow.2012)
colnames(calumet.flow.2012)[colnames(calumet.flow.2012)=="X__1"]<-"DATE"
colnames(calumet.flow.2012)[colnames(calumet.flow.2012)=="FLOW"|colnames(calumet.flow.2012)=="Flow"]<-"FLOW"
calumet.flow.2012$FLOW<-as.numeric(as.character(calumet.flow.2012$FLOW))
calumet.flow.2012<-calumet.flow.2012[3:368,]
calumet.flow.2012$DATE<-as.numeric(calumet.flow.2012$DATE)
calumet.flow.2012$DATE<-as.Date(calumet.flow.2012$DATE,origin="1899-12-30")
calumet.flow.2012<-data.frame("DATE"=calumet.flow.2012$DATE,"FLOW"=calumet.flow.2012$FLOW)

calumet.flow.2013<-as.data.frame(calumet.flow.2013)
colnames(calumet.flow.2013)[colnames(calumet.flow.2013)=="X__1"]<-"DATE"
colnames(calumet.flow.2013)[colnames(calumet.flow.2013)=="FLOW"|colnames(calumet.flow.2013)=="Flow"]<-"FLOW"
calumet.flow.2013$FLOW<-as.numeric(as.character(calumet.flow.2013$FLOW))
calumet.flow.2013<-calumet.flow.2013[3:367,]
calumet.flow.2013$DATE<-as.numeric(calumet.flow.2013$DATE)
calumet.flow.2013$DATE<-as.Date(calumet.flow.2013$DATE,origin="1899-12-30")
calumet.flow.2013<-data.frame("DATE"=calumet.flow.2013$DATE,"FLOW"=calumet.flow.2013$FLOW)

calumet.flow.2014<-as.data.frame(calumet.flow.2014)
colnames(calumet.flow.2014)[colnames(calumet.flow.2014)=="X__1"]<-"DATE"
colnames(calumet.flow.2014)[colnames(calumet.flow.2014)=="FLOW"|colnames(calumet.flow.2014)=="Flow"]<-"FLOW"
calumet.flow.2014$FLOW<-as.numeric(as.character(calumet.flow.2014$FLOW))
calumet.flow.2014<-calumet.flow.2014[3:367,]
calumet.flow.2014$DATE<-as.numeric(calumet.flow.2014$DATE)
calumet.flow.2014$DATE<-as.Date(calumet.flow.2014$DATE,origin="1899-12-30")
calumet.flow.2014<-data.frame("DATE"=calumet.flow.2014$DATE,"FLOW"=calumet.flow.2014$FLOW)

calumet.flow.2015<-as.data.frame(calumet.flow.2015)
colnames(calumet.flow.2015)[colnames(calumet.flow.2015)=="X__1"]<-"DATE"
colnames(calumet.flow.2015)[colnames(calumet.flow.2015)=="FLOW"|colnames(calumet.flow.2015)=="Flow"]<-"FLOW"
calumet.flow.2015$FLOW<-as.numeric(as.character(calumet.flow.2015$FLOW))
calumet.flow.2015<-calumet.flow.2015[3:367,]
calumet.flow.2015$DATE<-as.numeric(calumet.flow.2015$DATE)
calumet.flow.2015$DATE<-as.Date(calumet.flow.2015$DATE,origin="1899-12-30")
calumet.flow.2015<-data.frame("DATE"=calumet.flow.2015$DATE,"FLOW"=calumet.flow.2015$FLOW)


calumet.flow.2016<-as.data.frame(calumet.flow.2016)
colnames(calumet.flow.2016)[colnames(calumet.flow.2016)=="X__1"]<-"DATE"
colnames(calumet.flow.2016)[colnames(calumet.flow.2016)=="FLOW"|colnames(calumet.flow.2016)=="Flow"]<-"FLOW"
calumet.flow.2016$FLOW<-as.numeric(as.character(calumet.flow.2016$FLOW))
calumet.flow.2016<-calumet.flow.2016[3:368,]
calumet.flow.2016$DATE<-as.numeric(calumet.flow.2016$DATE)
calumet.flow.2016$DATE<-as.Date(calumet.flow.2016$DATE,origin="1899-12-30")
calumet.flow.2016<-data.frame("DATE"=calumet.flow.2016$DATE,"FLOW"=calumet.flow.2016$FLOW)

calumet.flow.2017<-as.data.frame(calumet.flow.2017)
colnames(calumet.flow.2017)[colnames(calumet.flow.2017)=="X__1"]<-"DATE"
colnames(calumet.flow.2017)[colnames(calumet.flow.2017)=="FLOW"|colnames(calumet.flow.2017)=="Flow"]<-"FLOW"
calumet.flow.2017$FLOW<-as.numeric(as.character(calumet.flow.2017$FLOW))
calumet.flow.2017<-calumet.flow.2017[3:367,]
calumet.flow.2017$DATE<-as.numeric(calumet.flow.2017$DATE)
calumet.flow.2017$DATE<-as.Date(calumet.flow.2017$DATE,origin="1899-12-30")
calumet.flow.2017<-data.frame("DATE"=calumet.flow.2017$DATE,"FLOW"=calumet.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
calumet.data.2011<-merge(x=calumet.data.2011,y=calumet.flow.2011,by="DATE",all.x=TRUE)

calumet.data.2012<-merge(x=calumet.data.2012,y=calumet.flow.2012,by="DATE",all.x=TRUE)
calumet.data.2013<-merge(x=calumet.data.2013,y=calumet.flow.2013,by="DATE",all.x=TRUE)
calumet.data.2014<-merge(x=calumet.data.2014,y=calumet.flow.2014,by="DATE",all.x=TRUE)
calumet.data.2015<-merge(x=calumet.data.2015,y=calumet.flow.2015,by="DATE",all.x=TRUE)
calumet.data.2016<-merge(x=calumet.data.2016,y=calumet.flow.2016,by="DATE",all.x=TRUE)
calumet.data.2017<-merge(x=calumet.data.2017,y=calumet.flow.2017,by="DATE",all.x=TRUE)



calumet.data.all<-rbind(calumet.data.2011,calumet.data.2012,calumet.data.2013,calumet.data.2014,calumet.data.2015,calumet.data.2016,calumet.data.2017)
calumet.data.all.rain<-merge(x=calumet.data.all,y=rainfall.data,all.x=T)


#Need to add location locator
#Location 1=calumet, 2=egan,3=calumet park,4=kirie,5=lemont,6=obrien,7=southwest,8=west side
Location<-rep(1,nrow(calumet.data.all.rain))
calumet.data.all.rain<-data.frame(calumet.data.all.rain,"Location"=Location)
summary(calumet.data.all.rain)

#EGAN
egan.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=1)
egan.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=2)
egan.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=3)
egan.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=4)
egan.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=5)
egan.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=6)
egan.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Raw_2011-2020.xlsx',sheet=7)

#2011
egan.data.2011<-as.data.frame(egan.data.2011)
egan.data.2011<-egan.data.2011[3:367,]
#Date handling
egan.data.2011$X__1<-as.numeric(egan.data.2011$X__1)
egan.data.2011$X__1<-as.Date(egan.data.2011$X__1,origin="1899-12-30")
egan.data.2011<-data.frame("DATE"=egan.data.2011$X__1,"BOD5"=egan.data.2011$BOD5,"TKN"=egan.data.2011$TKN,"NH3-N"=egan.data.2011$`NH3-N`,"P-TOT"=egan.data.2011$`P-TOT`,"SS"=egan.data.2011$SS)

#change variables to numeric
egan.data.2011$BOD5<-as.numeric(as.character(egan.data.2011$BOD5))
egan.data.2011$TKN<-as.numeric(as.character(egan.data.2011$TKN))
egan.data.2011$NH3.N<-as.numeric(as.character(egan.data.2011$NH3.N))
egan.data.2011$P.TOT<-as.numeric(as.character(egan.data.2011$P.TOT))
egan.data.2011$SS<-as.numeric(as.character(egan.data.2011$SS))

#2012
egan.data.2012<-as.data.frame(egan.data.2012)
egan.data.2012<-egan.data.2012[3:368,]
#Date handling
egan.data.2012$X__1<-as.numeric(egan.data.2012$X__1)
egan.data.2012$X__1<-as.Date(egan.data.2012$X__1,origin="1899-12-30")
egan.data.2012<-data.frame("DATE"=egan.data.2012$X__1,"BOD5"=egan.data.2012$BOD5,"TKN"=egan.data.2012$TKN,"NH3-N"=egan.data.2012$`NH3-N`,"P-TOT"=egan.data.2012$`P-TOT`,"SS"=egan.data.2012$SS)

#change variables to numeric
egan.data.2012$BOD5<-as.numeric(as.character(egan.data.2012$BOD5))
egan.data.2012$TKN<-as.numeric(as.character(egan.data.2012$TKN))
egan.data.2012$NH3.N<-as.numeric(as.character(egan.data.2012$NH3.N))
egan.data.2012$P.TOT<-as.numeric(as.character(egan.data.2012$P.TOT))
egan.data.2012$SS<-as.numeric(as.character(egan.data.2012$SS))

#2013
egan.data.2013<-as.data.frame(egan.data.2013)
egan.data.2013<-egan.data.2013[3:367,]
#Date handling
egan.data.2013$X__1<-as.numeric(egan.data.2013$X__1)
egan.data.2013$X__1<-as.Date(egan.data.2013$X__1,origin="1899-12-30")
egan.data.2013<-data.frame("DATE"=egan.data.2013$X__1,"BOD5"=egan.data.2013$BOD5,"TKN"=egan.data.2013$TKN,"NH3-N"=egan.data.2013$`NH3-N`,"P-TOT"=egan.data.2013$`P-TOT`,"SS"=egan.data.2013$SS)

#change variables to numeric
egan.data.2013$BOD5<-as.numeric(as.character(egan.data.2013$BOD5))
egan.data.2013$TKN<-as.numeric(as.character(egan.data.2013$TKN))
egan.data.2013$NH3.N<-as.numeric(as.character(egan.data.2013$NH3.N))
egan.data.2013$P.TOT<-as.numeric(as.character(egan.data.2013$P.TOT))
egan.data.2013$SS<-as.numeric(as.character(egan.data.2013$SS))

#2014
egan.data.2014<-as.data.frame(egan.data.2014)
egan.data.2014<-egan.data.2014[3:367,]
#Date handling
egan.data.2014$X__1<-as.numeric(egan.data.2014$X__1)
egan.data.2014$X__1<-as.Date(egan.data.2014$X__1,origin="1899-12-30")
egan.data.2014<-data.frame("DATE"=egan.data.2014$X__1,"BOD5"=egan.data.2014$BOD5,"TKN"=egan.data.2014$TKN,"NH3-N"=egan.data.2014$`NH3-N`,"P-TOT"=egan.data.2014$`P-TOT`,"SS"=egan.data.2014$SS)

#change variables to numeric
egan.data.2014$BOD5<-as.numeric(as.character(egan.data.2014$BOD5))
egan.data.2014$TKN<-as.numeric(as.character(egan.data.2014$TKN))
egan.data.2014$NH3.N<-as.numeric(as.character(egan.data.2014$NH3.N))
egan.data.2014$P.TOT<-as.numeric(as.character(egan.data.2014$P.TOT))
egan.data.2014$SS<-as.numeric(as.character(egan.data.2014$SS))

#2015
egan.data.2015<-as.data.frame(egan.data.2015)
egan.data.2015<-egan.data.2015[3:367,]
#Date handling
egan.data.2015$X__1<-as.numeric(egan.data.2015$X__1)
egan.data.2015$X__1<-as.Date(egan.data.2015$X__1,origin="1899-12-30")
egan.data.2015<-data.frame("DATE"=egan.data.2015$X__1,"BOD5"=egan.data.2015$BOD5,"TKN"=egan.data.2015$TKN,"NH3-N"=egan.data.2015$`NH3-N`,"P-TOT"=egan.data.2015$`P-TOT`,"SS"=egan.data.2015$SS)

#change variables to numeric
egan.data.2015$BOD5<-as.numeric(as.character(egan.data.2015$BOD5))
egan.data.2015$TKN<-as.numeric(as.character(egan.data.2015$TKN))
egan.data.2015$NH3.N<-as.numeric(as.character(egan.data.2015$NH3.N))
egan.data.2015$P.TOT<-as.numeric(as.character(egan.data.2015$P.TOT))
egan.data.2015$SS<-as.numeric(as.character(egan.data.2015$SS))

#2016
egan.data.2016<-as.data.frame(egan.data.2016)
egan.data.2016<-egan.data.2016[3:368,]
#Date handling
egan.data.2016$X__1<-as.numeric(egan.data.2016$X__1)
egan.data.2016$X__1<-as.Date(egan.data.2016$X__1,origin="1899-12-30")
egan.data.2016<-data.frame("DATE"=egan.data.2016$X__1,"BOD5"=egan.data.2016$BOD5,"TKN"=egan.data.2016$TKN,"NH3-N"=egan.data.2016$`NH3-N`,"P-TOT"=egan.data.2016$`P-TOT`,"SS"=egan.data.2016$SS)

#change variables to numeric
egan.data.2016$BOD5<-as.numeric(as.character(egan.data.2016$BOD5))
egan.data.2016$TKN<-as.numeric(as.character(egan.data.2016$TKN))
egan.data.2016$NH3.N<-as.numeric(as.character(egan.data.2016$NH3.N))
egan.data.2016$P.TOT<-as.numeric(as.character(egan.data.2016$P.TOT))
egan.data.2016$SS<-as.numeric(as.character(egan.data.2016$SS))

#2017
egan.data.2017<-as.data.frame(egan.data.2017)
egan.data.2017<-egan.data.2017[3:367,]
#Date handling
egan.data.2017$X__1<-as.numeric(egan.data.2017$X__1)
egan.data.2017$X__1<-as.Date(egan.data.2017$X__1,origin="1899-12-30")
egan.data.2017<-data.frame("DATE"=egan.data.2017$X__1,"BOD5"=egan.data.2017$BOD5,"TKN"=egan.data.2017$TKN,"NH3-N"=egan.data.2017$`NH3-N`,"P-TOT"=egan.data.2017$`P-TOT`,"SS"=egan.data.2017$SS)

#change variables to numeric
egan.data.2017$BOD5<-as.numeric(as.character(egan.data.2017$BOD5))
egan.data.2017$TKN<-as.numeric(as.character(egan.data.2017$TKN))
egan.data.2017$NH3.N<-as.numeric(as.character(egan.data.2017$NH3.N))
egan.data.2017$P.TOT<-as.numeric(as.character(egan.data.2017$P.TOT))
egan.data.2017$SS<-as.numeric(as.character(egan.data.2017$SS))

#egan flow
egan.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=1)
egan.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=2)
egan.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=3)
egan.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=4)
egan.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=5)
egan.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=6)
egan.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Egan_Outfall_2011-2020.xls',sheet=7)

egan.flow.2011<-as.data.frame(egan.flow.2011)
colnames(egan.flow.2011)[colnames(egan.flow.2011)=="X__1"]<-"DATE"
colnames(egan.flow.2011)[colnames(egan.flow.2011)=="FLOW"|colnames(egan.flow.2011)=="Flow"]<-"FLOW"
egan.flow.2011$FLOW<-as.numeric(as.character(egan.flow.2011$FLOW))
egan.flow.2011<-egan.flow.2011[3:367,]
egan.flow.2011$DATE<-as.numeric(egan.flow.2011$DATE)
egan.flow.2011$DATE<-as.Date(egan.flow.2011$DATE,origin="1899-12-30")
egan.flow.2011<-data.frame("DATE"=egan.flow.2011$DATE,"FLOW"=egan.flow.2011$FLOW)

egan.flow.2012<-as.data.frame(egan.flow.2012)
colnames(egan.flow.2012)[colnames(egan.flow.2012)=="X__1"]<-"DATE"
colnames(egan.flow.2012)[colnames(egan.flow.2012)=="FLOW"|colnames(egan.flow.2012)=="Flow"]<-"FLOW"
egan.flow.2012$FLOW<-as.numeric(as.character(egan.flow.2012$FLOW))
egan.flow.2012<-egan.flow.2012[3:368,]
egan.flow.2012$DATE<-as.numeric(egan.flow.2012$DATE)
egan.flow.2012$DATE<-as.Date(egan.flow.2012$DATE,origin="1899-12-30")
egan.flow.2012<-data.frame("DATE"=egan.flow.2012$DATE,"FLOW"=egan.flow.2012$FLOW)

egan.flow.2013<-as.data.frame(egan.flow.2013)
colnames(egan.flow.2013)[colnames(egan.flow.2013)=="X__1"]<-"DATE"
colnames(egan.flow.2013)[colnames(egan.flow.2013)=="FLOW"|colnames(egan.flow.2013)=="Flow"]<-"FLOW"
egan.flow.2013$FLOW<-as.numeric(as.character(egan.flow.2013$FLOW))
egan.flow.2013<-egan.flow.2013[3:367,]
egan.flow.2013$DATE<-as.numeric(egan.flow.2013$DATE)
egan.flow.2013$DATE<-as.Date(egan.flow.2013$DATE,origin="1899-12-30")
egan.flow.2013<-data.frame("DATE"=egan.flow.2013$DATE,"FLOW"=egan.flow.2013$FLOW)

egan.flow.2014<-as.data.frame(egan.flow.2014)
colnames(egan.flow.2014)[colnames(egan.flow.2014)=="X__1"]<-"DATE"
colnames(egan.flow.2014)[colnames(egan.flow.2014)=="FLOW"|colnames(egan.flow.2014)=="Flow"]<-"FLOW"
egan.flow.2014$FLOW<-as.numeric(as.character(egan.flow.2014$FLOW))
egan.flow.2014<-egan.flow.2014[3:367,]
egan.flow.2014$DATE<-as.numeric(egan.flow.2014$DATE)
egan.flow.2014$DATE<-as.Date(egan.flow.2014$DATE,origin="1899-12-30")
egan.flow.2014<-data.frame("DATE"=egan.flow.2014$DATE,"FLOW"=egan.flow.2014$FLOW)

egan.flow.2015<-as.data.frame(egan.flow.2015)
colnames(egan.flow.2015)[colnames(egan.flow.2015)=="X__1"]<-"DATE"
colnames(egan.flow.2015)[colnames(egan.flow.2015)=="FLOW"|colnames(egan.flow.2015)=="Flow"]<-"FLOW"
egan.flow.2015$FLOW<-as.numeric(as.character(egan.flow.2015$FLOW))
egan.flow.2015<-egan.flow.2015[3:367,]
egan.flow.2015$DATE<-as.numeric(egan.flow.2015$DATE)
egan.flow.2015$DATE<-as.Date(egan.flow.2015$DATE,origin="1899-12-30")
egan.flow.2015<-data.frame("DATE"=egan.flow.2015$DATE,"FLOW"=egan.flow.2015$FLOW)

egan.flow.2016<-as.data.frame(egan.flow.2016)
colnames(egan.flow.2016)[colnames(egan.flow.2016)=="X__1"]<-"DATE"
colnames(egan.flow.2016)[colnames(egan.flow.2016)=="FLOW"|colnames(egan.flow.2016)=="Flow"]<-"FLOW"
egan.flow.2016$FLOW<-as.numeric(as.character(egan.flow.2016$FLOW))
egan.flow.2016<-egan.flow.2016[3:368,]
egan.flow.2016$DATE<-as.numeric(egan.flow.2016$DATE)
egan.flow.2016$DATE<-as.Date(egan.flow.2016$DATE,origin="1899-12-30")
egan.flow.2016<-data.frame("DATE"=egan.flow.2016$DATE,"FLOW"=egan.flow.2016$FLOW)

egan.flow.2017<-as.data.frame(egan.flow.2017)
colnames(egan.flow.2017)[colnames(egan.flow.2017)=="X__1"]<-"DATE"
colnames(egan.flow.2017)[colnames(egan.flow.2017)=="FLOW"|colnames(egan.flow.2017)=="Flow"]<-"FLOW"
egan.flow.2017$FLOW<-as.numeric(as.character(egan.flow.2017$FLOW))
egan.flow.2017<-egan.flow.2017[3:367,]
egan.flow.2017$DATE<-as.numeric(egan.flow.2017$DATE)
egan.flow.2017$DATE<-as.Date(egan.flow.2017$DATE,origin="1899-12-30")
egan.flow.2017<-data.frame("DATE"=egan.flow.2017$DATE,"FLOW"=egan.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
egan.data.2011<-merge(x=egan.data.2011,y=egan.flow.2011,by="DATE",all.x=TRUE)

egan.data.2012<-merge(x=egan.data.2012,y=egan.flow.2012,by="DATE",all.x=TRUE)
egan.data.2013<-merge(x=egan.data.2013,y=egan.flow.2013,by="DATE",all.x=TRUE)
egan.data.2014<-merge(x=egan.data.2014,y=egan.flow.2014,by="DATE",all.x=TRUE)
egan.data.2015<-merge(x=egan.data.2015,y=egan.flow.2015,by="DATE",all.x=TRUE)
egan.data.2016<-merge(x=egan.data.2016,y=egan.flow.2016,by="DATE",all.x=TRUE)
egan.data.2017<-merge(x=egan.data.2017,y=egan.flow.2017,by="DATE",all.x=TRUE)

#Rowbind all the years
egan.data.all<-rbind(egan.data.2011,egan.data.2012,egan.data.2013,egan.data.2014,egan.data.2015,egan.data.2016,egan.data.2017)


#Join all the years with rain data
egan.data.all.rain<-merge(x=egan.data.all,y=rainfall.data,by="DATE",all.x=TRUE)

#Need to add location locator
#Location 1=egan, 2=egan,3=egan park,4=kirie,5=lemont,6=obrien,7=southwest,8=west side
Location<-rep(2,nrow(egan.data.all.rain))
egan.data.all.rain<-data.frame(egan.data.all.rain,"Location"=Location)
summary(egan.data.all.rain)

#HANOVER
hanover.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=1)
hanover.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=2)
hanover.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=3)
hanover.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=4)
hanover.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=5)
hanover.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=6)
hanover.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Raw_2011-2020.xlsx',sheet=7)


#2011
hanover.data.2011<-as.data.frame(hanover.data.2011)
hanover.data.2011<-hanover.data.2011[3:367,]
#Date handling
hanover.data.2011$X__1<-as.numeric(hanover.data.2011$X__1)
hanover.data.2011$X__1<-as.Date(hanover.data.2011$X__1,origin="1899-12-30")
hanover.data.2011<-data.frame("DATE"=hanover.data.2011$X__1,"BOD5"=hanover.data.2011$BOD5,"TKN"=hanover.data.2011$TKN,"NH3-N"=hanover.data.2011$`NH3-N`,"P-TOT"=hanover.data.2011$`P-TOT`,"SS"=hanover.data.2011$SS)

#change variables to numeric
hanover.data.2011$BOD5<-as.numeric(as.character(hanover.data.2011$BOD5))
hanover.data.2011$TKN<-as.numeric(as.character(hanover.data.2011$TKN))
hanover.data.2011$NH3.N<-as.numeric(as.character(hanover.data.2011$NH3.N))
hanover.data.2011$P.TOT<-as.numeric(as.character(hanover.data.2011$P.TOT))
hanover.data.2011$SS<-as.numeric(as.character(hanover.data.2011$SS))

#2012
hanover.data.2012<-as.data.frame(hanover.data.2012)
hanover.data.2012<-hanover.data.2012[3:368,]
#Date handling
hanover.data.2012$X__1<-as.numeric(hanover.data.2012$X__1)
hanover.data.2012$X__1<-as.Date(hanover.data.2012$X__1,origin="1899-12-30")
hanover.data.2012<-data.frame("DATE"=hanover.data.2012$X__1,"BOD5"=hanover.data.2012$BOD5,"TKN"=hanover.data.2012$TKN,"NH3-N"=hanover.data.2012$`NH3-N`,"P-TOT"=hanover.data.2012$`P-TOT`,"SS"=hanover.data.2012$SS)

#change variables to numeric
hanover.data.2012$BOD5<-as.numeric(as.character(hanover.data.2012$BOD5))
hanover.data.2012$TKN<-as.numeric(as.character(hanover.data.2012$TKN))
hanover.data.2012$NH3.N<-as.numeric(as.character(hanover.data.2012$NH3.N))
hanover.data.2012$P.TOT<-as.numeric(as.character(hanover.data.2012$P.TOT))
hanover.data.2012$SS<-as.numeric(as.character(hanover.data.2012$SS))

#2013
hanover.data.2013<-as.data.frame(hanover.data.2013)
hanover.data.2013<-hanover.data.2013[3:367,]
#Date handling
hanover.data.2013$X__1<-as.numeric(hanover.data.2013$X__1)
hanover.data.2013$X__1<-as.Date(hanover.data.2013$X__1,origin="1899-12-30")
hanover.data.2013<-data.frame("DATE"=hanover.data.2013$X__1,"BOD5"=hanover.data.2013$BOD5,"TKN"=hanover.data.2013$TKN,"NH3-N"=hanover.data.2013$`NH3-N`,"P-TOT"=hanover.data.2013$`P-TOT`,"SS"=hanover.data.2013$SS)

#change variables to numeric
hanover.data.2013$BOD5<-as.numeric(as.character(hanover.data.2013$BOD5))
hanover.data.2013$TKN<-as.numeric(as.character(hanover.data.2013$TKN))
hanover.data.2013$NH3.N<-as.numeric(as.character(hanover.data.2013$NH3.N))
hanover.data.2013$P.TOT<-as.numeric(as.character(hanover.data.2013$P.TOT))
hanover.data.2013$SS<-as.numeric(as.character(hanover.data.2013$SS))

#2014
hanover.data.2014<-as.data.frame(hanover.data.2014)
hanover.data.2014<-hanover.data.2014[3:367,]
#Date handling
hanover.data.2014$X__1<-as.numeric(hanover.data.2014$X__1)
hanover.data.2014$X__1<-as.Date(hanover.data.2014$X__1,origin="1899-12-30")
hanover.data.2014<-data.frame("DATE"=hanover.data.2014$X__1,"BOD5"=hanover.data.2014$BOD5,"TKN"=hanover.data.2014$TKN,"NH3-N"=hanover.data.2014$`NH3-N`,"P-TOT"=hanover.data.2014$`P-TOT`,"SS"=hanover.data.2014$SS)

#change variables to numeric
hanover.data.2014$BOD5<-as.numeric(as.character(hanover.data.2014$BOD5))
hanover.data.2014$TKN<-as.numeric(as.character(hanover.data.2014$TKN))
hanover.data.2014$NH3.N<-as.numeric(as.character(hanover.data.2014$NH3.N))
hanover.data.2014$P.TOT<-as.numeric(as.character(hanover.data.2014$P.TOT))
hanover.data.2014$SS<-as.numeric(as.character(hanover.data.2014$SS))

#2015
hanover.data.2015<-as.data.frame(hanover.data.2015)
hanover.data.2015<-hanover.data.2015[3:367,]
#Date handling
hanover.data.2015$X__1<-as.numeric(hanover.data.2015$X__1)
hanover.data.2015$X__1<-as.Date(hanover.data.2015$X__1,origin="1899-12-30")
hanover.data.2015<-data.frame("DATE"=hanover.data.2015$X__1,"BOD5"=hanover.data.2015$BOD5,"TKN"=hanover.data.2015$TKN,"NH3-N"=hanover.data.2015$`NH3-N`,"P-TOT"=hanover.data.2015$`P-TOT`,"SS"=hanover.data.2015$SS)

#change variables to numeric
hanover.data.2015$BOD5<-as.numeric(as.character(hanover.data.2015$BOD5))
hanover.data.2015$TKN<-as.numeric(as.character(hanover.data.2015$TKN))
hanover.data.2015$NH3.N<-as.numeric(as.character(hanover.data.2015$NH3.N))
hanover.data.2015$P.TOT<-as.numeric(as.character(hanover.data.2015$P.TOT))
hanover.data.2015$SS<-as.numeric(as.character(hanover.data.2015$SS))

#2016
hanover.data.2016<-as.data.frame(hanover.data.2016)
hanover.data.2016<-hanover.data.2016[3:368,]
#Date handling
hanover.data.2016$X__1<-as.numeric(hanover.data.2016$X__1)
hanover.data.2016$X__1<-as.Date(hanover.data.2016$X__1,origin="1899-12-30")
hanover.data.2016<-data.frame("DATE"=hanover.data.2016$X__1,"BOD5"=hanover.data.2016$BOD5,"TKN"=hanover.data.2016$TKN,"NH3-N"=hanover.data.2016$`NH3-N`,"P-TOT"=hanover.data.2016$`P-TOT`,"SS"=hanover.data.2016$SS)

#change variables to numeric
hanover.data.2016$BOD5<-as.numeric(as.character(hanover.data.2016$BOD5))
hanover.data.2016$TKN<-as.numeric(as.character(hanover.data.2016$TKN))
hanover.data.2016$NH3.N<-as.numeric(as.character(hanover.data.2016$NH3.N))
hanover.data.2016$P.TOT<-as.numeric(as.character(hanover.data.2016$P.TOT))
hanover.data.2016$SS<-as.numeric(as.character(hanover.data.2016$SS))

#2017
hanover.data.2017<-as.data.frame(hanover.data.2017)
hanover.data.2017<-hanover.data.2017[3:367,]
#Date handling
hanover.data.2017$X__1<-as.numeric(hanover.data.2017$X__1)
hanover.data.2017$X__1<-as.Date(hanover.data.2017$X__1,origin="1899-12-30")
hanover.data.2017<-data.frame("DATE"=hanover.data.2017$X__1,"BOD5"=hanover.data.2017$BOD5,"TKN"=hanover.data.2017$TKN,"NH3-N"=hanover.data.2017$`NH3-N`,"P-TOT"=hanover.data.2017$`P-TOT`,"SS"=hanover.data.2017$SS)

#change variables to numeric
hanover.data.2017$BOD5<-as.numeric(as.character(hanover.data.2017$BOD5))
hanover.data.2017$TKN<-as.numeric(as.character(hanover.data.2017$TKN))
hanover.data.2017$NH3.N<-as.numeric(as.character(hanover.data.2017$NH3.N))
hanover.data.2017$P.TOT<-as.numeric(as.character(hanover.data.2017$P.TOT))
hanover.data.2017$SS<-as.numeric(as.character(hanover.data.2017$SS))

#hanover flow
hanover.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=1)
hanover.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=2)
hanover.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=3)
hanover.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=4)
hanover.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=5)
hanover.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=6)
hanover.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Hanover_Park_Outfall_2011-2020.xls',sheet=7)

hanover.flow.2011<-as.data.frame(hanover.flow.2011)
hanover.flow.2011<-hanover.flow.2011[3:367,]
hanover.flow.2011$X__1<-as.numeric(hanover.flow.2011$X__1)
hanover.flow.2011$X__1<-as.Date(hanover.flow.2011$X__1,origin="1899-12-30")
hanover.flow.2011$FLOW<-as.numeric(as.character(hanover.flow.2011$FLOW))
colnames(hanover.flow.2011)[colnames(hanover.flow.2011)=="X__1"]<-"DATE"
hanover.flow.2011<-data.frame("DATE"=hanover.flow.2011$DATE,"FLOW"=hanover.flow.2011$FLOW)

hanover.flow.2012<-as.data.frame(hanover.flow.2012)
hanover.flow.2012<-hanover.flow.2012[3:368,]
hanover.flow.2012$X__1<-as.numeric(hanover.flow.2012$X__1)
hanover.flow.2012$X__1<-as.Date(hanover.flow.2012$X__1,origin="1899-12-30")
hanover.flow.2012$FLOW<-as.numeric(as.character(hanover.flow.2012$FLOW))
colnames(hanover.flow.2012)[colnames(hanover.flow.2012)=="X__1"]<-"DATE"
hanover.flow.2012<-data.frame("DATE"=hanover.flow.2012$DATE,"FLOW"=hanover.flow.2012$FLOW)


hanover.flow.2013<-as.data.frame(hanover.flow.2013)
hanover.flow.2013<-hanover.flow.2013[3:367,]
hanover.flow.2013$X__1<-as.numeric(hanover.flow.2013$X__1)
hanover.flow.2013$X__1<-as.Date(hanover.flow.2013$X__1,origin="1899-12-30")
hanover.flow.2013$FLOW<-as.numeric(as.character(hanover.flow.2013$FLOW))
colnames(hanover.flow.2013)[colnames(hanover.flow.2013)=="X__1"]<-"DATE"
hanover.flow.2013<-data.frame("DATE"=hanover.flow.2013$DATE,"FLOW"=hanover.flow.2013$FLOW)

hanover.flow.2014<-as.data.frame(hanover.flow.2014)
hanover.flow.2014<-hanover.flow.2014[3:367,]
hanover.flow.2014$X__1<-as.numeric(hanover.flow.2014$X__1)
hanover.flow.2014$X__1<-as.Date(hanover.flow.2014$X__1,origin="1899-12-30")
hanover.flow.2014$FLOW<-as.numeric(as.character(hanover.flow.2014$FLOW))
colnames(hanover.flow.2014)[colnames(hanover.flow.2014)=="X__1"]<-"DATE"
hanover.flow.2014<-data.frame("DATE"=hanover.flow.2014$DATE,"FLOW"=hanover.flow.2014$FLOW)

hanover.flow.2015<-as.data.frame(hanover.flow.2015)
hanover.flow.2015<-hanover.flow.2015[3:367,]
hanover.flow.2015$X__1<-as.numeric(hanover.flow.2015$X__1)
hanover.flow.2015$X__1<-as.Date(hanover.flow.2015$X__1,origin="1899-12-30")
hanover.flow.2015$FLOW<-as.numeric(as.character(hanover.flow.2015$FLOW))
colnames(hanover.flow.2015)[colnames(hanover.flow.2015)=="X__1"]<-"DATE"
hanover.flow.2015<-data.frame("DATE"=hanover.flow.2015$DATE,"FLOW"=hanover.flow.2015$FLOW)

hanover.flow.2016<-as.data.frame(hanover.flow.2016)
hanover.flow.2016<-hanover.flow.2016[3:368,]
hanover.flow.2016$X__1<-as.numeric(hanover.flow.2016$X__1)
hanover.flow.2016$X__1<-as.Date(hanover.flow.2016$X__1,origin="1899-12-30")
hanover.flow.2016$FLOW<-as.numeric(as.character(hanover.flow.2016$FLOW))
colnames(hanover.flow.2016)[colnames(hanover.flow.2016)=="X__1"]<-"DATE"
hanover.flow.2016<-data.frame("DATE"=hanover.flow.2016$DATE,"FLOW"=hanover.flow.2016$FLOW)

hanover.flow.2017<-as.data.frame(hanover.flow.2017)
hanover.flow.2017<-hanover.flow.2017[3:367,]
hanover.flow.2017$X__1<-as.numeric(hanover.flow.2017$X__1)
hanover.flow.2017$X__1<-as.Date(hanover.flow.2017$X__1,origin="1899-12-30")
hanover.flow.2017$FLOW<-as.numeric(as.character(hanover.flow.2017$FLOW))
colnames(hanover.flow.2017)[colnames(hanover.flow.2017)=="X__1"]<-"DATE"
hanover.flow.2017<-data.frame("DATE"=hanover.flow.2017$DATE,"FLOW"=hanover.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
hanover.data.2011<-merge(x=hanover.data.2011,y=hanover.flow.2011,by="DATE",all.x=TRUE)

hanover.data.2012<-merge(x=hanover.data.2012,y=hanover.flow.2012,by="DATE",all.x=TRUE)
hanover.data.2013<-merge(x=hanover.data.2013,y=hanover.flow.2013,by="DATE",all.x=TRUE)
hanover.data.2014<-merge(x=hanover.data.2014,y=hanover.flow.2014,by="DATE",all.x=TRUE)
hanover.data.2015<-merge(x=hanover.data.2015,y=hanover.flow.2015,by="DATE",all.x=TRUE)
hanover.data.2016<-merge(x=hanover.data.2016,y=hanover.flow.2016,by="DATE",all.x=TRUE)
hanover.data.2017<-merge(x=hanover.data.2017,y=hanover.flow.2017,by="DATE",all.x=TRUE)

#Rowbind all the years
hanover.data.all<-rbind(hanover.data.2011,hanover.data.2012,hanover.data.2013,hanover.data.2014,hanover.data.2015,hanover.data.2016,hanover.data.2017)

#RAIN
hanover.data.all.rain<-merge(x=hanover.data.all,y=rainfall.data,by="DATE",all.x=TRUE)

#Need to add location locator
#Location 1=calumet, 2=egan,3=hanover park,4=kirie,5=lemont,6=obrien,7=southwest,8=west side
Location<-rep(3,nrow(hanover.data.all.rain))
hanover.data.all.rain<-data.frame(hanover.data.all.rain,"Location"=Location)
summary(hanover.data.all.rain)

#KIRIE
kirie.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=1)
kirie.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=2)
kirie.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=3)
kirie.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=4)
kirie.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=5)
kirie.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=6)
kirie.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Raw_2011-2020.xlsx',sheet=7)

#2011
kirie.data.2011<-as.data.frame(kirie.data.2011)
kirie.data.2011<-kirie.data.2011[3:367,]
#Date handling
kirie.data.2011$X__1<-as.numeric(kirie.data.2011$X__1)
kirie.data.2011$X__1<-as.Date(kirie.data.2011$X__1,origin="1899-12-30")
kirie.data.2011<-data.frame("DATE"=kirie.data.2011$X__1,"BOD5"=kirie.data.2011$BOD5,"TKN"=kirie.data.2011$TKN,"NH3-N"=kirie.data.2011$`NH3-N`,"P-TOT"=kirie.data.2011$`P-TOT`,"SS"=kirie.data.2011$SS)

#change variables to numeric
kirie.data.2011$BOD5<-as.numeric(as.character(kirie.data.2011$BOD5))
kirie.data.2011$TKN<-as.numeric(as.character(kirie.data.2011$TKN))
kirie.data.2011$NH3.N<-as.numeric(as.character(kirie.data.2011$NH3.N))
kirie.data.2011$P.TOT<-as.numeric(as.character(kirie.data.2011$P.TOT))
kirie.data.2011$SS<-as.numeric(as.character(kirie.data.2011$SS))

#2012
kirie.data.2012<-as.data.frame(kirie.data.2012)
kirie.data.2012<-kirie.data.2012[3:368,]
#Date handling
kirie.data.2012$X__1<-as.numeric(kirie.data.2012$X__1)
kirie.data.2012$X__1<-as.Date(kirie.data.2012$X__1,origin="1899-12-30")
kirie.data.2012<-data.frame("DATE"=kirie.data.2012$X__1,"BOD5"=kirie.data.2012$BOD5,"TKN"=kirie.data.2012$TKN,"NH3-N"=kirie.data.2012$`NH3-N`,"P-TOT"=kirie.data.2012$`P-TOT`,"SS"=kirie.data.2012$SS)

#change variables to numeric
kirie.data.2012$BOD5<-as.numeric(as.character(kirie.data.2012$BOD5))
kirie.data.2012$TKN<-as.numeric(as.character(kirie.data.2012$TKN))
kirie.data.2012$NH3.N<-as.numeric(as.character(kirie.data.2012$NH3.N))
kirie.data.2012$P.TOT<-as.numeric(as.character(kirie.data.2012$P.TOT))
kirie.data.2012$SS<-as.numeric(as.character(kirie.data.2012$SS))

#2013
kirie.data.2013<-as.data.frame(kirie.data.2013)
kirie.data.2013<-kirie.data.2013[3:367,]
#Date handling
kirie.data.2013$X__1<-as.numeric(kirie.data.2013$X__1)
kirie.data.2013$X__1<-as.Date(kirie.data.2013$X__1,origin="1899-12-30")
kirie.data.2013<-data.frame("DATE"=kirie.data.2013$X__1,"BOD5"=kirie.data.2013$BOD5,"TKN"=kirie.data.2013$TKN,"NH3-N"=kirie.data.2013$`NH3-N`,"P-TOT"=kirie.data.2013$`P-TOT`,"SS"=kirie.data.2013$SS)

#change variables to numeric
kirie.data.2013$BOD5<-as.numeric(as.character(kirie.data.2013$BOD5))
kirie.data.2013$TKN<-as.numeric(as.character(kirie.data.2013$TKN))
kirie.data.2013$NH3.N<-as.numeric(as.character(kirie.data.2013$NH3.N))
kirie.data.2013$P.TOT<-as.numeric(as.character(kirie.data.2013$P.TOT))
kirie.data.2013$SS<-as.numeric(as.character(kirie.data.2013$SS))

#2014
kirie.data.2014<-as.data.frame(kirie.data.2014)
kirie.data.2014<-kirie.data.2014[3:367,]
#Date handling
kirie.data.2014$X__1<-as.numeric(kirie.data.2014$X__1)
kirie.data.2014$X__1<-as.Date(kirie.data.2014$X__1,origin="1899-12-30")
kirie.data.2014<-data.frame("DATE"=kirie.data.2014$X__1,"BOD5"=kirie.data.2014$BOD5,"TKN"=kirie.data.2014$TKN,"NH3-N"=kirie.data.2014$`NH3-N`,"P-TOT"=kirie.data.2014$`P-TOT`,"SS"=kirie.data.2014$SS)

#change variables to numeric
kirie.data.2014$BOD5<-as.numeric(as.character(kirie.data.2014$BOD5))
kirie.data.2014$TKN<-as.numeric(as.character(kirie.data.2014$TKN))
kirie.data.2014$NH3.N<-as.numeric(as.character(kirie.data.2014$NH3.N))
kirie.data.2014$P.TOT<-as.numeric(as.character(kirie.data.2014$P.TOT))
kirie.data.2014$SS<-as.numeric(as.character(kirie.data.2014$SS))

#2015
kirie.data.2015<-as.data.frame(kirie.data.2015)
kirie.data.2015<-kirie.data.2015[3:367,]
#Date handling
kirie.data.2015$X__1<-as.numeric(kirie.data.2015$X__1)
kirie.data.2015$X__1<-as.Date(kirie.data.2015$X__1,origin="1899-12-30")
kirie.data.2015<-data.frame("DATE"=kirie.data.2015$X__1,"BOD5"=kirie.data.2015$BOD5,"TKN"=kirie.data.2015$TKN,"NH3-N"=kirie.data.2015$`NH3-N`,"P-TOT"=kirie.data.2015$`P-TOT`,"SS"=kirie.data.2015$SS)

#change variables to numeric
kirie.data.2015$BOD5<-as.numeric(as.character(kirie.data.2015$BOD5))
kirie.data.2015$TKN<-as.numeric(as.character(kirie.data.2015$TKN))
kirie.data.2015$NH3.N<-as.numeric(as.character(kirie.data.2015$NH3.N))
kirie.data.2015$P.TOT<-as.numeric(as.character(kirie.data.2015$P.TOT))
kirie.data.2015$SS<-as.numeric(as.character(kirie.data.2015$SS))

#2016
kirie.data.2016<-as.data.frame(kirie.data.2016)
kirie.data.2016<-kirie.data.2016[3:368,]
#Date handling
kirie.data.2016$X__1<-as.numeric(kirie.data.2016$X__1)
kirie.data.2016$X__1<-as.Date(kirie.data.2016$X__1,origin="1899-12-30")
kirie.data.2016<-data.frame("DATE"=kirie.data.2016$X__1,"BOD5"=kirie.data.2016$BOD5,"TKN"=kirie.data.2016$TKN,"NH3-N"=kirie.data.2016$`NH3-N`,"P-TOT"=kirie.data.2016$`P-TOT`,"SS"=kirie.data.2016$SS)

#change variables to numeric
kirie.data.2016$BOD5<-as.numeric(as.character(kirie.data.2016$BOD5))
kirie.data.2016$TKN<-as.numeric(as.character(kirie.data.2016$TKN))
kirie.data.2016$NH3.N<-as.numeric(as.character(kirie.data.2016$NH3.N))
kirie.data.2016$P.TOT<-as.numeric(as.character(kirie.data.2016$P.TOT))
kirie.data.2016$SS<-as.numeric(as.character(kirie.data.2016$SS))

#2017
kirie.data.2017<-as.data.frame(kirie.data.2017)
kirie.data.2017<-kirie.data.2017[3:367,]
#Date handling
kirie.data.2017$X__1<-as.numeric(kirie.data.2017$X__1)
kirie.data.2017$X__1<-as.Date(kirie.data.2017$X__1,origin="1899-12-30")
kirie.data.2017<-data.frame("DATE"=kirie.data.2017$X__1,"BOD5"=kirie.data.2017$BOD5,"TKN"=kirie.data.2017$TKN,"NH3-N"=kirie.data.2017$`NH3-N`,"P-TOT"=kirie.data.2017$`P-TOT`,"SS"=kirie.data.2017$SS)

#change variables to numeric
kirie.data.2017$BOD5<-as.numeric(as.character(kirie.data.2017$BOD5))
kirie.data.2017$TKN<-as.numeric(as.character(kirie.data.2017$TKN))
kirie.data.2017$NH3.N<-as.numeric(as.character(kirie.data.2017$NH3.N))
kirie.data.2017$P.TOT<-as.numeric(as.character(kirie.data.2017$P.TOT))
kirie.data.2017$SS<-as.numeric(as.character(kirie.data.2017$SS))

#kirie flow
kirie.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=1)
kirie.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=2)
kirie.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=3)
kirie.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=4)
kirie.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=5)
kirie.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=6)
kirie.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Kirie_Outfall_2011-2020.xlsx',sheet=7)

kirie.flow.2011<-as.data.frame(kirie.flow.2011)
colnames(kirie.flow.2011)[colnames(kirie.flow.2011)=="X__1"]<-"DATE"
colnames(kirie.flow.2011)[colnames(kirie.flow.2011)=="FLOW"|colnames(kirie.flow.2011)=="Flow"]<-"FLOW"
kirie.flow.2011$FLOW<-as.numeric(as.character(kirie.flow.2011$FLOW))
kirie.flow.2011<-kirie.flow.2011[3:367,]
kirie.flow.2011$DATE<-as.numeric(kirie.flow.2011$DATE)
kirie.flow.2011$DATE<-as.Date(kirie.flow.2011$DATE,origin="1899-12-30")
kirie.flow.2011<-data.frame("DATE"=kirie.flow.2011$DATE,"FLOW"=kirie.flow.2011$FLOW)

kirie.flow.2012<-as.data.frame(kirie.flow.2012)
colnames(kirie.flow.2012)[colnames(kirie.flow.2012)=="X__1"]<-"DATE"
colnames(kirie.flow.2012)[colnames(kirie.flow.2012)=="FLOW"|colnames(kirie.flow.2012)=="Flow"]<-"FLOW"
kirie.flow.2012$FLOW<-as.numeric(as.character(kirie.flow.2012$FLOW))
kirie.flow.2012<-kirie.flow.2012[3:368,]
kirie.flow.2012$DATE<-as.numeric(kirie.flow.2012$DATE)
kirie.flow.2012$DATE<-as.Date(kirie.flow.2012$DATE,origin="1899-12-30")
kirie.flow.2012<-data.frame("DATE"=kirie.flow.2012$DATE,"FLOW"=kirie.flow.2012$FLOW)

kirie.flow.2013<-as.data.frame(kirie.flow.2013)
colnames(kirie.flow.2013)[colnames(kirie.flow.2013)=="X__1"]<-"DATE"
colnames(kirie.flow.2013)[colnames(kirie.flow.2013)=="FLOW"|colnames(kirie.flow.2013)=="Flow"]<-"FLOW"
kirie.flow.2013$FLOW<-as.numeric(as.character(kirie.flow.2013$FLOW))
kirie.flow.2013<-kirie.flow.2013[3:367,]
kirie.flow.2013$DATE<-as.numeric(kirie.flow.2013$DATE)
kirie.flow.2013$DATE<-as.Date(kirie.flow.2013$DATE,origin="1899-12-30")
kirie.flow.2013<-data.frame("DATE"=kirie.flow.2013$DATE,"FLOW"=kirie.flow.2013$FLOW)

kirie.flow.2014<-as.data.frame(kirie.flow.2014)
colnames(kirie.flow.2014)[colnames(kirie.flow.2014)=="X__1"]<-"DATE"
colnames(kirie.flow.2014)[colnames(kirie.flow.2014)=="FLOW"|colnames(kirie.flow.2014)=="Flow"]<-"FLOW"
kirie.flow.2014$FLOW<-as.numeric(as.character(kirie.flow.2014$FLOW))
kirie.flow.2014<-kirie.flow.2014[3:367,]
kirie.flow.2014$DATE<-as.numeric(kirie.flow.2014$DATE)
kirie.flow.2014$DATE<-as.Date(kirie.flow.2014$DATE,origin="1899-12-30")
kirie.flow.2014<-data.frame("DATE"=kirie.flow.2014$DATE,"FLOW"=kirie.flow.2014$FLOW)

kirie.flow.2015<-as.data.frame(kirie.flow.2015)
colnames(kirie.flow.2015)[colnames(kirie.flow.2015)=="X__1"]<-"DATE"
colnames(kirie.flow.2015)[colnames(kirie.flow.2015)=="FLOW"|colnames(kirie.flow.2015)=="Flow"]<-"FLOW"
kirie.flow.2015$FLOW<-as.numeric(as.character(kirie.flow.2015$FLOW))
kirie.flow.2015<-kirie.flow.2015[3:367,]
kirie.flow.2015$DATE<-as.numeric(kirie.flow.2015$DATE)
kirie.flow.2015$DATE<-as.Date(kirie.flow.2015$DATE,origin="1899-12-30")
kirie.flow.2015<-data.frame("DATE"=kirie.flow.2015$DATE,"FLOW"=kirie.flow.2015$FLOW)

kirie.flow.2016<-as.data.frame(kirie.flow.2016)
colnames(kirie.flow.2016)[colnames(kirie.flow.2016)=="X__1"]<-"DATE"
colnames(kirie.flow.2016)[colnames(kirie.flow.2016)=="FLOW"|colnames(kirie.flow.2016)=="Flow"]<-"FLOW"
kirie.flow.2016$FLOW<-as.numeric(as.character(kirie.flow.2016$FLOW))
kirie.flow.2016<-kirie.flow.2016[3:368,]
kirie.flow.2016$DATE<-as.numeric(kirie.flow.2016$DATE)
kirie.flow.2016$DATE<-as.Date(kirie.flow.2016$DATE,origin="1899-12-30")
kirie.flow.2016<-data.frame("DATE"=kirie.flow.2016$DATE,"FLOW"=kirie.flow.2016$FLOW)

kirie.flow.2017<-as.data.frame(kirie.flow.2017)
colnames(kirie.flow.2017)[colnames(kirie.flow.2017)=="X__1"]<-"DATE"
colnames(kirie.flow.2017)[colnames(kirie.flow.2017)=="FLOW"|colnames(kirie.flow.2017)=="Flow"]<-"FLOW"
kirie.flow.2017$FLOW<-as.numeric(as.character(kirie.flow.2017$FLOW))
kirie.flow.2017<-kirie.flow.2017[3:367,]
kirie.flow.2017$DATE<-as.numeric(kirie.flow.2017$DATE)
kirie.flow.2017$DATE<-as.Date(kirie.flow.2017$DATE,origin="1899-12-30")
kirie.flow.2017<-data.frame("DATE"=kirie.flow.2017$DATE,"FLOW"=kirie.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
kirie.data.2011<-merge(x=kirie.data.2011,y=kirie.flow.2011,by="DATE",all.x=TRUE)

kirie.data.2012<-merge(x=kirie.data.2012,y=kirie.flow.2012,by="DATE",all.x=TRUE)
kirie.data.2013<-merge(x=kirie.data.2013,y=kirie.flow.2013,by="DATE",all.x=TRUE)
kirie.data.2014<-merge(x=kirie.data.2014,y=kirie.flow.2014,by="DATE",all.x=TRUE)
kirie.data.2015<-merge(x=kirie.data.2015,y=kirie.flow.2015,by="DATE",all.x=TRUE)
kirie.data.2016<-merge(x=kirie.data.2016,y=kirie.flow.2016,by="DATE",all.x=TRUE)
kirie.data.2017<-merge(x=kirie.data.2017,y=kirie.flow.2017,by="DATE",all.x=TRUE)

#Rowbind all the years
kirie.data.all<-rbind(kirie.data.2011,kirie.data.2012,kirie.data.2013,kirie.data.2014,kirie.data.2015,kirie.data.2016,kirie.data.2017)

#KIRIE.rain
kirie.data.all.rain<-merge(x=kirie.data.all,y=rainfall.data,by="DATE",all.x=TRUE)

#Need to add location locator
#Location 1=kirie, 2=kirie,3=kirie park,4=kirie,5=lemont,6=obrien,7=southwest,8=west side
Location<-rep(4,nrow(kirie.data.all.rain))
kirie.data.all.rain<-data.frame(kirie.data.all.rain,"Location"=Location)
summary(kirie.data.all.rain)

#Lemont

lemont.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=1)
lemont.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=2)
lemont.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=3)
lemont.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=4)
lemont.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=5)
lemont.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=6)
lemont.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Raw_2011-2020.xlsx',sheet=7)

#2011
lemont.data.2011<-as.data.frame(lemont.data.2011)
lemont.data.2011<-lemont.data.2011[3:367,]
#Date handling
lemont.data.2011$X__1<-as.numeric(lemont.data.2011$X__1)
lemont.data.2011$X__1<-as.Date(lemont.data.2011$X__1,origin="1899-12-30")
lemont.data.2011<-data.frame("DATE"=lemont.data.2011$X__1,"BOD5"=lemont.data.2011$BOD5,"TKN"=lemont.data.2011$TKN,"NH3-N"=lemont.data.2011$`NH3-N`,"P-TOT"=lemont.data.2011$`P-TOT`,"SS"=lemont.data.2011$SS)

#change variables to numeric
lemont.data.2011$BOD5<-as.numeric(as.character(lemont.data.2011$BOD5))
lemont.data.2011$TKN<-as.numeric(as.character(lemont.data.2011$TKN))
lemont.data.2011$NH3.N<-as.numeric(as.character(lemont.data.2011$NH3.N))
lemont.data.2011$P.TOT<-as.numeric(as.character(lemont.data.2011$P.TOT))
lemont.data.2011$SS<-as.numeric(as.character(lemont.data.2011$SS))

#2012
lemont.data.2012<-as.data.frame(lemont.data.2012)
lemont.data.2012<-lemont.data.2012[3:368,]
#Date handling
lemont.data.2012$X__1<-as.numeric(lemont.data.2012$X__1)
lemont.data.2012$X__1<-as.Date(lemont.data.2012$X__1,origin="1899-12-30")
lemont.data.2012<-data.frame("DATE"=lemont.data.2012$X__1,"BOD5"=lemont.data.2012$BOD5,"TKN"=lemont.data.2012$TKN,"NH3-N"=lemont.data.2012$`NH3-N`,"P-TOT"=lemont.data.2012$`P-TOT`,"SS"=lemont.data.2012$SS)

#change variables to numeric
lemont.data.2012$BOD5<-as.numeric(as.character(lemont.data.2012$BOD5))
lemont.data.2012$TKN<-as.numeric(as.character(lemont.data.2012$TKN))
lemont.data.2012$NH3.N<-as.numeric(as.character(lemont.data.2012$NH3.N))
lemont.data.2012$P.TOT<-as.numeric(as.character(lemont.data.2012$P.TOT))
lemont.data.2012$SS<-as.numeric(as.character(lemont.data.2012$SS))

#2013
lemont.data.2013<-as.data.frame(lemont.data.2013)
lemont.data.2013<-lemont.data.2013[3:367,]
#Date handling
lemont.data.2013$X__1<-as.numeric(lemont.data.2013$X__1)
lemont.data.2013$X__1<-as.Date(lemont.data.2013$X__1,origin="1899-12-30")
lemont.data.2013<-data.frame("DATE"=lemont.data.2013$X__1,"BOD5"=lemont.data.2013$BOD5,"TKN"=lemont.data.2013$TKN,"NH3-N"=lemont.data.2013$`NH3-N`,"P-TOT"=lemont.data.2013$`P-TOT`,"SS"=lemont.data.2013$SS)

#change variables to numeric
lemont.data.2013$BOD5<-as.numeric(as.character(lemont.data.2013$BOD5))
lemont.data.2013$TKN<-as.numeric(as.character(lemont.data.2013$TKN))
lemont.data.2013$NH3.N<-as.numeric(as.character(lemont.data.2013$NH3.N))
lemont.data.2013$P.TOT<-as.numeric(as.character(lemont.data.2013$P.TOT))
lemont.data.2013$SS<-as.numeric(as.character(lemont.data.2013$SS))

#2014
lemont.data.2014<-as.data.frame(lemont.data.2014)
lemont.data.2014<-lemont.data.2014[3:367,]
#Date handling
lemont.data.2014$X__1<-as.numeric(lemont.data.2014$X__1)
lemont.data.2014$X__1<-as.Date(lemont.data.2014$X__1,origin="1899-12-30")
lemont.data.2014<-data.frame("DATE"=lemont.data.2014$X__1,"BOD5"=lemont.data.2014$BOD5,"TKN"=lemont.data.2014$TKN,"NH3-N"=lemont.data.2014$`NH3-N`,"P-TOT"=lemont.data.2014$`P-TOT`,"SS"=lemont.data.2014$SS)

#change variables to numeric
lemont.data.2014$BOD5<-as.numeric(as.character(lemont.data.2014$BOD5))
lemont.data.2014$TKN<-as.numeric(as.character(lemont.data.2014$TKN))
lemont.data.2014$NH3.N<-as.numeric(as.character(lemont.data.2014$NH3.N))
lemont.data.2014$P.TOT<-as.numeric(as.character(lemont.data.2014$P.TOT))
lemont.data.2014$SS<-as.numeric(as.character(lemont.data.2014$SS))

#2015
lemont.data.2015<-as.data.frame(lemont.data.2015)
lemont.data.2015<-lemont.data.2015[3:367,]
#Date handling
lemont.data.2015$X__1<-as.numeric(lemont.data.2015$X__1)
lemont.data.2015$X__1<-as.Date(lemont.data.2015$X__1,origin="1899-12-30")
lemont.data.2015<-data.frame("DATE"=lemont.data.2015$X__1,"BOD5"=lemont.data.2015$BOD5,"TKN"=lemont.data.2015$TKN,"NH3-N"=lemont.data.2015$`NH3-N`,"P-TOT"=lemont.data.2015$`P-TOT`,"SS"=lemont.data.2015$SS)

#change variables to numeric
lemont.data.2015$BOD5<-as.numeric(as.character(lemont.data.2015$BOD5))
lemont.data.2015$TKN<-as.numeric(as.character(lemont.data.2015$TKN))
lemont.data.2015$NH3.N<-as.numeric(as.character(lemont.data.2015$NH3.N))
lemont.data.2015$P.TOT<-as.numeric(as.character(lemont.data.2015$P.TOT))
lemont.data.2015$SS<-as.numeric(as.character(lemont.data.2015$SS))

#2016
lemont.data.2016<-as.data.frame(lemont.data.2016)
lemont.data.2016<-lemont.data.2016[3:368,]
#Date handling
lemont.data.2016$X__1<-as.numeric(lemont.data.2016$X__1)
lemont.data.2016$X__1<-as.Date(lemont.data.2016$X__1,origin="1899-12-30")
lemont.data.2016<-data.frame("DATE"=lemont.data.2016$X__1,"BOD5"=lemont.data.2016$BOD5,"TKN"=lemont.data.2016$TKN,"NH3-N"=lemont.data.2016$`NH3-N`,"P-TOT"=lemont.data.2016$`P-TOT`,"SS"=lemont.data.2016$SS)

#change variables to numeric
lemont.data.2016$BOD5<-as.numeric(as.character(lemont.data.2016$BOD5))
lemont.data.2016$TKN<-as.numeric(as.character(lemont.data.2016$TKN))
lemont.data.2016$NH3.N<-as.numeric(as.character(lemont.data.2016$NH3.N))
lemont.data.2016$P.TOT<-as.numeric(as.character(lemont.data.2016$P.TOT))
lemont.data.2016$SS<-as.numeric(as.character(lemont.data.2016$SS))

#2017
lemont.data.2017<-as.data.frame(lemont.data.2017)
lemont.data.2017<-lemont.data.2017[3:367,]
#Date handling
lemont.data.2017$X__1<-as.numeric(lemont.data.2017$X__1)
lemont.data.2017$X__1<-as.Date(lemont.data.2017$X__1,origin="1899-12-30")
lemont.data.2017<-data.frame("DATE"=lemont.data.2017$X__1,"BOD5"=lemont.data.2017$BOD5,"TKN"=lemont.data.2017$TKN,"NH3-N"=lemont.data.2017$`NH3-N`,"P-TOT"=lemont.data.2017$`P-TOT`,"SS"=lemont.data.2017$SS)

#change variables to numeric
lemont.data.2017$BOD5<-as.numeric(as.character(lemont.data.2017$BOD5))
lemont.data.2017$TKN<-as.numeric(as.character(lemont.data.2017$TKN))
lemont.data.2017$NH3.N<-as.numeric(as.character(lemont.data.2017$NH3.N))
lemont.data.2017$P.TOT<-as.numeric(as.character(lemont.data.2017$P.TOT))
lemont.data.2017$SS<-as.numeric(as.character(lemont.data.2017$SS))

#lemont flow
lemont.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=1)
lemont.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=2)
lemont.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=3)
lemont.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=4)
lemont.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=5)
lemont.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=6)
lemont.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/Lemont_Outfall_2011-2020.xlsx',sheet=7)

lemont.flow.2011<-as.data.frame(lemont.flow.2011)
colnames(lemont.flow.2011)[colnames(lemont.flow.2011)=="X__1"]<-"DATE"
colnames(lemont.flow.2011)[colnames(lemont.flow.2011)=="FLOW"|colnames(lemont.flow.2011)=="Flow"]<-"FLOW"
lemont.flow.2011$FLOW<-as.numeric(as.character(lemont.flow.2011$FLOW))
lemont.flow.2011<-lemont.flow.2011[3:367,]
lemont.flow.2011$DATE<-as.numeric(lemont.flow.2011$DATE)
lemont.flow.2011$DATE<-as.Date(lemont.flow.2011$DATE,origin="1899-12-30")
lemont.flow.2011<-data.frame("DATE"=lemont.flow.2011$DATE,"FLOW"=lemont.flow.2011$FLOW)

lemont.flow.2012<-as.data.frame(lemont.flow.2012)
colnames(lemont.flow.2012)[colnames(lemont.flow.2012)=="X__1"]<-"DATE"
colnames(lemont.flow.2012)[colnames(lemont.flow.2012)=="FLOW"|colnames(lemont.flow.2012)=="Flow"]<-"FLOW"
lemont.flow.2012$FLOW<-as.numeric(as.character(lemont.flow.2012$FLOW))
lemont.flow.2012<-lemont.flow.2012[3:368,]
lemont.flow.2012$DATE<-as.numeric(lemont.flow.2012$DATE)
lemont.flow.2012$DATE<-as.Date(lemont.flow.2012$DATE,origin="1899-12-30")
lemont.flow.2012<-data.frame("DATE"=lemont.flow.2012$DATE,"FLOW"=lemont.flow.2012$FLOW)

lemont.flow.2013<-as.data.frame(lemont.flow.2013)
colnames(lemont.flow.2013)[colnames(lemont.flow.2013)=="X__1"]<-"DATE"
colnames(lemont.flow.2013)[colnames(lemont.flow.2013)=="FLOW"|colnames(lemont.flow.2013)=="Flow"]<-"FLOW"
lemont.flow.2013$FLOW<-as.numeric(as.character(lemont.flow.2013$FLOW))
lemont.flow.2013<-lemont.flow.2013[3:367,]
lemont.flow.2013$DATE<-as.numeric(lemont.flow.2013$DATE)
lemont.flow.2013$DATE<-as.Date(lemont.flow.2013$DATE,origin="1899-12-30")
lemont.flow.2013<-data.frame("DATE"=lemont.flow.2013$DATE,"FLOW"=lemont.flow.2013$FLOW)

lemont.flow.2014<-as.data.frame(lemont.flow.2014)
colnames(lemont.flow.2014)[colnames(lemont.flow.2014)=="X__1"]<-"DATE"
colnames(lemont.flow.2014)[colnames(lemont.flow.2014)=="FLOW"|colnames(lemont.flow.2014)=="Flow"]<-"FLOW"
lemont.flow.2014$FLOW<-as.numeric(as.character(lemont.flow.2014$FLOW))
lemont.flow.2014<-lemont.flow.2014[3:367,]
lemont.flow.2014$DATE<-as.numeric(lemont.flow.2014$DATE)
lemont.flow.2014$DATE<-as.Date(lemont.flow.2014$DATE,origin="1899-12-30")
lemont.flow.2014<-data.frame("DATE"=lemont.flow.2014$DATE,"FLOW"=lemont.flow.2014$FLOW)

lemont.flow.2015<-as.data.frame(lemont.flow.2015)
colnames(lemont.flow.2015)[colnames(lemont.flow.2015)=="X__1"]<-"DATE"
colnames(lemont.flow.2015)[colnames(lemont.flow.2015)=="FLOW"|colnames(lemont.flow.2015)=="Flow"]<-"FLOW"
lemont.flow.2015$FLOW<-as.numeric(as.character(lemont.flow.2015$FLOW))
lemont.flow.2015<-lemont.flow.2015[3:367,]
lemont.flow.2015$DATE<-as.numeric(lemont.flow.2015$DATE)
lemont.flow.2015$DATE<-as.Date(lemont.flow.2015$DATE,origin="1899-12-30")
lemont.flow.2015<-data.frame("DATE"=lemont.flow.2015$DATE,"FLOW"=lemont.flow.2015$FLOW)

lemont.flow.2016<-as.data.frame(lemont.flow.2016)
colnames(lemont.flow.2016)[colnames(lemont.flow.2016)=="X__1"]<-"DATE"
colnames(lemont.flow.2016)[colnames(lemont.flow.2016)=="FLOW"|colnames(lemont.flow.2016)=="Flow"]<-"FLOW"
lemont.flow.2016$FLOW<-as.numeric(as.character(lemont.flow.2016$FLOW))
lemont.flow.2016<-lemont.flow.2016[3:368,]
lemont.flow.2016$DATE<-as.numeric(lemont.flow.2016$DATE)
lemont.flow.2016$DATE<-as.Date(lemont.flow.2016$DATE,origin="1899-12-30")
lemont.flow.2016<-data.frame("DATE"=lemont.flow.2016$DATE,"FLOW"=lemont.flow.2016$FLOW)

lemont.flow.2017<-as.data.frame(lemont.flow.2017)
colnames(lemont.flow.2017)[colnames(lemont.flow.2017)=="X__1"]<-"DATE"
colnames(lemont.flow.2017)[colnames(lemont.flow.2017)=="FLOW"|colnames(lemont.flow.2017)=="Flow"]<-"FLOW"
lemont.flow.2017$FLOW<-as.numeric(as.character(lemont.flow.2017$FLOW))
lemont.flow.2017<-lemont.flow.2017[3:367,]
lemont.flow.2017$DATE<-as.numeric(lemont.flow.2017$DATE)
lemont.flow.2017$DATE<-as.Date(lemont.flow.2017$DATE,origin="1899-12-30")
lemont.flow.2017<-data.frame("DATE"=lemont.flow.2017$DATE,"FLOW"=lemont.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
lemont.data.2011<-merge(x=lemont.data.2011,y=lemont.flow.2011,by="DATE",all.x=TRUE)

lemont.data.2012<-merge(x=lemont.data.2012,y=lemont.flow.2012,by="DATE",all.x=TRUE)
lemont.data.2013<-merge(x=lemont.data.2013,y=lemont.flow.2013,by="DATE",all.x=TRUE)
lemont.data.2014<-merge(x=lemont.data.2014,y=lemont.flow.2014,by="DATE",all.x=TRUE)
lemont.data.2015<-merge(x=lemont.data.2015,y=lemont.flow.2015,by="DATE",all.x=TRUE)
lemont.data.2016<-merge(x=lemont.data.2016,y=lemont.flow.2016,by="DATE",all.x=TRUE)
lemont.data.2017<-merge(x=lemont.data.2017,y=lemont.flow.2017,by="DATE",all.x=TRUE)

#Rowbind all the years
lemont.data.all<-rbind(lemont.data.2011,lemont.data.2012,lemont.data.2013,lemont.data.2014,lemont.data.2015,lemont.data.2016,lemont.data.2017)

lemont.data.all.rain<-merge(x=lemont.data.all,y=rainfall.data,by="DATE",all.x=TRUE)

#Need to add location locator
#Location 1=lemont, 2=lemont,3=lemont park,4=lemont,5=lemont,6=obrien,7=southwest,8=west side
Location<-rep(5,nrow(lemont.data.all.rain))
lemont.data.all.rain<-data.frame(lemont.data.all.rain,"Location"=Location)
summary(lemont.data.all.rain)

#OBRIEN

obrien.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=1)
obrien.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=2)
obrien.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=3)
obrien.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=4)
obrien.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=5)
obrien.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=6)
obrien.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Raw_2011-2020.xlsx',sheet=7)

#2011
obrien.data.2011<-as.data.frame(obrien.data.2011)
obrien.data.2011<-obrien.data.2011[3:367,]
#Date handling
obrien.data.2011$X__1<-as.numeric(obrien.data.2011$X__1)
obrien.data.2011$X__1<-as.Date(obrien.data.2011$X__1,origin="1899-12-30")
obrien.data.2011<-data.frame("DATE"=obrien.data.2011$X__1,"BOD5"=obrien.data.2011$BOD5,"TKN"=obrien.data.2011$TKN,"NH3-N"=obrien.data.2011$`NH3-N`,"P-TOT"=obrien.data.2011$`P-TOT`,"SS"=obrien.data.2011$SS)

#change variables to numeric
obrien.data.2011$BOD5<-as.numeric(as.character(obrien.data.2011$BOD5))
obrien.data.2011$TKN<-as.numeric(as.character(obrien.data.2011$TKN))
obrien.data.2011$NH3.N<-as.numeric(as.character(obrien.data.2011$NH3.N))
obrien.data.2011$P.TOT<-as.numeric(as.character(obrien.data.2011$P.TOT))
obrien.data.2011$SS<-as.numeric(as.character(obrien.data.2011$SS))

#2012
obrien.data.2012<-as.data.frame(obrien.data.2012)
obrien.data.2012<-obrien.data.2012[3:368,]
#Date handling
obrien.data.2012$X__1<-as.numeric(obrien.data.2012$X__1)
obrien.data.2012$X__1<-as.Date(obrien.data.2012$X__1,origin="1899-12-30")
obrien.data.2012<-data.frame("DATE"=obrien.data.2012$X__1,"BOD5"=obrien.data.2012$BOD5,"TKN"=obrien.data.2012$TKN,"NH3-N"=obrien.data.2012$`NH3-N`,"P-TOT"=obrien.data.2012$`P-TOT`,"SS"=obrien.data.2012$SS)

#change variables to numeric
obrien.data.2012$BOD5<-as.numeric(as.character(obrien.data.2012$BOD5))
obrien.data.2012$TKN<-as.numeric(as.character(obrien.data.2012$TKN))
obrien.data.2012$NH3.N<-as.numeric(as.character(obrien.data.2012$NH3.N))
obrien.data.2012$P.TOT<-as.numeric(as.character(obrien.data.2012$P.TOT))
obrien.data.2012$SS<-as.numeric(as.character(obrien.data.2012$SS))

#2013
obrien.data.2013<-as.data.frame(obrien.data.2013)
obrien.data.2013<-obrien.data.2013[3:367,]
#Date handling
obrien.data.2013$X__1<-as.numeric(obrien.data.2013$X__1)
obrien.data.2013$X__1<-as.Date(obrien.data.2013$X__1,origin="1899-12-30")
obrien.data.2013<-data.frame("DATE"=obrien.data.2013$X__1,"BOD5"=obrien.data.2013$BOD5,"TKN"=obrien.data.2013$TKN,"NH3-N"=obrien.data.2013$`NH3-N`,"P-TOT"=obrien.data.2013$`P-TOT`,"SS"=obrien.data.2013$SS)

#change variables to numeric
obrien.data.2013$BOD5<-as.numeric(as.character(obrien.data.2013$BOD5))
obrien.data.2013$TKN<-as.numeric(as.character(obrien.data.2013$TKN))
obrien.data.2013$NH3.N<-as.numeric(as.character(obrien.data.2013$NH3.N))
obrien.data.2013$P.TOT<-as.numeric(as.character(obrien.data.2013$P.TOT))
obrien.data.2013$SS<-as.numeric(as.character(obrien.data.2013$SS))

#2014
obrien.data.2014<-as.data.frame(obrien.data.2014)
obrien.data.2014<-obrien.data.2014[3:367,]
#Date handling
obrien.data.2014$X__1<-as.numeric(obrien.data.2014$X__1)
obrien.data.2014$X__1<-as.Date(obrien.data.2014$X__1,origin="1899-12-30")
obrien.data.2014<-data.frame("DATE"=obrien.data.2014$X__1,"BOD5"=obrien.data.2014$BOD5,"TKN"=obrien.data.2014$TKN,"NH3-N"=obrien.data.2014$`NH3-N`,"P-TOT"=obrien.data.2014$`P-TOT`,"SS"=obrien.data.2014$SS)

#change variables to numeric
obrien.data.2014$BOD5<-as.numeric(as.character(obrien.data.2014$BOD5))
obrien.data.2014$TKN<-as.numeric(as.character(obrien.data.2014$TKN))
obrien.data.2014$NH3.N<-as.numeric(as.character(obrien.data.2014$NH3.N))
obrien.data.2014$P.TOT<-as.numeric(as.character(obrien.data.2014$P.TOT))
obrien.data.2014$SS<-as.numeric(as.character(obrien.data.2014$SS))

#2015
obrien.data.2015<-as.data.frame(obrien.data.2015)
obrien.data.2015<-obrien.data.2015[3:367,]
#Date handling
obrien.data.2015$X__1<-as.numeric(obrien.data.2015$X__1)
obrien.data.2015$X__1<-as.Date(obrien.data.2015$X__1,origin="1899-12-30")
obrien.data.2015<-data.frame("DATE"=obrien.data.2015$X__1,"BOD5"=obrien.data.2015$BOD5,"TKN"=obrien.data.2015$TKN,"NH3-N"=obrien.data.2015$`NH3-N`,"P-TOT"=obrien.data.2015$`P-TOT`,"SS"=obrien.data.2015$SS)

#change variables to numeric
obrien.data.2015$BOD5<-as.numeric(as.character(obrien.data.2015$BOD5))
obrien.data.2015$TKN<-as.numeric(as.character(obrien.data.2015$TKN))
obrien.data.2015$NH3.N<-as.numeric(as.character(obrien.data.2015$NH3.N))
obrien.data.2015$P.TOT<-as.numeric(as.character(obrien.data.2015$P.TOT))
obrien.data.2015$SS<-as.numeric(as.character(obrien.data.2015$SS))

#2016
obrien.data.2016<-as.data.frame(obrien.data.2016)
obrien.data.2016<-obrien.data.2016[3:368,]
#Date handling
obrien.data.2016$X__1<-as.numeric(obrien.data.2016$X__1)
obrien.data.2016$X__1<-as.Date(obrien.data.2016$X__1,origin="1899-12-30")
obrien.data.2016<-data.frame("DATE"=obrien.data.2016$X__1,"BOD5"=obrien.data.2016$BOD5,"TKN"=obrien.data.2016$TKN,"NH3-N"=obrien.data.2016$`NH3-N`,"P-TOT"=obrien.data.2016$`P-TOT`,"SS"=obrien.data.2016$SS)

#change variables to numeric
obrien.data.2016$BOD5<-as.numeric(as.character(obrien.data.2016$BOD5))
obrien.data.2016$TKN<-as.numeric(as.character(obrien.data.2016$TKN))
obrien.data.2016$NH3.N<-as.numeric(as.character(obrien.data.2016$NH3.N))
obrien.data.2016$P.TOT<-as.numeric(as.character(obrien.data.2016$P.TOT))
obrien.data.2016$SS<-as.numeric(as.character(obrien.data.2016$SS))

#2017
obrien.data.2017<-as.data.frame(obrien.data.2017)
obrien.data.2017<-obrien.data.2017[3:367,]
#Date handling
obrien.data.2017$X__1<-as.numeric(obrien.data.2017$X__1)
obrien.data.2017$X__1<-as.Date(obrien.data.2017$X__1,origin="1899-12-30")
obrien.data.2017<-data.frame("DATE"=obrien.data.2017$X__1,"BOD5"=obrien.data.2017$BOD5,"TKN"=obrien.data.2017$TKN,"NH3-N"=obrien.data.2017$`NH3-N`,"P-TOT"=obrien.data.2017$`P-TOT`,"SS"=obrien.data.2017$SS)

#change variables to numeric
obrien.data.2017$BOD5<-as.numeric(as.character(obrien.data.2017$BOD5))
obrien.data.2017$TKN<-as.numeric(as.character(obrien.data.2017$TKN))
obrien.data.2017$NH3.N<-as.numeric(as.character(obrien.data.2017$NH3.N))
obrien.data.2017$P.TOT<-as.numeric(as.character(obrien.data.2017$P.TOT))
obrien.data.2017$SS<-as.numeric(as.character(obrien.data.2017$SS))

#obrien flow
obrien.flow.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=1)
obrien.flow.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=2)
obrien.flow.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=3)
obrien.flow.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=4)
obrien.flow.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=5)
obrien.flow.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=6)
obrien.flow.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/OBrien_Outfall_2011-2020.xlsx',sheet=7)

obrien.flow.2011<-as.data.frame(obrien.flow.2011)
colnames(obrien.flow.2011)[colnames(obrien.flow.2011)=="X__1"]<-"DATE"
colnames(obrien.flow.2011)[colnames(obrien.flow.2011)=="FLOW"|colnames(obrien.flow.2011)=="Flow"]<-"FLOW"
obrien.flow.2011$FLOW<-as.numeric(as.character(obrien.flow.2011$FLOW))
obrien.flow.2011<-obrien.flow.2011[3:367,]
obrien.flow.2011$DATE<-as.numeric(obrien.flow.2011$DATE)
obrien.flow.2011$DATE<-as.Date(obrien.flow.2011$DATE,origin="1899-12-30")
obrien.flow.2011<-data.frame("DATE"=obrien.flow.2011$DATE,"FLOW"=obrien.flow.2011$FLOW)

obrien.flow.2012<-as.data.frame(obrien.flow.2012)
colnames(obrien.flow.2012)[colnames(obrien.flow.2012)=="X__1"]<-"DATE"
colnames(obrien.flow.2012)[colnames(obrien.flow.2012)=="FLOW"|colnames(obrien.flow.2012)=="Flow"]<-"FLOW"
obrien.flow.2012$FLOW<-as.numeric(as.character(obrien.flow.2012$FLOW))
obrien.flow.2012<-obrien.flow.2012[3:368,]
obrien.flow.2012$DATE<-as.numeric(obrien.flow.2012$DATE)
obrien.flow.2012$DATE<-as.Date(obrien.flow.2012$DATE,origin="1899-12-30")
obrien.flow.2012<-data.frame("DATE"=obrien.flow.2012$DATE,"FLOW"=obrien.flow.2012$FLOW)

obrien.flow.2013<-as.data.frame(obrien.flow.2013)
colnames(obrien.flow.2013)[colnames(obrien.flow.2013)=="X__1"]<-"DATE"
colnames(obrien.flow.2013)[colnames(obrien.flow.2013)=="FLOW"|colnames(obrien.flow.2013)=="Flow"]<-"FLOW"
obrien.flow.2013$FLOW<-as.numeric(as.character(obrien.flow.2013$FLOW))
obrien.flow.2013<-obrien.flow.2013[3:367,]
obrien.flow.2013$DATE<-as.numeric(obrien.flow.2013$DATE)
obrien.flow.2013$DATE<-as.Date(obrien.flow.2013$DATE,origin="1899-12-30")
obrien.flow.2013<-data.frame("DATE"=obrien.flow.2013$DATE,"FLOW"=obrien.flow.2013$FLOW)

obrien.flow.2014<-as.data.frame(obrien.flow.2014)
colnames(obrien.flow.2014)[colnames(obrien.flow.2014)=="X__1"]<-"DATE"
colnames(obrien.flow.2014)[colnames(obrien.flow.2014)=="FLOW"|colnames(obrien.flow.2014)=="Flow"]<-"FLOW"
obrien.flow.2014$FLOW<-as.numeric(as.character(obrien.flow.2014$FLOW))
obrien.flow.2014<-obrien.flow.2014[3:367,]
obrien.flow.2014$DATE<-as.numeric(obrien.flow.2014$DATE)
obrien.flow.2014$DATE<-as.Date(obrien.flow.2014$DATE,origin="1899-12-30")
obrien.flow.2014<-data.frame("DATE"=obrien.flow.2014$DATE,"FLOW"=obrien.flow.2014$FLOW)

obrien.flow.2015<-as.data.frame(obrien.flow.2015)
colnames(obrien.flow.2015)[colnames(obrien.flow.2015)=="X__1"]<-"DATE"
colnames(obrien.flow.2015)[colnames(obrien.flow.2015)=="FLOW"|colnames(obrien.flow.2015)=="Flow"]<-"FLOW"
obrien.flow.2015$FLOW<-as.numeric(as.character(obrien.flow.2015$FLOW))
obrien.flow.2015<-obrien.flow.2015[3:367,]
obrien.flow.2015$DATE<-as.numeric(obrien.flow.2015$DATE)
obrien.flow.2015$DATE<-as.Date(obrien.flow.2015$DATE,origin="1899-12-30")
obrien.flow.2015<-data.frame("DATE"=obrien.flow.2015$DATE,"FLOW"=obrien.flow.2015$FLOW)

obrien.flow.2016<-as.data.frame(obrien.flow.2016)
colnames(obrien.flow.2016)[colnames(obrien.flow.2016)=="X__1"]<-"DATE"
colnames(obrien.flow.2016)[colnames(obrien.flow.2016)=="FLOW"|colnames(obrien.flow.2016)=="Flow"]<-"FLOW"
obrien.flow.2016$FLOW<-as.numeric(as.character(obrien.flow.2016$FLOW))
obrien.flow.2016<-obrien.flow.2016[3:368,]
obrien.flow.2016$DATE<-as.numeric(obrien.flow.2016$DATE)
obrien.flow.2016$DATE<-as.Date(obrien.flow.2016$DATE,origin="1899-12-30")
obrien.flow.2016<-data.frame("DATE"=obrien.flow.2016$DATE,"FLOW"=obrien.flow.2016$FLOW)

obrien.flow.2017<-as.data.frame(obrien.flow.2017)
colnames(obrien.flow.2017)[colnames(obrien.flow.2017)=="X__1"]<-"DATE"
colnames(obrien.flow.2017)[colnames(obrien.flow.2017)=="FLOW"|colnames(obrien.flow.2017)=="Flow"]<-"FLOW"
obrien.flow.2017$FLOW<-as.numeric(as.character(obrien.flow.2017$FLOW))
obrien.flow.2017<-obrien.flow.2017[3:367,]
obrien.flow.2017$DATE<-as.numeric(obrien.flow.2017$DATE)
obrien.flow.2017$DATE<-as.Date(obrien.flow.2017$DATE,origin="1899-12-30")
obrien.flow.2017<-data.frame("DATE"=obrien.flow.2017$DATE,"FLOW"=obrien.flow.2017$FLOW)

#LEFT Join on Dates, becuase they may have have unequal dates
obrien.data.2011<-merge(x=obrien.data.2011,y=obrien.flow.2011,by="DATE",all.x=TRUE)

obrien.data.2012<-merge(x=obrien.data.2012,y=obrien.flow.2012,by="DATE",all.x=TRUE)
obrien.data.2013<-merge(x=obrien.data.2013,y=obrien.flow.2013,by="DATE",all.x=TRUE)
obrien.data.2014<-merge(x=obrien.data.2014,y=obrien.flow.2014,by="DATE",all.x=TRUE)
obrien.data.2015<-merge(x=obrien.data.2015,y=obrien.flow.2015,by="DATE",all.x=TRUE)
obrien.data.2016<-merge(x=obrien.data.2016,y=obrien.flow.2016,by="DATE",all.x=TRUE)
obrien.data.2017<-merge(x=obrien.data.2017,y=obrien.flow.2017,by="DATE",all.x=TRUE)

#Rowbind all the years
obrien.data.all<-rbind(obrien.data.2011,obrien.data.2012,obrien.data.2013,obrien.data.2014,obrien.data.2015,obrien.data.2016,obrien.data.2017)

obrien.data.all.rain<-merge(x=obrien.data.all,y=rainfall.data,by="DATE",all.x=TRUE)


#Need to add location locator
#Location 1=obrien, 2=obrien,3=obrien park,4=obrien,5=obrien,6=obrien,7=southwest,8=west side
Location<-rep(6,nrow(obrien.data.all.rain))
obrien.data.all.rain<-data.frame(obrien.data.all.rain,"Location"=Location)
summary(obrien.data.all.rain)

#southwest
southwest.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=1,col_names=TRUE)
southwest.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=2,col_names=TRUE)
southwest.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=3,col_names=TRUE)
southwest.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=4,col_names=TRUE)
southwest.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=5,col_names=TRUE)
southwest.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=6,col_names=TRUE)
southwest.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/South_West_Raw_2011-2020.xlsx',sheet=7,col_names=TRUE)

#2011
southwest.data.2011<-as.data.frame(southwest.data.2011)
southwest.data.2011<-southwest.data.2011[3:367,]
#Date handling
southwest.data.2011$X__1<-as.numeric(southwest.data.2011$X__1)
southwest.data.2011$X__1<-as.Date(southwest.data.2011$X__1,origin="1899-12-30")
southwest.data.2011<-data.frame("DATE"=southwest.data.2011$X__1,"BOD5"=southwest.data.2011$BOD5,"TKN"=southwest.data.2011$TKN,"NH3-N"=southwest.data.2011$`NH3-N`,"P-TOT"=southwest.data.2011$`P-TOT`,"SS"=southwest.data.2011$SS,"FLOW"=southwest.data.2011$FLOW)

#change variables to numeric
southwest.data.2011$BOD5<-as.numeric(as.character(southwest.data.2011$BOD5))
southwest.data.2011$TKN<-as.numeric(as.character(southwest.data.2011$TKN))
southwest.data.2011$NH3.N<-as.numeric(as.character(southwest.data.2011$NH3.N))
southwest.data.2011$P.TOT<-as.numeric(as.character(southwest.data.2011$P.TOT))
southwest.data.2011$SS<-as.numeric(as.character(southwest.data.2011$SS))
southwest.data.2011$FLOW<-as.numeric(as.character(southwest.data.2011$FLOW))




#2012
southwest.data.2012<-as.data.frame(southwest.data.2012)
southwest.data.2012<-southwest.data.2012[3:368,]
#Date handling
southwest.data.2012$X__1<-as.numeric(southwest.data.2012$X__1)
southwest.data.2012$X__1<-as.Date(southwest.data.2012$X__1,origin="1899-12-30")
southwest.data.2012<-data.frame("DATE"=southwest.data.2012$X__1,"BOD5"=southwest.data.2012$BOD5,"TKN"=southwest.data.2012$TKN,"NH3-N"=southwest.data.2012$`NH3-N`,"P-TOT"=southwest.data.2012$`P-TOT`,"SS"=southwest.data.2012$SS,"FLOW"=southwest.data.2012$FLOW)

#change variables to numeric
southwest.data.2012$BOD5<-as.numeric(as.character(southwest.data.2012$BOD5))
southwest.data.2012$TKN<-as.numeric(as.character(southwest.data.2012$TKN))
southwest.data.2012$NH3.N<-as.numeric(as.character(southwest.data.2012$NH3.N))
southwest.data.2012$P.TOT<-as.numeric(as.character(southwest.data.2012$P.TOT))
southwest.data.2012$SS<-as.numeric(as.character(southwest.data.2012$SS))
southwest.data.2012$FLOW<-as.numeric(as.character(southwest.data.2012$FLOW))


#2013
southwest.data.2013<-as.data.frame(southwest.data.2013)
southwest.data.2013<-southwest.data.2013[3:367,]
#Date handling
southwest.data.2013$X__1<-as.numeric(southwest.data.2013$X__1)
southwest.data.2013$X__1<-as.Date(southwest.data.2013$X__1,origin="1899-12-30")
southwest.data.2013<-data.frame("DATE"=southwest.data.2013$X__1,"BOD5"=southwest.data.2013$BOD5,"TKN"=southwest.data.2013$TKN,"NH3-N"=southwest.data.2013$`NH3-N`,"P-TOT"=southwest.data.2013$`P-TOT`,"SS"=southwest.data.2013$SS,"FLOW"=southwest.data.2013$FLOW)

#change variables to numeric
southwest.data.2013$BOD5<-as.numeric(as.character(southwest.data.2013$BOD5))
southwest.data.2013$TKN<-as.numeric(as.character(southwest.data.2013$TKN))
southwest.data.2013$NH3.N<-as.numeric(as.character(southwest.data.2013$NH3.N))
southwest.data.2013$P.TOT<-as.numeric(as.character(southwest.data.2013$P.TOT))
southwest.data.2013$SS<-as.numeric(as.character(southwest.data.2013$SS))
southwest.data.2013$FLOW<-as.numeric(as.character(southwest.data.2013$FLOW))


#2014
southwest.data.2014<-as.data.frame(southwest.data.2014)
southwest.data.2014<-southwest.data.2014[3:367,]
#Date handling
southwest.data.2014$X__1<-as.numeric(southwest.data.2014$X__1)
southwest.data.2014$X__1<-as.Date(southwest.data.2014$X__1,origin="1899-12-30")
southwest.data.2014<-data.frame("DATE"=southwest.data.2014$X__1,"BOD5"=southwest.data.2014$BOD5,"TKN"=southwest.data.2014$TKN,"NH3-N"=southwest.data.2014$`NH3-N`,"P-TOT"=southwest.data.2014$`P-TOT`,"SS"=southwest.data.2014$SS,"FLOW"=southwest.data.2014$FLOW)

#change variables to numeric
southwest.data.2014$BOD5<-as.numeric(as.character(southwest.data.2014$BOD5))
southwest.data.2014$TKN<-as.numeric(as.character(southwest.data.2014$TKN))
southwest.data.2014$NH3.N<-as.numeric(as.character(southwest.data.2014$NH3.N))
southwest.data.2014$P.TOT<-as.numeric(as.character(southwest.data.2014$P.TOT))
southwest.data.2014$SS<-as.numeric(as.character(southwest.data.2014$SS))
southwest.data.2014$FLOW<-as.numeric(as.character(southwest.data.2014$FLOW))
summary(southwest.data.2014)
#2015
southwest.data.2015<-as.data.frame(southwest.data.2015)
southwest.data.2015<-southwest.data.2015[3:367,]
#Date handling
southwest.data.2015$X__1<-as.numeric(southwest.data.2015$X__1)
southwest.data.2015$X__1<-as.Date(southwest.data.2015$X__1,origin="1899-12-30")
southwest.data.2015<-data.frame("DATE"=southwest.data.2015$X__1,"BOD5"=southwest.data.2015$BOD5,"TKN"=southwest.data.2015$TKN,"NH3-N"=southwest.data.2015$`NH3-N`,"P-TOT"=southwest.data.2015$`P-TOT`,"SS"=southwest.data.2015$SS,"FLOW"=southwest.data.2015$FLOW)

#change variables to numeric
southwest.data.2015$BOD5<-as.numeric(as.character(southwest.data.2015$BOD5))
southwest.data.2015$TKN<-as.numeric(as.character(southwest.data.2015$TKN))
southwest.data.2015$NH3.N<-as.numeric(as.character(southwest.data.2015$NH3.N))
southwest.data.2015$P.TOT<-as.numeric(as.character(southwest.data.2015$P.TOT))
southwest.data.2015$SS<-as.numeric(as.character(southwest.data.2015$SS))
southwest.data.2015$FLOW<-as.numeric(as.character(southwest.data.2015$FLOW))
summary(southwest.data.2015)
#2016
southwest.data.2016<-as.data.frame(southwest.data.2016)
southwest.data.2016<-southwest.data.2016[3:368,]
#Date handling
southwest.data.2016$X__1<-as.numeric(southwest.data.2016$X__1)
southwest.data.2016$X__1<-as.Date(southwest.data.2016$X__1,origin="1899-12-30")
southwest.data.2016<-data.frame("DATE"=southwest.data.2016$X__1,"BOD5"=southwest.data.2016$BOD5,"TKN"=southwest.data.2016$TKN,"NH3-N"=southwest.data.2016$`NH3-N`,"P-TOT"=southwest.data.2016$`P-TOT`,"SS"=southwest.data.2016$SS,"FLOW"=southwest.data.2016$FLOW)

#change variables to numeric
southwest.data.2016$BOD5<-as.numeric(as.character(southwest.data.2016$BOD5))
southwest.data.2016$TKN<-as.numeric(as.character(southwest.data.2016$TKN))
southwest.data.2016$NH3.N<-as.numeric(as.character(southwest.data.2016$NH3.N))
southwest.data.2016$P.TOT<-as.numeric(as.character(southwest.data.2016$P.TOT))
southwest.data.2016$SS<-as.numeric(as.character(southwest.data.2016$SS))
southwest.data.2016$FLOW<-as.numeric(as.character(southwest.data.2016$FLOW))
summary(southwest.data.2016)
#2017
southwest.data.2017<-as.data.frame(southwest.data.2017)
southwest.data.2017<-southwest.data.2017[3:367,]
#Date handling
southwest.data.2017$X__1<-as.numeric(southwest.data.2017$X__1)
southwest.data.2017$X__1<-as.Date(southwest.data.2017$X__1,origin="1899-12-30")
southwest.data.2017<-data.frame("DATE"=southwest.data.2017$X__1,"BOD5"=southwest.data.2017$BOD5,"TKN"=southwest.data.2017$TKN,"NH3-N"=southwest.data.2017$`NH3-N`,"P-TOT"=southwest.data.2017$`P-TOT`,"SS"=southwest.data.2017$SS,"FLOW"=southwest.data.2017$FLOW)

#change variables to numeric
southwest.data.2017$BOD5<-as.numeric(as.character(southwest.data.2017$BOD5))
southwest.data.2017$TKN<-as.numeric(as.character(southwest.data.2017$TKN))
southwest.data.2017$NH3.N<-as.numeric(as.character(southwest.data.2017$NH3.N))
southwest.data.2017$P.TOT<-as.numeric(as.character(southwest.data.2017$P.TOT))
southwest.data.2017$SS<-as.numeric(as.character(southwest.data.2017$SS))
southwest.data.2017$FLOW<-as.numeric(as.character(southwest.data.2017$FLOW))
summary(southwest.data.2017)

#Rowbind all the years
southwest.data.all<-rbind(southwest.data.2011,southwest.data.2012,southwest.data.2013,southwest.data.2014,southwest.data.2015,southwest.data.2016,southwest.data.2017)

southwest.data.all.rain<-merge(x=southwest.data.all,y=rainfall.data,by="DATE",all.x=TRUE)

#Need to add location locator
#Location 1=southwest, 2=southwest,3=southwest park,4=southwest,5=southwest,6=southwest,7=southwest,8=west side
Location<-rep(7,nrow(southwest.data.all.rain))
southwest.data.all.rain<-data.frame(southwest.data.all.rain,"Location"=Location)
summary(southwest.data.all.rain)

#WEST
west.data.2011<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=1,col_names=TRUE)
west.data.2012<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=2,col_names=TRUE)
west.data.2013<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=3,col_names=TRUE)
west.data.2014<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=4,col_names=TRUE)
west.data.2015<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=5,col_names=TRUE)
west.data.2016<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=6,col_names=TRUE)
west.data.2017<-read_excel('C:/Users/boltz/Desktop/CSP571/project/raw data/West_Side_Raw_2011-2020.xlsx',sheet=7,col_names=TRUE)

#2011
west.data.2011<-as.data.frame(west.data.2011)
west.data.2011<-west.data.2011[3:367,]
#Date handling
west.data.2011$X__1<-as.numeric(west.data.2011$X__1)
west.data.2011$X__1<-as.Date(west.data.2011$X__1,origin="1899-12-30")
west.data.2011<-data.frame("DATE"=west.data.2011$X__1,"BOD5"=west.data.2011$BOD5,"TKN"=west.data.2011$TKN,"NH3-N"=west.data.2011$`NH3-N`,"P-TOT"=west.data.2011$`P-TOT`,"SS"=west.data.2011$SS,"FLOW"=west.data.2011$FLOW)

#change variables to numeric
west.data.2011$BOD5<-as.numeric(as.character(west.data.2011$BOD5))
west.data.2011$TKN<-as.numeric(as.character(west.data.2011$TKN))
west.data.2011$NH3.N<-as.numeric(as.character(west.data.2011$NH3.N))
west.data.2011$P.TOT<-as.numeric(as.character(west.data.2011$P.TOT))
west.data.2011$SS<-as.numeric(as.character(west.data.2011$SS))
west.data.2011$FLOW<-as.numeric(as.character(west.data.2011$FLOW))




#2012
west.data.2012<-as.data.frame(west.data.2012)
west.data.2012<-west.data.2012[3:368,]
#Date handling
west.data.2012$X__1<-as.numeric(west.data.2012$X__1)
west.data.2012$X__1<-as.Date(west.data.2012$X__1,origin="1899-12-30")
west.data.2012<-data.frame("DATE"=west.data.2012$X__1,"BOD5"=west.data.2012$BOD5,"TKN"=west.data.2012$TKN,"NH3-N"=west.data.2012$`NH3-N`,"P-TOT"=west.data.2012$`P-TOT`,"SS"=west.data.2012$SS,"FLOW"=west.data.2012$FLOW)

#change variables to numeric
west.data.2012$BOD5<-as.numeric(as.character(west.data.2012$BOD5))
west.data.2012$TKN<-as.numeric(as.character(west.data.2012$TKN))
west.data.2012$NH3.N<-as.numeric(as.character(west.data.2012$NH3.N))
west.data.2012$P.TOT<-as.numeric(as.character(west.data.2012$P.TOT))
west.data.2012$SS<-as.numeric(as.character(west.data.2012$SS))
west.data.2012$FLOW<-as.numeric(as.character(west.data.2012$FLOW))


#2013
west.data.2013<-as.data.frame(west.data.2013)
west.data.2013<-west.data.2013[3:367,]
#Date handling
west.data.2013$X__1<-as.numeric(west.data.2013$X__1)
west.data.2013$X__1<-as.Date(west.data.2013$X__1,origin="1899-12-30")
west.data.2013<-data.frame("DATE"=west.data.2013$X__1,"BOD5"=west.data.2013$BOD5,"TKN"=west.data.2013$TKN,"NH3-N"=west.data.2013$`NH3-N`,"P-TOT"=west.data.2013$`P-TOT`,"SS"=west.data.2013$SS,"FLOW"=west.data.2013$FLOW)

#change variables to numeric
west.data.2013$BOD5<-as.numeric(as.character(west.data.2013$BOD5))
west.data.2013$TKN<-as.numeric(as.character(west.data.2013$TKN))
west.data.2013$NH3.N<-as.numeric(as.character(west.data.2013$NH3.N))
west.data.2013$P.TOT<-as.numeric(as.character(west.data.2013$P.TOT))
west.data.2013$SS<-as.numeric(as.character(west.data.2013$SS))
west.data.2013$FLOW<-as.numeric(as.character(west.data.2013$FLOW))


#2014
west.data.2014<-as.data.frame(west.data.2014)
west.data.2014<-west.data.2014[3:367,]
#Date handling
west.data.2014$X__1<-as.numeric(west.data.2014$X__1)
west.data.2014$X__1<-as.Date(west.data.2014$X__1,origin="1899-12-30")
west.data.2014<-data.frame("DATE"=west.data.2014$X__1,"BOD5"=west.data.2014$BOD5,"TKN"=west.data.2014$TKN,"NH3-N"=west.data.2014$`NH3-N`,"P-TOT"=west.data.2014$`P-TOT`,"SS"=west.data.2014$SS,"FLOW"=west.data.2014$FLOW)

#change variables to numeric
west.data.2014$BOD5<-as.numeric(as.character(west.data.2014$BOD5))
west.data.2014$TKN<-as.numeric(as.character(west.data.2014$TKN))
west.data.2014$NH3.N<-as.numeric(as.character(west.data.2014$NH3.N))
west.data.2014$P.TOT<-as.numeric(as.character(west.data.2014$P.TOT))
west.data.2014$SS<-as.numeric(as.character(west.data.2014$SS))
west.data.2014$FLOW<-as.numeric(as.character(west.data.2014$FLOW))
summary(west.data.2014)
#2015
west.data.2015<-as.data.frame(west.data.2015)
west.data.2015<-west.data.2015[3:367,]
#Date handling
west.data.2015$X__1<-as.numeric(west.data.2015$X__1)
west.data.2015$X__1<-as.Date(west.data.2015$X__1,origin="1899-12-30")
west.data.2015<-data.frame("DATE"=west.data.2015$X__1,"BOD5"=west.data.2015$BOD5,"TKN"=west.data.2015$TKN,"NH3-N"=west.data.2015$`NH3-N`,"P-TOT"=west.data.2015$`P-TOT`,"SS"=west.data.2015$SS,"FLOW"=west.data.2015$FLOW)

#change variables to numeric
west.data.2015$BOD5<-as.numeric(as.character(west.data.2015$BOD5))
west.data.2015$TKN<-as.numeric(as.character(west.data.2015$TKN))
west.data.2015$NH3.N<-as.numeric(as.character(west.data.2015$NH3.N))
west.data.2015$P.TOT<-as.numeric(as.character(west.data.2015$P.TOT))
west.data.2015$SS<-as.numeric(as.character(west.data.2015$SS))
west.data.2015$FLOW<-as.numeric(as.character(west.data.2015$FLOW))
summary(west.data.2015)
#2016
west.data.2016<-as.data.frame(west.data.2016)
west.data.2016<-west.data.2016[3:368,]
#Date handling
west.data.2016$X__1<-as.numeric(west.data.2016$X__1)
west.data.2016$X__1<-as.Date(west.data.2016$X__1,origin="1899-12-30")
west.data.2016<-data.frame("DATE"=west.data.2016$X__1,"BOD5"=west.data.2016$BOD5,"TKN"=west.data.2016$TKN,"NH3-N"=west.data.2016$`NH3-N`,"P-TOT"=west.data.2016$`P-TOT`,"SS"=west.data.2016$SS,"FLOW"=west.data.2016$FLOW)

#change variables to numeric
west.data.2016$BOD5<-as.numeric(as.character(west.data.2016$BOD5))
west.data.2016$TKN<-as.numeric(as.character(west.data.2016$TKN))
west.data.2016$NH3.N<-as.numeric(as.character(west.data.2016$NH3.N))
west.data.2016$P.TOT<-as.numeric(as.character(west.data.2016$P.TOT))
west.data.2016$SS<-as.numeric(as.character(west.data.2016$SS))
west.data.2016$FLOW<-as.numeric(as.character(west.data.2016$FLOW))
summary(west.data.2016)
#2017
west.data.2017<-as.data.frame(west.data.2017)
west.data.2017<-west.data.2017[3:367,]
#Date handling
west.data.2017$X__1<-as.numeric(west.data.2017$X__1)
west.data.2017$X__1<-as.Date(west.data.2017$X__1,origin="1899-12-30")
west.data.2017<-data.frame("DATE"=west.data.2017$X__1,"BOD5"=west.data.2017$BOD5,"TKN"=west.data.2017$TKN,"NH3-N"=west.data.2017$`NH3-N`,"P-TOT"=west.data.2017$`P-TOT`,"SS"=west.data.2017$SS,"FLOW"=west.data.2017$FLOW)

#change variables to numeric
west.data.2017$BOD5<-as.numeric(as.character(west.data.2017$BOD5))
west.data.2017$TKN<-as.numeric(as.character(west.data.2017$TKN))
west.data.2017$NH3.N<-as.numeric(as.character(west.data.2017$NH3.N))
west.data.2017$P.TOT<-as.numeric(as.character(west.data.2017$P.TOT))
west.data.2017$SS<-as.numeric(as.character(west.data.2017$SS))
west.data.2017$FLOW<-as.numeric(as.character(west.data.2017$FLOW))
summary(west.data.2017)

#Rowbind all the years
west.data.all<-rbind(west.data.2011,west.data.2012,west.data.2013,west.data.2014,west.data.2015,west.data.2016,west.data.2017)

west.data.all.rain<-merge(x=west.data.all,y=rainfall.data,by="DATE",all.x=TRUE)



#Need to add location locator
#Location 1=west, 2=west,3=west park,4=west,5=west,6=west,7=west,8=west side
Location<-rep(8,nrow(west.data.all.rain))
west.data.all.rain<-data.frame(west.data.all.rain,"Location"=Location)
summary(west.data.all.rain)
dim(west.data.all.rain)
dim(obrien.data.all.rain)
dim(calumet.data.all.rain)

library(mice)
library(VIM)
#Row bind all the MWRD plants
all.mwrd<-rbind(calumet.data.all.rain,egan.data.all.rain,hanover.data.all.rain,kirie.data.all.rain,lemont.data.all.rain,obrien.data.all.rain,southwest.data.all.rain,west.data.all.rain)
summary(all.mwrd)
mice_plot<-aggr(all.mwrd, col=c('navyblue','yellow'),numbers=TRUE, sortVars=TRUE,labels=names(all.mwrd.clean[,2]),cex.axis=0.7,gap=3,ylab=c("Missing data","Pattern"))
clean<-(all.mwrd$FLOW==0|is.na(all.mwrd$P.TOT)|is.na(all.mwrd$SS)|is.na(all.mwrd$TKN))
all.mwrd.clean<-all.mwrd[!clean,]
all.mwrd.clean
summary(all.mwrd.clean)
summary(all.mwrd)




#9.5% of the BOD5 is missing, assuming missing completely at random

#plots
mice_plot<-aggr(all.mwrd.clean, col=c('navyblue','yellow'),numbers=TRUE, sortVars=TRUE,labels=names(all.mwrd.clean[,2]),cex.axis=0.7,gap=3,ylab=c("Missing data","Pattern"))
#impute 
all.mwrd.clean.imputed<-mice(all.mwrd.clean[,-1],m=5,maxit=5,method='pmm',seed=500)
#get complete dataset for the 3 model
complete.mwrd<-complete(all.mwrd.clean.imputed,3)
complete.mwrd<-data.frame("DATE"=all.mwrd.clean$DATE,complete.mwrd)
#No NA's in BOD 5
summary(complete.mwrd)
write.csv(complete.mwrd,'C:/Users/boltz/Desktop/CSP571/project/completedata/completeMwrd_03_28_2018.csv',row.names=FALSE)


