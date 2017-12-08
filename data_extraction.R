#Automating complete code for data extraction
# Importing useful packages
library("dplyr")
library("tidyr")


# Global Variables
#give your system folder path where you have the files already downloaded.
# Or you can give the below link to directly read the files from the website
#PATH = "https://s3.amazonaws.com/nyc-tlc/trip+data/"
PATH = "C:/Users/abhishek.suntwal/Downloads/"
COLOR = "yellow_tripdata_"
SEPARATOR = "-"
EXTENSION = ".csv"

get_filename <- function(year, month){
  YEAR = year
  MONTH = month
  filename <- paste(c(PATH, COLOR, YEAR, SEPARATOR, MONTH, EXTENSION), collapse = '')
  #print(filename)
  return(filename)
}

main1 <- function(){
  path = "C:/Users/Abhishek/Documents/GitHub/NYC-College-Taxi/Dataset_extracted/"
  year = c("2013","2014","2015") #just taken the data of three years
  #year = c("2010","2011","2012","2013","2014","2015")
  month = c("02", "09")
  df <- list()
  counter = 0
  for (i in year){
    for (j in month){
      counter = counter + 1
      df[counter] <- read.csv(get_filename(i, j))#get_filename(i, j)
      print(counter)
      for (k in 1:counter){
        print(df[i])
        df[k] <- df[k][(df[k]$pickup_latitude <= 40.8164 & df[k]$pickup_latitude >= 40.8029),]
        df[k] <- df[k][(df[k]$pickup_longitude <= -73.9541 & df[k]$pickup_longitude >= -73.9699),]
        if ("tpep_pickup_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(tpep_pickup_datetime, c("date", "time"), " ") 
        }else if("pickup_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(pickup_datetime, c("date", "time"), " ")
        }else if("Trip_Pickup_DateTime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(Trip_Pickup_DateTime, c("date", "time"), " ")
        }
        
        if ("tpep_dropoff_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(tpep_pickup_datetime, c("date", "time"), " ") 
        }else if("dropoff_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(pickup_datetime, c("date", "time"), " ")
        }else if("Trip_Dropoff_DateTime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(Trip_Pickup_DateTime, c("date", "time"), " ")
        }
        
        
        # write.csv(df[i], 
        #           file = paste(c(path,COLOR,i,SEPARATOR,j,EXTENSION),collapse = ""),
        #           sep = ",",
        #           na = "NA", 
        #           row.names = FALSE, 
        #           col.names = FALSE, 
        #           eol = "\n", 
        #           append = FALSE,
        #           quote = FALSE)
      }
    }
  }
  for (i in year){
    for (j in month){
      counter = counter + 1
      df[counter] <- read.csv(get_filename(i, j))#get_filename(i, j)
      print(counter)
      for (k in 1:counter){
        print(df[i])
        df[k] <- df[k][(df[k]$pickup_latitude <= 40.7403 & df[k]$pickup_latitude >= 40.7263),]
        df[k] <- df[k][(df[k]$pickup_longitude <= -73.9905 & df[k]$pickup_longitude >= -74.0106),]
        if ("tpep_pickup_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(tpep_pickup_datetime, c("date", "time"), " ") 
        }else if("pickup_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(pickup_datetime, c("date", "time"), " ")
        }else if("Trip_Pickup_DateTime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(Trip_Pickup_DateTime, c("date", "time"), " ")
        }
        
        if ("tpep_dropoff_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(tpep_pickup_datetime, c("date", "time"), " ") 
        }else if("dropoff_datetime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(pickup_datetime, c("date", "time"), " ")
        }else if("Trip_Dropoff_DateTime" %in% colnames(df[i])){
          df[k] <- df[k] %>%
            separate(Trip_Pickup_DateTime, c("date", "time"), " ")
        }
        
        
        # write.csv(df[i], 
        #           file = paste(c(path,COLOR,i,SEPARATOR,j,EXTENSION),collapse = ""),
        #           sep = ",",
        #           na = "NA", 
        #           row.names = FALSE, 
        #           col.names = FALSE, 
        #           eol = "\n", 
        #           append = FALSE,
        #           quote = FALSE)
      }
    }
  }
}

main1()
  