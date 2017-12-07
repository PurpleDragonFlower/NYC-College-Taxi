library("dplyr")
library("tidyr")
library(lubridate)
library(Hmisc)
library(caret)
library(caretEnsemble)
#Use this file to generate files which will be used to predict PaymentID
#Reading the file in to dataframe and filtering the data based on Columbia University area Morning Heights
dataframe <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2015-09.csv', header = TRUE)
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
res2 <- hms(dataframe$dropoff_time)

dataframe <- mutate(dataframe, pickup_res = hour(res)*60 + minute(res))
dataframe <- mutate(dataframe, dropoff_res = hour(res2)*60 + minute(res2))
dataframe <- dataframe %>%
  mutate(total_time = ifelse(pickup_res < dropoff_res, dropoff_res - pickup_res, pickup_res - dropoff_res))
dataframe <- dataframe[, c(-22:-23)]
dataframe2 <- dataframe
dataframe2 <- dataframe2 %>%
  mutate(store_and_fwd_flag = ifelse(store_and_fwd_flag == 'N', 0, 1))
df_mins <- dataframe2
df_mins <- df_mins[, c(-1:-2, -4:-5)]
df_hrs <- df_mins
dataframe2 <- dataframe2[, c(-1:-5)]
write.csv(dataframe2, 
          file = "C:/Users/abhishek.suntwal/Downloads/no_datetime.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = FALSE,
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
#Creating Buckets for Total Amount
plot(df_hrs)
scatter.smooth(df_hrs$total_amount ,df_hrs$trip_distance)
scatter.smooth(df_hrs$total_amount ,df_hrs$tip_amount)
plot(df_hrs$total_amount)
plot(df_hrs$trip_distance)
plot(df_hrs$total_time)
plot(df_hrs$tip_amount)
plot(df_hrs$tolls_amount)
table(df_hrs$passenger_count)

sum(is.na(df_hrs))
