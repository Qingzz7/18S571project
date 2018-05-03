# MATH571 final project
# ANOVA test
# Use ANOVA-test p-value approach to compare data for BOD5 (target variable) 
# from the 8 waste water treatment plants to see if the means are equal.
# If the means are not equal, 
# we will use dummy variables to differentiate between the waste water treatment plants.  


# Read data
# Please set working directory to completedata in 18S571

water_df <- read.csv("completeMwrd_BOD5.csv",  header=TRUE, sep=",")
head(water_df)

water_df[,'Location'] <- as.factor(water_df[,'Location'])
sapply(water_df,class)

means <- aggregate(BOD5 ~  Location, water_df, mean)


library(ggplot2)
# Location: 1=calumet, 2=egan,3=hanover park,
#           4=kirie,5=lemont,6=obrien,7=southwest,8=west side
bplot <- ggplot(water_df, aes(x = Location, y = TKN,fill = Location, group = Location)) + 
                geom_boxplot(alpha = 0.7,outlier.alpha = 0.2) +
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + 
  geom_text(data = means, aes(label = TKN, y = TKN + 0.20)) + 
  coord_cartesian(ylim = c(0, 100)) +
                scale_x_discrete(breaks=c("1","2","3","4","5","6","7","8"),
                                 labels=c("Calumet", "Egan", "Hanover Park","Kirie",
                                          "Lemont","Obrien","South west","West side"))

bpplot <- bplot +theme(
             plot.caption=element_text(size=15),  # caption
             axis.title.x=element_text(vjust=10,  
                                       size=15),  # X axis title
             axis.title.y=element_text(size=15),  # Y axis title
             axis.text.x=element_text(size=14, 
                                      angle = 30,
                                      vjust=.5),  # X axis text
             axis.text.y=element_text(size=14))  # Y axis text

print(bplot)


# hist <- ggplot(data=water_df, aes(water_df$TKN)) + 
#  geom_histogram(col="black", 
#                 aes(fill=..count..), 
#                 alpha = .7) + 
#                 labs(title="Histogram for TKN") +
#                 labs(x="TKN(mg/L)", y="Count")
# print(hist)


# make a new box plot for better look
bplocation <- c("1","2","3","4", "5", "6","8")
bpwater_df <- water_df[water_df[, "Location"] == bplocation,]

bpwater_df[,'Location'] <- as.factor(bpwater_df[,'Location'])

newbplot <- ggplot(bpwater_df, aes(x = Location, y = TKN, fill = Location)) + 
  geom_boxplot(alpha = 0.7) +
  scale_x_discrete(breaks=c("1","2","3","4", "5", "6", "8"),
                   labels=c("Calumet","Egan","Hanover park","Kirie",
                            "Lemont","Obrien","west side"))


newbplot + theme(
  plot.caption=element_text(size=15),  # caption
  axis.title.x=element_text(vjust=10,  
                            size=15),  # X axis title
  axis.title.y=element_text(size=15),  # Y axis title
  axis.text.x=element_text(size=16, 
                           angle = 30,
                           vjust=.5),  # X axis text
  axis.text.y=element_text(size=16))  # Y axis text


print(newbplot)


# Do anova test
anova_R <- aov(BOD5 ~ Location, data = water_df)
summary(anova_R)

# calculate critical value
alpha <- c(.10,.05,.025,.01)
for (i in 4) {
criticalValue = qf(p = 1 - alpha
                   , df1 = length(unique(water_df$Location)) - 1
                   , df2 = length(water_df$BOD5) - length(unique(water_df$Location)))
print(criticalValue)
}

# H0: The mean of BOD5 of different location are equal.
# H1: The mean of BOD5 of different location are not all equal.
# 1052 is the F value calculated by anova.
ifelse(938 >= criticalValue, "Reject H0", 
                             "Fail to reject H0")

