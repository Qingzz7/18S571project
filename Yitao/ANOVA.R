# MATH571 final project
# ANOVA test
# Use ANOVA-test p-value approach to compare data for TKN (target variable) 
# from the 8 waste water treatment plants to see if the means are equal.
# If the means are not equal, 
# we will use dummy variables to differentiate between the waste water treatment plants.  


# Read data
# Please change the library manually to read the file.
water_df <- read.csv("~/Desktop/completeMWRD.csv",  header=TRUE, sep=",")
head(water_df)

water_df[,'Location'] <- as.factor(water_df[,'Location'])
sapply(water_df,class)

library(ggplot2)
# Location: 1=calumet, 2=egan,3=hanover park,
#           4=kirie,5=lemont,6=obrien,7=southwest,8=west side
bplot <- ggplot(water_df, aes(x = Location, y = TKN,fill = Location, group = Location)) + 
                geom_boxplot(alpha = 0.7) +
                scale_x_discrete(breaks=c("1","2","3","4","5","6","7","8"),
                                 labels=c("Calumet", "Egan", "Hanover Park","Kirie",
                                          "Lemont","Obrien","South west","West side"))
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
print(newbplot)


# Do anova test
anova_R <- aov(TKN ~ Location, data = water_df)
summary(anova_R)

# calculate critical value
alpha_05 <- .05
criticalValue_05 = qf(p = 1 - alpha_05
                   , df1 = length(unique(water_df$Location)) - 1
                   , df2 = length(water_df$TKN) - length(unique(water_df$Location)))


# H0: The mean of TKN of different location are equal.
# H1: The mean of TKN of different location are not all equal.
# 1052 is the F value calculated by anova.
ifelse(1052 >= criticalValue, "Reject H0", 
                             "Fail to reject H0")
