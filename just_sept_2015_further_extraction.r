library("dplyr")
library("tidyr")
library(lubridate)
library(Hmisc)


#Reading the file in to dataframe and filtering the data based on Columbia University area Morning Heights
dataframe <- read.csv('C:/Users/Abhishek/Desktop/nyc cab driver data/yellow_tripdata_2015-09.csv', header = TRUE)
dataframe <- dataframe[(dataframe$pickup_latitude <= 40.8164 & dataframe$pickup_latitude >= 40.8029),]
dataframe <- dataframe[(dataframe$pickup_longitude <= -73.9541 & dataframe$pickup_longitude >= -73.9699),]
dim(dataframe)

#Splitting time and data column for pickup and drop-off datetime column
dataframe <- dataframe %>%
  separate(tpep_pickup_datetime, c("pickup_date", "pickup_time"), " ")
dataframe <- dataframe %>%
  separate(tpep_dropoff_datetime, c("dropoff_date", "dropoff_time"), " ")

#Calculating total travel time in seconds
res <- hms(dataframe$pickup_time)
pickup_res <- hour(res)*60 + minute(res)
res2 <- hms(dataframe$dropoff_time)
dropoff_res <- hour(res2)*60 + minute(res2)

dataframe <- mutate(dataframe, pickup_res = hour(res)*60 + minute(res))
dataframe <- mutate(dataframe, dropoff_res = hour(res2)*60 + minute(res2))
dataframe <- dataframe %>%
  mutate(total_time = ifelse(pickup_res < dropoff_res, dropoff_res - pickup_res, pickup_res - dropoff_res))

dataframe2 <- dataframe
dataframe2 <- dataframe2 %>%
  mutate(store_and_fwd_flag = ifelse(store_and_fwd_flag == 'N', 0, 1))
df_mins <- dataframe2
df_mins <- df_mins[, c(-1:-2, -4:-5)]
df_hrs <- df_mins
dataframe2 <- dataframe2[, c(-1:-5)]
write.csv(dataframe2, 
          file = "C:/Users/Abhishek/Documents/GitHub/NYC-College-Taxi/no_datetime.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)



res <- hms(df_mins$pickup_time)
df_mins <- mutate(df_mins, pickup_time = hour(res)*60 + minute(res))
write.csv(df_mins, 
          file = "C:/Users/Abhishek/Documents/GitHub/NYC-College-Taxi/pickup_in_mins.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)

df_hrs <- mutate(df_hrs, pickup_time = hour(res))
write.csv(df_hrs, 
          file = "C:/Users/Abhishek/Documents/GitHub/NYC-College-Taxi/pickup_in_hrs.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE)

                             
sum(is.na(dataframe2))

dataframe3 <- dataframe2

#Creating Buckets for Total Amount
summary(dataframe3$total_amount)
plot(dataframe3$total_amount)
plot(dataframe3$total_amount)
sum(is.na(dataframe3))  
seq <- seq(0, 150, 5)
dataframe3$amount_bins2 <- as.numeric(cut2(dataframe3$total_amount, seq))
table(dataframe3$amount_bins2)
write.csv(dataframe3, 
          file = "C:/Users/abhishek.suntwal/Downloads/final_data_extraction_for_sept_2015_with_bins.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE) 
