#####Changing R version to Microsoft Open R
library(RevoScaleR)
rxOptions(reportProgress = 1) # reduces the amount of output RevoScaleR produces


#importing csv with base function 544498 rows
st <- Sys.time()
   input_csv <- 'yellow_tripsample_2016-01.csv'

   nyc_sample_df <- read.csv(input_csv)
   
   
   summary(nyc_sample_df$fare_amount)
   

Sys.time() - st # stores the time it took to import
   
   

#importing with revoscale funtion
st <- Sys.time()
   input_csv <- 'yellow_tripsample_2016-01.csv'

   input_xdf <- 'yellow_tripdata_201601.xdf'

   rxImport(inData=input_csv, outFile=input_xdf, overwrite = TRUE,reportProgress = 1)
   
   rxSummary( ~ fare_amount,input_xdf )

Sys.time() - st 

###Change Rstudio back to R
