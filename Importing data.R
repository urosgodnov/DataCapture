######Importing data from web
MLB<-read.csv(url("http://www.exploredata.net/ftp/MLB2008.csv"))

#Display first six rows
head(MLB)

#Number of rows 
nrow(MLB)


######Importing from local file
local_data<-read.csv("./Sample data files/Cars.csv", header=TRUE,sep=",", stringsAsFactors=FALSE)

head(local_data)

######Importing from local file with RIO package
packages=c("rio")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

SPSS<-import(file="./Sample data files/Sample SPSS.sav")
head(SPSS)


######Extra quandl package############
packages=c("Quandl")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

#bitcoin
quandldata = Quandl("BITFINEX/BTCUSD", start_date="2016-01-01")
plot(quandldata[,1:2])

