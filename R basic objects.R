######Vector
x <- c(0.5, 0.6) 

print(x)

x <- c(TRUE, FALSE)

print(x)

x <- c("a", "b", "c") 

print(x)

x <- 9:29 

print(x)

#getting object's class
class(x)

######Matrix
m <- matrix(1:9,3,3)

print(m)

#object's structure
str(m)

######List
as.list(1:12)

#Naming list's elements
l<-list(Monday=1,Tuesday=2,Wednesday=3)

print(l)

######Dataframe
d<-data.frame(days=1:7, visitors=1001:1007)

print(d)

class(d)

str(d)

#Renaming columns in dataframe
names(d)<-c("Day in a week","Number of visitors")

