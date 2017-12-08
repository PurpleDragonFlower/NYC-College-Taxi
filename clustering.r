install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
install.packages(c("maps", "mapdata"))
library(ggplot2)
library(caret)
library(dplyr)
library(tidyr)
library(lubridate)
install.packages("corrplot")
library(corrplot)
devtools::install_github("dkahle/ggmap")
library(ggmap)
library(maps)
library(mapdata)
library(Hmisc)
install.packages("Hmisc")

dataframe <- read.csv('./Github/NYC-College-Taxi/filtered data/yellow_tripdata_feb_with_longlat.csv', header = TRUE)
dataframe2 <- dataframe %>%
  separate(tpep_dropoff_datetime, c("dropdate", "droptime"), " ")

dataframe2 <- dataframe2[, -which(names(dataframe2) %in% 
                                    c("VendorID", "date", "dropdate", "fare_amount", "extra", "mta_tax", "tip_amount", "tolls_amount", "improvement_surcharge"))]

dataframe3 <- dataframe2


dataframe3$time <- hms(dataframe3$time)
dataframe3$time <- as.numeric(dataframe3$time)
dataframe3$droptime <- hms(dataframe3$droptime)
dataframe3$droptime <- as.numeric(dataframe3$droptime)

dataframe2 <- dataframe3
dataframe3 <- dataframe3 %>%
    mutate(totaltime = droptime - time )
dataframe3 <- within(dataframe3, totaltime[totaltime<0] <- 86400 + totaltime)
dataframe3 <- dataframe3[, -which(names(dataframe3) %in% c("time", "droptime"))]
dataframe3 <- dataframe3[, -which(names(dataframe3) %in% c("store_and_fwd_flag"))]

ir.pca2 <- prcomp(dataframe3, center = TRUE, scale. = TRUE)

names(ir.pca2)
ir.pca2$rotation
biplot(ir.pca2, scale=0, cex=0.6)

ir.pca2$sdev
pr.var=ir.pca2$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')
plot(cumsum(pve), xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')

dataframe4 <- dataframe3
dataframe3 <- scale(dataframe3)
M <- cor(dataframe3)
M4 <- cor(dataframe4)
corrplot(M, method = "number")
pairs(M)
barplot(M[,1])

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(M, method = "color", col = col(200),  
         type = "upper", order = "hclust", 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col = "darkblue", tl.srt = 45, #Text label color and rotation
         # Combine with significance level
         sig.level = 0.01,  
         # hide correlation coefficient on the principal diagonal
         diag = FALSE 
)
corrplot(M4, method = "color", col = col(200),  
         type = "upper", order = "hclust", 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col = "darkblue", tl.srt = 45, #Text label color and rotation
         # Combine with significance level
         sig.level = 0.01,  
         # hide correlation coefficient on the principal diagonal
         diag = FALSE 
)



#kmeans clluestering
km.out3=kmeans(dataframe3,5,nstart=20)
km.out4=kmeans(dataframe4[, -11],2)
km.out3
km.out4
km.out3$cluster
km.out4$cluster
plot(dataframe3, col=(km.out3$cluster+1), main="K-Means Clustering with K=5", 
     xlab="", ylab="", pch=20, cex=2)

plot(dataframe4[, c(2,9)], col=(km.out4$cluster+1), main="K-Means Clustering with K=5", 
     xlab="", ylab="", pch=20, cex=2)

summary(dataframe3)




#heirarchical clustering 

hc.complete=hclust(dist(dataframe4[c(1:100),c(9,10)]), method="complete")

plot(hc.complete)

length(dataframe3$total_amount)

a<-c(as.numeric(dataframe4$pickup_longitude[20]), as.numeric(dataframe4$pickup_latitude[20]))
a
abc <- revgeocode(a)
abc


dataframe4 <- dataframe4 %>%
	mutate(location = z)

z <- mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), dataframe4$pickup_longitude, dataframe4$pickup_latitude)

z

# Plots dropoff locations on map with heatmap based on time of day
seq <- seq(0, 86400, 3600)
#dataframe4$time <- hms(dataframe2$droptime)
#dataframe4$time <- as.numeric(dataframe4$time)
dataframe4$time <- dataframe2$droptime
dataframe4$dropoff_by_hour <- as.numeric(cut2(dataframe4$time, seq))

nyc_base <- ggmap::get_map("New York City", zoom = 14)
ggmap(nyc_base) + geom_point(data=dataframe4, aes(x=dropoff_longitude, y=dropoff_latitude, color=dropoff_by_hour))

dataframe5 <- dataframe4

df_size <- nrow(dataframe4)

subsets <- seq(0, df_size, df_size/24)

length(subsets)

df <- dataframe4
#vec_len <- c()
cluster_complete <- c()
cluster_average <- c()
cluster_single <- c()
for (i in 1:(length(subsets)-1)){
  #attach(mtcars)
  par(mfrow=c(3,1))
  df <- dataframe4[subsets[i]:subsets[(i+1)],]
  #vec_len <- c(vec_len, nrow(df))
  #write.csv(dataframe6, paste("./Github/NYC-College-Taxi/cluster/test", i, ".csv", sep=""))
  
  hc.complete=hclust(dist(df), method="complete")
  plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
  cluster_complete <- c(cluster_complete, hc.complete)
  #
  hc.average=hclust(dist(x), method="average")
  plot(hc.average,main="Average Linkage", xlab="", sub="", cex=.9)
  cluster_average <- c(cluster_average, hc.average)
  #
  hc.single=hclust(dist(x), method="single")
  plot(hc.single,main="Single Linkage", xlab="", sub="", cex=.9)
  cluster_single <- c(cluster_single, hc.single)
  #print(i)
  #invisible(readline(prompt="Press [enter] to continue"))
}

par(mfrow=c(3,1))
plot(cluster_complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(cluster_average,main="Average Linkage", xlab="", sub="", cex=.9)
plot(cluster_single,main="Single Linkage", xlab="", sub="", cex=.9)

#keep <- c('trip_distance','RatecodeID','totaltime')
#dataframe5 <- dataframe5[ , names(dataframe5) %in% keep]
#dataframe6 <- dataframe5[1:10000,]
#write.csv(dataframe6, "./Github/NYC-College-Taxi/test.csv")


