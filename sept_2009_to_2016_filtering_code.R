library("dplyr")
library("tidyr")

dataframe <- read.table('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2016-09.csv', header = TRUE, sep = ",", skip = 1)
dataframe_name <- read.table('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2016-09.csv', header = TRUE, sep = ",", nrows = 1)
dataframe <- dataframe[dataframe$X230 == '166',]
summary(dataframe)
dim(dataframe)
dataframe <- dataframe %>%
  separate(X2016.09.04.01.39.17, c("date", "time"), " ")
write.csv(dataframe, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_2016.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2015-09.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(tpep_pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2015.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)


dataframe3 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2014-09.csv', header = TRUE)
dataframe3 <- dataframe3[(dataframe3$pickup_latitude <= 40.8164 & dataframe3$pickup_latitude >= 40.8029),]
dataframe3 <- dataframe3[(dataframe3$pickup_longitude <= -73.9541 & dataframe3$pickup_longitude >= -73.9699),]
summary(dataframe3)
dim(dataframe3)
dataframe3 <- dataframe3 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe3, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2014.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)





dataframe4 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2013-09.csv', header = TRUE)
dataframe4 <- dataframe4[(dataframe4$pickup_latitude <= 40.8164 & dataframe4$pickup_latitude >= 40.8029),]
dataframe4 <- dataframe4[(dataframe4$pickup_longitude <= -73.9541 & dataframe4$pickup_longitude >= -73.9699),]
summary(dataframe4)
dim(dataframe4)
dataframe4 <- dataframe4 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe4, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2013.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)


dataframe5 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2012-09.csv', header = TRUE)
dataframe5 <- dataframe5[(dataframe5$pickup_latitude <= 40.8164 & dataframe5$pickup_latitude >= 40.8029),]
dataframe5 <- dataframe5[(dataframe5$pickup_longitude <= -73.9541 & dataframe5$pickup_longitude >= -73.9699),]
summary(dataframe5)
dim(dataframe5)
dataframe5 <- dataframe5 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe5, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2012.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe2 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2011-09.csv', header = TRUE)
dataframe2 <- dataframe2[(dataframe2$pickup_latitude <= 40.8164 & dataframe2$pickup_latitude >= 40.8029),]
dataframe2 <- dataframe2[(dataframe2$pickup_longitude <= -73.9541 & dataframe2$pickup_longitude >= -73.9699),]
summary(dataframe2)
dim(dataframe2)
dataframe2 <- dataframe2 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2011.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe6 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2010-09.csv', header = TRUE)
dataframe6 <- dataframe6[(dataframe6$pickup_latitude <= 40.8164 & dataframe6$pickup_latitude >= 40.8029),]
dataframe6 <- dataframe6[(dataframe6$pickup_longitude <= -73.9541 & dataframe6$pickup_longitude >= -73.9699),]
summary(dataframe6)
dim(dataframe6)
dataframe6 <- dataframe6 %>%
  separate(pickup_datetime, c("date", "time"), " ")

write.csv(dataframe6, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2010.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



dataframe7 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2009-09.csv', header = TRUE)
dataframe7 <- dataframe7[(dataframe7$Start_Lat <= 40.8164 & dataframe7$Start_Lat >= 40.8029),]
dataframe7 <- dataframe7[(dataframe7$Start_Lon <= -73.9541 & dataframe7$Start_Lon >= -73.9699),]
summary(dataframe7)
dim(dataframe7)
dataframe7 <- dataframe7 %>%
  separate(Trip_Pickup_DateTime, c("date", "time"), " ")

write.csv(dataframe7, 
          file = "C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_sept_with_longlat_2009.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)
