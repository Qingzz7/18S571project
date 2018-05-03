#set working directory to the completedata folder 
wastewater <- read.csv("completeMwrd_BOD5.csv", header = TRUE)
#library(mlbench)

#review  first 5 rows of data
head(wastewater, n=5)
dim(wastewater)
#drop first two cloumns
wastewater <- wastewater[,c(-1,-2)]
head(wastewater, n=5)
#the rows and columns
dim(wastewater)
str(wastewater)
summary(wastewater)
library(pastecs)
library(boot)
options(scipen=100)
options(digits=2)
s <- stat.desc(wastewater[,-c(8,10)],basic=FALSE)
s
dim(wastewater)
head(wastewater)
wastewater$Location[wastewater$Location == "1"] <- "Calumet"
wastewater$Location[wastewater$Location == "2"] <- "Egan"
wastewater$Location[wastewater$Location == "3"] <- "Hanover"
wastewater$Location[wastewater$Location == "4"] <- "Kirie"
wastewater$Location[wastewater$Location == "5"] <- "Lemont"
wastewater$Location[wastewater$Location == "6"] <- "Obrien"
wastewater$Location[wastewater$Location == "7"] <- "Southwest"
wastewater$Location[wastewater$Location == "8"] <- "Westside"

head(wastewater)
library(ggplot2)
#histgram
ggplot(wastewater, aes(x=BOD5))+
  geom_histogram(color="blue", fill="yellow")+
  facet_grid(Location ~ .)+xlim(0,1750)+ylim(0,1300)
#qqplots
qplot(sample = BOD5, data = wastewater, color=Location)+
  labs(title="BOD5 according to the Location", y="mg/L concentration",x="Theoretical Quantile")
head(wastewater)
?aggregate
mean <- aggregate(. ~ Location, wastewater[,-10],FUN= 'mean')
mean
sd <- aggregate(. ~ Location, wastewater[,-c(10)], FUN='sd')
sd
IQR <- aggregate(. ~ Location, wastewater[,-10], FUN='IQR')
IQR

#correlations <- cor(wastewater[1:7])
#correlations
#correlograms
#install.packages("corrgram")
#library(corrgram)
#corrgram(wastewater, order = TRUE, lower.panel = panel.shade,
 #        upper.panel = panel.pie, text.panel = panel.txt,
  #       main = "Correlogram of wastewater intercorrelations")

# another method
library(ggplot2)
install.packages("ggcorrplot")
library(ggcorrplot)
head(wastewater)
# Correlation matrix
corr <- round(cor(wastewater[,-c(8,10)]), 1)
corr
# Plot
ggcorrplot(corr, hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="circle", 
           colors = c("tomato2", "white", "springgreen3"), 
           title="Correlogram of wastewater", 
           ggtheme=theme_bw)

#plot.ts(wastewater,col=rainbow(ncol(wastewater[1:7])))


library(ggplot2)
library(reshape2)
df <- melt(wastewater, id.vars = "Location")
#barplots for all location
ggplot(df, aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + facet_wrap(~Location) + ggtitle("barplots of all locations")
#barplot for each location
ggplot(subset(df, Location == "calumet"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location calumet")
ggplot(subset(df, Location == "egan"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location egan")
ggplot(subset(df, Location == "hanoverPark"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location hanoverPark")
ggplot(subset(df, Location == "kirie"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location kirie")
ggplot(subset(df, Location == "lemont"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location lemont")
ggplot(subset(df, Location == "obrien"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location obrien")
ggplot(subset(df, Location == "southwest"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location southwest")
ggplot(subset(df, Location == "westside"), aes(x = variable, y = value, color = variable)) + 
  geom_bar(stat = "identity", fill = "white", width = 0.8) + ggtitle("barplot of location westside")






