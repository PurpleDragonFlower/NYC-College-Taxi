library("dplyr")
library("tidyr")

dataframe <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2016-09.csv', header = TRUE)
dataframe <- dataframe[dataframe$PULocationID == '166',]
summary(dataframe)
dim(dataframe)
dataframe <- dataframe %>%
  separate(tpep_pickup_datetime, c("date", "time"), " ")
write.csv(dataframe, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2015-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(tpep_pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2015.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)


dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2014-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2014.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)





dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2013-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)

dataframe4 <- dataframe2
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")
dataframe4$vendor_id[dataframe4$vendor_id == "CMT"] <- 1 

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2013.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)


dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2012-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2012.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2011-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2011.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2010-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2010.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2009-02.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$Start_Lat <= 40.8164 & dataframe2$Start_Lat >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$Start_Lon <= -73.9541 & dataframe2$Start_Lon >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(Trip_Pickup_DateTime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_feb_with_longlat_2009.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)
