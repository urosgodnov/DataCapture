######Dataframe
#columns
cars[,1]

cars[,c("speed")]
     
airquality[, c(1:3,5)]

#rows
cars[cars$speed==4,]

cars[cars$speed==4 & cars$dist==2,]

cars[cars$speed==4 | cars$dist>56,]
#both
airquality[airquality$Temp>75 & airquality$Wind>12, 4:5]


#sorting
newdata<-airquality[airquality$Temp>75 & airquality$Wind>12, 4:5]

newdata[order(newdata$Temp),] 

newdata[order(-newdata$Temp),] 
