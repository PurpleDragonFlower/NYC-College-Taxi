# Uses extracted february data to plot into 24 hour heat map and to test clustering

# Installs required libraries
install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
install.packages(c("maps", "mapdata"))
install.packages("Hmisc")
install.packages("corrplot")

devtools::install_github("dkahle/ggmap")

# Required libraries
library(ggplot2)
library(lattice)
library(caret)
library(dplyr)
library(tidyr)
library(lubridate)
library(corrplot)
library(ggmap)
library(maps)
library(mapdata)
library(Hmisc)

# Read in file
dataframe <- read.csv('./Github/NYC-College-Taxi/filtered data/yellow_tripdata_feb_with_longlat.csv', header = TRUE)

# Split up dropoff datetime to date and time
dataframe2 <- dataframe %>%
  separate(tpep_dropoff_datetime, c("dropdate", "droptime"), " ")

# Remove unnecessary columns
dataframe2 <- dataframe2[, -which(names(dataframe2) %in% 
                                    c("VendorID", "date", "dropdate", "fare_amount", "extra", "mta_tax", "tip_amount", "tolls_amount", "improvement_surcharge"))]

# Normalize times
dataframe3 <- dataframe2

dataframe3$time <- hms(dataframe3$time)
dataframe3$time <- as.numeric(dataframe3$time)
dataframe3$droptime <- hms(dataframe3$droptime)
dataframe3$droptime <- as.numeric(dataframe3$droptime)

# Get total time of trip
dataframe2 <- dataframe3
dataframe3 <- dataframe3 %>%
    mutate(totaltime = droptime - time )
dataframe3 <- within(dataframe3, totaltime[totaltime<0] <- 86400 + totaltime)
dataframe3 <- dataframe3[, -which(names(dataframe3) %in% c("time", "droptime"))]
dataframe3 <- dataframe3[, -which(names(dataframe3) %in% c("store_and_fwd_flag"))]

dataframe4 <- dataframe3


# Plots dropoff locations on map with heatmap based on time of day
seq <- seq(0, 86400, 3600)
dataframe4$time <- dataframe2$droptime
dataframe4$dropoff_by_hour <- as.numeric(cut2(dataframe4$time, seq))

nyc_base <- ggmap::get_map("New York City", zoom = 14)
ggmap(nyc_base) + geom_point(data=dataframe4, aes(x=dropoff_longitude, y=dropoff_latitude, color=dropoff_by_hour))
invisible(readline(prompt="Press [enter] to continue"))

# Plots three types of hierarchical clustering (complete, average, single) at each iteration
df_size <- nrow(dataframe4)
subsets <- seq(0, df_size, df_size/24)
df <- dataframe4

for (i in 1:(length(subsets)-1)){
  par(mfrow=c(3,1))
  df <- dataframe4[subsets[i]:subsets[(i+1)],]
  
  hc.complete=hclust(dist(df), method="complete")
  plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
  
  hc.average=hclust(dist(x), method="average")
  plot(hc.average,main="Average Linkage", xlab="", sub="", cex=.9)
  
  hc.single=hclust(dist(x), method="single")
  plot(hc.single,main="Single Linkage", xlab="", sub="", cex=.9)
  
  print(i)
  invisible(readline(prompt="Press [enter] to continue"))
}
