packages=c("dplyr")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

######Select
m<-airquality

select(m,Day,starts_with("T"))

select(m, Ozone:Temp)


######Filter
filter(airquality, Temp>50 & Month==8)


######Arrange
m<-filter(airquality, Temp>50 & Month==8)

head(m,3)
tail(m,3)

m<-arrange(m, desc(Temp))

head(m,3)
tail(m,3)

######Rename
m<-airquality

rename(m, temperature=Temp)


######Mutate/transmutate
m<-mutate(airquality, temperature_celsius=round((Temp-32)/1.8,0))

head(m)

m1<-transmute(airquality, temperature_celsius=round((Temp-32)/1.8,0))

head(m1)

######Group_by()
month<-group_by(m,Month)

summarize(month,avgT=mean(temperature_celsius))

######%>%
group_by(airquality,Month) %>% summarize(avgT=mean(Temp))%>% 
  mutate(temperature_celsius=round((avgT-32)/1.8,0))

######lag() and lead()
r<-data.frame(year=2005:2014,population=sample(14000:15000, 10, replace=T))

r<-cbind(r,lag(r$population))

names(r)<-c("year","pop","pop1")

index<-as.data.frame(r%>%group_by(year)%>%mutate(index=round(100*(1+(pop-pop1)/pop1),2)))%>%
  select(year,pop,index)

index

######join
product<-read.csv(file="./Sample data files/bi_product.txt", sep=";", header=TRUE)

manufacturer<-read.csv(file="./Sample data files/bi_manufacturer.txt", sep=";", header=TRUE)


#inner join
inner_join(product,manufacturer,by="ManufacturerID") %>% select(Manufacturer,Product)

#How many products per manufacturer
inner_join(product,manufacturer,by="ManufacturerID") %>% select(Manufacturer)  %>% 
  group_by(Manufacturer) %>% summarise(NoP=n()) %>% arrange(desc(NoP))

#Display products from Barba manufacturer
inner_join(product,manufacturer,by="ManufacturerID") %>% filter(Manufacturer=="Barba") %>%
  select(Product) 

