# MATH571 final project
# ANOVA test
# Use ANOVA-test p-value approach to compare data for TKN (target variable) 
# from the 8 waste water treatment plants to see if the means are equal.
# If the means are not equal, 
# we will use dummy variables to differentiate between the waste water treatment plants.  


# Read data
# Please change the library manually to read the file.
water_df <- read.csv("~/Desktop/ALL_MWRD.csv",  header=TRUE, sep=",")
head(water_df)

# change data type: factor -> numeric
water_df[,'TKN'] <- as.character(water_df[,'TKN'])
water_df[,'TKN'] <- as.numeric(water_df[,'TKN'])

# change data type: numeric -> factor 
# for boxplot 
water_df[,'LOCATION'] <- as.factor(water_df[,'LOCATION'])

# do blox plot
library(ggplot2)
# Location: 1=calumet, 2=egan,3=hanover park,
#           4=kirie,5=lemont,6=obrien,7=southwest,8=west side
bplot <- ggplot(water_df, aes(x = LOCATION, y=TKN,fill=LOCATION)) + 
                geom_boxplot(alpha = 0.7) +
                scale_x_discrete(breaks=c("1","2","3","4","5","6"),
                   labels=c("Calumet", "Egan", "Hanover Park","Kirie","Lemont","Obrien"))
print(bplot)

# outliers visualization
hist <- ggplot(data=water_df, aes(water_df$TKN)) + 
  geom_histogram(col="black", 
                 aes(fill=..count..), 
                 alpha = .7) + 
                 labs(title="Histogram for TKN") +
                 labs(x="TKN(mg/L)", y="Count")
print(hist)

# remove outliers by condition
new_water_df <- water_df[water_df[, "TKN"] <= 50,]



new_bplot <- ggplot(new_water_df, aes(x = LOCATION, y=TKN,fill=LOCATION)) + 
  geom_boxplot(alpha = 0.7) +
  scale_x_discrete(breaks=c("1","2","3","4","5","6"),
                   labels=c("Calumet", "Egan", "Hanover Park","Kirie","Lemont","Obrien"))
print(new_bplot)

new_hist <- ggplot(data=new_water_df, aes(new_water_df$TKN)) + 
  geom_histogram(col="black", 
                 aes(fill=..count..), 
                 alpha = .7) + 
  labs(title="Histogram for TKN") +
  labs(x="TKN(mg/L)", y="Count")
print(new_hist)

# do anova test on TKN
anova_R <- aov(TKN ~ LOCATION, data = new_water_df)
summary(anova_R) # f-value = 496.5

# calculate critical value
alpha_05 <- .05
criticalValue_05 = qf(p = 1 - alpha_05
                   , df1 = length(unique(new_water_df$LOCATION)) - 1
                   , df2 = length(new_water_df$TKN) - length(unique(new_water_df$LOCATION)))


# H0: The mean of TKN of different location are equal.
# H1: The mean of TKN of different location are not all equal.
ifelse(496.5 >= criticalValue, "Reject H0", 
                              "Fail to reject H0")

# why F value can be so large
