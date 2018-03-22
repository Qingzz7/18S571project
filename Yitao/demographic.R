# MATH571 final project
# Demographic analysis
# Yitao Ma

install.packages("devtools")
library(devtools)
install_github('arilamstein/choroplethrZip@v1.5.0')
library(choroplethrZip)

# This data contains all zip code in America
data(df_pop_zip)

data(df_zip_demographics)
colnames(df_zip_demographics)

# This function can highlight designated place on map
highlight_zip = function(zip)
{
  library(choroplethrZip)
  data(zip.map)
  df = zip.map[zip.map$region %in% zip, ]
  geom_polygon(data=df, aes(long, lat, group=group), color="orange", fill=NA, size=0.7)
}


df_zip_demographics$value <- df_zip_demographics[,2]
  
# zip code of water plants
water_zip <- c("60628","60804","60067","60018","60193", "60133","60439","60076")

# create map
choro <- zip_choropleth(df_zip_demographics, 
                       title="\n\nCook County ZCTA Demographics ", 
                       legend = "Population\n",
                       county_zoom="17031") + 
                        highlight_zip(water_zip) +
                       coord_map()

print(choro)


