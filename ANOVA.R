# MATH571 final project
# ANOVA test
# Use ANOVA-test p-value approach to compare data for TKN (target variable) 
# from the 8 waste water treatment plants to see if the means are equal.
# If the means are not equal, 
# we will use dummy variables to differentiate between the waste water treatment plants.  


# Read data
# Please change the library manually to read the file.
water_df <- read.csv("~/Desktop/completeMwrd.csv",  header=TRUE, sep=",")
water_df <- water_df[,-1]
head(water_df)
row(water_df)

# water_df <- stack(water_df)

water_df[,'Location'] <- as.factor(water_df[,'Location'])

anova_R <- aov(TKN ~ Location, data = water_df)
summary(anova_R)

# calculate critical value
alpha <- .05
criticalValue = qf(p = 1 - alpha
                   , df1 = length(unique(water_df$Location)) - 1
                   , df2 = length(water_df$TKN) - length(unique(water_df$Location)))


# H0: The mean of TKN of different location are equal.
# H1: The mean of TKN of different location are not all equal.
ifelse(690 >= criticalValue, "Reject H0", 
                              "Fail to reject H0")

