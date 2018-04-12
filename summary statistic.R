wastewater <- read.csv("C:/Users/ZH1/Desktop/MATH571/project/completeMwrd_03_22_2018.csv", header = TRUE)
#library(mlbench)

#review  first 5 rows of data
head(wastewater, n=5)
dim(wastewater)
#drop first two cloumns
wastewater <- subset(wastewater, select = -c(X,all.mwrd.clean.DATE) )
head(wastewater, n=5)
#the rows and columns
dim(wastewater)
str(wastewater)
summary(wastewater)
library(pastecs)
library(boot)
options(scipen=100)
options(digits=2)
s <- stat.desc(wastewater)

wastewater$Location[wastewater$Location == "1"] <- "calumet"
wastewater$Location[wastewater$Location == "2"] <- "egan"
wastewater$Location[wastewater$Location == "3"] <- "hanoverPark"
wastewater$Location[wastewater$Location == "4"] <- "kirie"
wastewater$Location[wastewater$Location == "5"] <- "lemont"
wastewater$Location[wastewater$Location == "6"] <- "obrien"
wastewater$Location[wastewater$Location == "7"] <- "southwest"
wastewater$Location[wastewater$Location == "8"] <- "westside"

library(ggplot2)
#histgram
ggplot(wastewater, aes(x=BOD5))+
  geom_histogram(color="blue", fill="yellow")+
  facet_grid(Location ~ .)
#qqplots
qplot(sample = BOD5, data = wastewater, color=Location)+
  labs(title="BOD5 according to the Location", y="mg/L concentration")


mean <- aggregate(. ~ Location, wastewater, mean)
mean
sd <- aggregate(. ~ Location, wastewater, sd)
sd
IQR <- aggregate(. ~ Location, wastewater, IQR)
IQR

#correlations <- cor(wastewater[1:7])
#correlations
#correlograms
#install.packages("corrgram")
#library(corrgram)
#corrgram(wastewater, order = TRUE, lower.panel = panel.shade,
#         upper.panel = panel.pie, text.panel = panel.txt,
#         main = "Correlogram of wastewater intercorrelations")

# another method
library(ggplot2)
#install.packages("ggcorrplot")
library(ggcorrplot)

# Correlation matrix
corr <- round(cor(wastewater[1:7]), 1)
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






