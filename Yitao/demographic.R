
install.packages("devtools")
library(devtools)
install_github('arilamstein/choroplethrZip@v1.5.0')
library(choroplethrZip)

data(df_pop_zip)


data(df_zip_demographics)
colnames(df_zip_demographics)

highlight_zip = function(zip)
{
  library(choroplethrZip)
  data(zip.map)
  df = zip.map[zip.map$region %in% zip, ]
  geom_polygon(data=df, aes(long, lat, group=group), color="orange", fill=NA, size=0.7)
}


df_zip_demographics$value <- df_zip_demographics[,2]
  
water_zip <- c("60628","60804","60067","60018","60193", "60133","60439","60076")

choro <- zip_choropleth(df_zip_demographics, 
                       title="\n\nCook County ZCTA Demographics ", 
                       legend = "Population\n",
                       county_zoom="17031") + 
                        highlight_zip(water_zip) +
                       coord_map()

print(choro)


