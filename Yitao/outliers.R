install.packages("outliers")
library(outliers)

water_df <- read.csv("~/Desktop/completeMwrd.csv",  header=TRUE, sep=",")
head(water_df)

water_df[,'Location'] <- as.factor(water_df[,'Location'])
sapply(water_df,class)

temp_water <- water_df[-1]
temp_water <- temp_water[-8]
head(temp_water)
new_water <- temp_water

# z-score test
set.seed(1234)
summary(scores(new_water, type = "z", prob = 0.9))


qnt <- quantile(new_water, probs=c(.25, .75), na.rm = T)
caps <- quantile(new_water, probs=c(.05, .95), na.rm = T)
H <- 1.5 * IQR(new_water, na.rm = T)
new_water[new_water < (qnt[1] - H)] <- caps[1]
new_water[new_water > (qnt[2] + H)] <- caps[2]

summary(temp_water)
summary(new_water)

boxplot(temp_water)
boxplot(new_water)


