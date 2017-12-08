library("dplyr")
library("tidyr")

#Reading data for 3 years
df_2015_09 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2015-09.csv', header = TRUE)
df_2014_09 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2014-09.csv', header = TRUE)
df_2013_09 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2013-09.csv', header = TRUE)
df_2016_02 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2016-02.csv', header = TRUE)
df_2015_02 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2015-02.csv', header = TRUE)
df_2014_02 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2014-02.csv', header = TRUE)
df_2013_02 <- read.csv('C:/Users/abhishek.suntwal/Downloads/yellow_tripdata_2013-02.csv', header = TRUE)

names(df_2013_02)
names(df_2013_09)
names(df_2014_02)
names(df_2014_09)
names(df_2015_02)
names(df_2015_09)
names(df_2016_02)

#Filter All data For Columbia University Region
df_2015_09_CU <- df_2015_09[(df_2015_09$pickup_latitude <= 40.8164 & df_2015_09$pickup_latitude >= 40.8029),]
df_2015_09_CU <- df_2015_09_CU[(df_2015_09_CU$pickup_longitude <= -73.9541 & df_2015_09_CU$pickup_longitude >= -73.9699),]
df_2014_09_CU <- df_2014_09[(df_2014_09$pickup_latitude <= 40.8164 & df_2014_09$pickup_latitude >= 40.8029),]
df_2014_09_CU <- df_2014_09_CU[(df_2014_09_CU$pickup_longitude <= -73.9541 & df_2014_09_CU$pickup_longitude >= -73.9699),]
df_2013_09_CU <- df_2013_09[(df_2013_09$pickup_latitude <= 40.8164 & df_2013_09$pickup_latitude >= 40.8029),]
df_2013_09_CU <- df_2013_09_CU[(df_2013_09_CU$pickup_longitude <= -73.9541 & df_2013_09_CU$pickup_longitude >= -73.9699),]
df_2016_02_CU <- df_2016_02[(df_2016_02$pickup_latitude <= 40.8164 & df_2016_02$pickup_latitude >= 40.8029),]
df_2016_02_CU <- df_2016_02_CU[(df_2016_02_CU$pickup_longitude <= -73.9541 & df_2016_02_CU$pickup_longitude >= -73.9699),]
df_2015_02_CU <- df_2015_02[(df_2015_02$pickup_latitude <= 40.8164 & df_2015_02$pickup_latitude >= 40.8029),]
df_2015_02_CU <- df_2015_02_CU[(df_2015_02_CU$pickup_longitude <= -73.9541 & df_2015_02_CU$pickup_longitude >= -73.9699),]
df_2014_02_CU <- df_2014_02[(df_2014_02$pickup_latitude <= 40.8164 & df_2014_02$pickup_latitude >= 40.8029),]
df_2014_02_CU <- df_2014_02_CU[(df_2014_02_CU$pickup_longitude <= -73.9541 & df_2014_02_CU$pickup_longitude >= -73.9699),]
df_2013_02_CU <- df_2013_02[(df_2013_02$pickup_latitude <= 40.8164 & df_2013_02$pickup_latitude >= 40.8029),]
df_2013_02_CU <- df_2013_02_CU[(df_2013_02_CU$pickup_longitude <= -73.9541 & df_2013_02_CU$pickup_longitude >= -73.9699),]

#Filtering data for NYU Region
df_2015_09_NYU <- df_2015_09[(df_2015_09$pickup_latitude <= 40.7403 & df_2015_09$pickup_latitude >= 40.7263),]
df_2015_09_NYU <- df_2015_09_NYU[(df_2015_09_NYU$pickup_longitude <= -73.9905 & df_2015_09_NYU$pickup_longitude >= -74.0106),]
df_2014_09_NYU <- df_2014_09[(df_2014_09$pickup_latitude <= 40.7403 & df_2014_09$pickup_latitude >= 40.7263),]
df_2014_09_NYU <- df_2014_09_NYU[(df_2014_09_NYU$pickup_longitude <= -73.9905 & df_2014_09_NYU$pickup_longitude >= -74.0106),]
df_2013_09_NYU <- df_2013_09[(df_2013_09$pickup_latitude <= 40.7403 & df_2013_09$pickup_latitude >= 40.7263),]
df_2013_09_NYU <- df_2013_09_NYU[(df_2013_09_NYU$pickup_longitude <= -73.9905 & df_2013_09_NYU$pickup_longitude >= -74.0106),]
df_2016_02_NYU <- df_2016_02[(df_2016_02$pickup_latitude <= 40.7403 & df_2016_02$pickup_latitude >= 40.7263),]
df_2016_02_NYU <- df_2016_02_NYU[(df_2016_02_NYU$pickup_longitude <= -73.9905 & df_2016_02_NYU$pickup_longitude >= -74.0106),]
df_2015_02_NYU <- df_2015_02[(df_2015_02$pickup_latitude <= 40.7403 & df_2015_02$pickup_latitude >= 40.7263),]
df_2015_02_NYU <- df_2015_02_NYU[(df_2015_02_NYU$pickup_longitude <= -73.9905 & df_2015_02_NYU$pickup_longitude >= -74.0106),]
df_2014_02_NYU <- df_2014_02[(df_2014_02$pickup_latitude <= 40.7403 & df_2014_02$pickup_latitude >= 40.7263),]
df_2014_02_NYU <- df_2014_02_NYU[(df_2014_02_NYU$pickup_longitude <= -73.9905 & df_2014_02_NYU$pickup_longitude >= -74.0106),]
df_2013_02_NYU <- df_2013_02[(df_2013_02$pickup_latitude <= 40.7403 & df_2013_02$pickup_latitude >= 40.7263),]
df_2013_02_NYU <- df_2013_02_NYU[(df_2013_02_NYU$pickup_longitude <= -73.9905 & df_2013_02_NYU$pickup_longitude >= -74.0106),]

#Making data same for all the months, that include the following:
# Drop Column improvement_surcharge from year 2015 and onwards since it is not available in previous data 
#   and there is no correlation between it and PaymentID and Total_Amount
# Drop Column "store_and_fwd_flag" from all the data as tit didnt have anyy correlation with paymentID and total_amount
drops <- c("improvement_surcharge", "store_and_fwd_flag")
df_2015_09_NYU <- df_2015_09_NYU[, !names(df_2015_09_NYU) %in% drops]
df_2015_09_CU <- df_2015_09_CU[, !names(df_2015_09_CU) %in% drops]
df_2015_02_NYU <- df_2015_02_NYU[, !names(df_2015_02_NYU) %in% drops]
df_2015_02_CU <- df_2015_02_CU[, !names(df_2015_02_CU) %in% drops]
df_2016_02_NYU <- df_2016_02_NYU[, !names(df_2016_02_NYU) %in% drops]
df_2016_02_CU <- df_2016_02_CU[, !names(df_2016_02_CU) %in% drops]
df_2013_09_NYU <- df_2013_09_NYU[, !names(df_2013_09_NYU) %in% drops]
df_2013_09_CU <- df_2013_09_CU[, !names(df_2013_09_CU) %in% drops]
df_2013_02_NYU <- df_2013_02_NYU[, !names(df_2013_02_NYU) %in% drops]
df_2013_02_CU <- df_2013_02_CU[, !names(df_2013_02_CU) %in% drops]
df_2014_09_NYU <- df_2014_09_NYU[, !names(df_2014_09_NYU) %in% drops]
df_2014_09_CU <- df_2014_09_CU[, !names(df_2014_09_CU) %in% drops]
df_2014_02_NYU <- df_2014_02_NYU[, !names(df_2014_02_NYU) %in% drops]
df_2014_02_CU <- df_2014_02_CU[, !names(df_2014_02_CU) %in% drops]

# -Rename columns 
#   - vendor_id -> VendorID, 
#   - pickup_datetime -> tpep_pickup_datetime
#   - dropoff_datetime -> tpep_dropoff_datetime
#   - rate_code -> RateCodeID
#   - surcharge -> extra
name <- names(df_2016_02_CU)
colnames(df_2013_09_CU) <- name
colnames(df_2014_09_CU) <- name
colnames(df_2013_09_NYU) <- name
colnames(df_2014_09_NYU) <- name
colnames(df_2013_02_CU) <- name
colnames(df_2014_02_CU) <- name
colnames(df_2013_02_NYU) <- name
colnames(df_2014_02_NYU) <- name
colnames(df_2015_02_CU) <- name
colnames(df_2015_09_CU) <- name
colnames(df_2015_02_NYU) <- name
colnames(df_2015_09_NYU) <- name

# Columns of Old data which is year 2013 and 2014 is different
#   - VendorID -> CMT and VTS [for year 2013 and 2014]
#   - VendorID -> 0 and 1 [for 2015 onwards, 1=CMT and 2=VTS]
# Similarly, implement colowing factor for RatecodeID for data 2014 and earlier
# 1= Standard rate
# 2=JFK
# 3=Newark
# 4=Nassau or Westchester
# 5=Negotiated fare
# 6=Group ride
unique(df_2013_09_CU$VendorID)
unique(df_2014_09_CU$VendorID)
unique(df_2013_09_NYU$VendorID)
unique(df_2014_09_NYU$VendorID)
unique(df_2013_02_CU$VendorID)
unique(df_2014_02_CU$VendorID)
unique(df_2013_02_NYU$VendorID)
unique(df_2014_02_NYU$VendorID)
unique(df_2013_09_CU$payment_type)
unique(df_2014_09_CU$payment_type)
unique(df_2013_09_NYU$payment_type)
unique(df_2014_09_NYU$payment_type)
unique(df_2013_02_CU$payment_type)
unique(df_2014_02_CU$payment_type)
unique(df_2013_02_NYU$payment_type)
unique(df_2014_02_NYU$payment_type)

table(df_2013_09_CU$VendorID)
table(df_2014_09_CU$VendorID)
table(df_2013_09_NYU$VendorID)
table(df_2014_09_NYU$VendorID)
table(df_2013_02_CU$VendorID)
table(df_2014_02_CU$VendorID)
table(df_2013_02_NYU$VendorID)
table(df_2014_02_NYU$VendorID)
table(df_2013_09_CU$payment_type)
table(df_2014_09_CU$payment_type)
table(df_2013_09_NYU$payment_type)
table(df_2014_09_NYU$payment_type)
table(df_2013_02_CU$payment_type)
table(df_2014_02_CU$payment_type)
table(df_2013_02_NYU$payment_type)
table(df_2014_02_NYU$payment_type)

dummydf <- df_2013_09_CU
dummydf <- dummydf %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2013_09_CU <- df_2013_09_CU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2014_09_CU <- df_2014_09_CU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2013_09_NYU <- df_2013_09_NYU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2014_09_NYU <- df_2014_09_NYU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2013_02_CU <- df_2013_02_CU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2014_02_CU <- df_2014_02_CU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2013_02_NYU <- df_2013_02_NYU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))
df_2014_02_NYU <- df_2014_02_NYU %>%
  mutate(VendorID = ifelse(VendorID == 'CMT', 1, 2))


dummydf <- dummydf %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2013_09_CU <- df_2013_09_CU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2014_09_CU <- df_2014_09_CU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2013_09_NYU <- df_2013_09_NYU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2014_09_NYU <- df_2014_09_NYU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2013_02_CU <- df_2013_02_CU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2014_02_CU <- df_2014_02_CU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2013_02_NYU <- df_2013_02_NYU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))
df_2014_02_NYU <- df_2014_02_NYU %>%
  mutate(payment_type = ifelse(payment_type == 'CRD', 1, 
                               ifelse(payment_type == 'CSH', 2, 
                                      ifelse(payment_type=='NOC', 3, 
                                             ifelse(payment_type=='DIS', 4, 
                                                    ifelse(payment_type=='UNK', 5, NA))))))

head(df_2013_02_CU)
head(df_2013_09_CU)
head(df_2014_02_CU)
head(df_2014_09_CU)
head(df_2015_02_CU)
head(df_2015_09_CU)
head(df_2016_02_CU)

write.csv(df_2015_09_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2015_09_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2014_09_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2014_09_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2013_09_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2013_09_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2016_02_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2016_02_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2015_02_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2015_02_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2014_02_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2014_02_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2013_02_CU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2013_02_CU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2015_09_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2015_09_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)			

write.csv(df_2014_09_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2014_09_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2013_09_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2013_09_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2016_02_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2016_02_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2015_02_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2015_02_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

write.csv(df_2014_02_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2014_02_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)


write.csv(df_2013_02_NYU, 
          file = "C:/Users/abhishek.suntwal/Downloads/all files/df_2013_02_NYU.csv", 
          sep = ",",
          na = "NA", 
          row.names = FALSE, 
          col.names = TRUE, 
          eol = "\n", 
          append = FALSE,
          quote = FALSE)

setwd("C://Users//abhishek.suntwal//Downloads//all files")

file_list <- list.files()
file_list
for (file in file_list){

  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE)
  }
  cat("processing...",file)
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.csv(file, header=TRUE)
    dataset<-rbind(dataset, temp_dataset)
    #rm(temp_dataset)
  }

}

write.csv(dataset,
          file = "C:/Users/abhishek.suntwal/Downloads/all files/master_data.csv",
          sep = ",",
          na = "NA",
          row.names = FALSE,
          col.names = TRUE,
          append = FALSE,
          quote = FALSE)


