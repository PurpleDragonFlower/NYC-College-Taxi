library("dplyr")
library("tidyr")
library(lubridate)
library(Hmisc)

#Use this file to generate files which will be used to predict Total Amount Bucket
#Removes "VendorID", "passenger_count", "fare_amount", "extra", "mta_tax", "tip_amount", "tolls_amount", "improvement_surcharge"
#Since the total amount is directly dependent on these and we want to see if the corrxct proice range is predicted even these 
#are not provideed and what are the changes if they are included.
#We deleted the total amount column and introduced the Amount buckets for simplification
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
dataframe <- dataframe %>%
  mutate(store_and_fwd_flag = ifelse(store_and_fwd_flag == 'N', 0, 1))
dataframe4 <- dataframe[, c(-22:-23)]
seq <- seq(0, 150, 10)
dataframe4$amount_bins <- as.numeric(cut2(dataframe4$total_amount, seq))
table(dataframe4$amount_bins)
plot(dataframe4$amount_bins)
summary(dataframe4$total_amount)
dataframe3 <- dataframe4[, c(-2:-5,-15:-21)]
dataframe4 <- dataframe4[, c(-2:-5, -21)]

write.csv(dataframe3, 
          file = "C:/Users/abhishek.suntwal/Downloads/pred_amt_with_all_columns.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE) 

write.csv(dataframe3, 
          file = "C:/Users/abhishek.suntwal/Downloads/pred_amt_with_few_columns.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = FALSE, 
          eol = "\n", 
          append = TRUE,
          quote = FALSE) 


