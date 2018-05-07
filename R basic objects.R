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

list("1","2","3")
as.list(c("1","2","3"))

#Naming list's elements
l<-list(Monday=1,Tuesday=2,Wednesday=3)

print(l)

######Dataframe/tibble
d<-data.frame(days=1:70, visitors=1001:1070)
t<-tibble(days=1:70, visitors=1001:1070)

print(d)
print(t)

class(d)
class(t)

str(d)
str(t)

#Renaming columns in dataframe
names(d)<-c("Day in a week","Number of visitors")

