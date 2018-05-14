#If - basic
x<-"condition2"

if (x=="condition1")
{
  print("Condition 1")
} else
{
  print("not condition 1")
}

#if - nested ifs
x<-"condition2"

if (x=="condition1")
{
  print("Condition 1")
} else if (x=="condition2")
{
  print("condition 2")
} else
{
  print("Something different")
}

#loops
for(i in 1:10) {
  print(i)
}

l<-as.list(1:10)
for(i in 1:length(l)) {
  print(l[[i]])
}


#Lab solution
data<-read.csv(file="Master.csv")
columns<-as.list(names(data))

b<-0
d<-0

for (i in 1:length(columns)) {
  
  fl<-substr(columns[[i]],1,1)
  
  if (fl=="b")
  {b<-b+1}
  
  if (fl=="d")
  {d<-d+1}
  
  
}
print("First letter b")
print(b)

print("First letter d")
print(d)



#Faster solution
data<-read.csv(file="Master.csv")
ncolb<-ncol(data%>%select(starts_with("b")))
ncold<-ncol(data%>%select(starts_with("d")))
ncolb
ncold
