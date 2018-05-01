# add population and population density based on zip code to data set.

water_df <- read.csv("~/Desktop/completeMwrd_BOD5_04_08_2018.csv",  header=TRUE, sep=",")
head(water_df)

water_df[,'Location'] <- as.factor(water_df[,'Location'])

# Location: 1=calumet(60628), 2=egan(60193),   3=hanover park(60134), 4=kirie(60018),
#           5=lemont(60439),  6=obrien(60076), 7=southwest(60067),    8=west side(60804).

zip_population <- read.csv("~/Desktop/zip_population.csv",  header=TRUE, sep=",")
head(zip_population)


match <- data.frame()
colnames(match) <- colnames(zip_population)

zip <- c("60628","60193","60133","60018","60439","60076","60067","60804")


for (i in 0:8) {
  match <- rbind(match,zip_population[zip_population$Zip.Code == zip[i],])
}

match <- match[,-1]
match$Location <- c("1","2","3","4","5","6","7","8")

water_df$Population <-match$Population[match(water_df$Location, match$Location)]
water_df$Pop_density <-match$People...Sq..Mile[match(water_df$Location, match$Location)]

water_df

write.csv(water_df, "~/Desktop/completeMwrd_population.csv")

