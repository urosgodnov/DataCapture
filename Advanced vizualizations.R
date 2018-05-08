packages=c("rpart","rattle","rpart.plot","tidyverse","ggplot2",
           "gridExtra","caTools")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})


######Advanced vizualization#####################
p1<-ggplot(iris,aes(x=Species,y=Sepal.Length))+
  geom_point()+
  geom_boxplot(outlier.colour = "red")

p2<-ggplot(iris,aes(x=Species,y=Sepal.Width))+
  geom_point()+
  geom_boxplot(outlier.colour = "red")
  
p3<-ggplot(iris,aes(x=Species,y=Petal.Length))+
  geom_point()+
  geom_boxplot(outlier.colour = "red")

p4<-ggplot(iris,aes(x=Species,y=Petal.Width))+
  geom_point()+
  geom_boxplot(outlier.colour = "red")


grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)


#saving plot with grDevices
jpeg("iris.jpg",units="in",width=5, height=5, res=600)
grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)
dev.off()

#saving plot with ggsave
g <- arrangeGrob(p1, p2, p3, p4, ncol=2, nrow=2) #generates g
ggsave(file="iris.pdf", g)






#####Splitting data#########################
#sample_frac()

carsTrain<-sample_frac(cars,0.7)
carsTest<-anti_join(cars,carsTrain, by=c("speed","dist"))

print(paste("Number of all rows: ",nrow(cars)))
print(paste("Number of train rows: ",nrow(carsTrain)))
print(paste("Number of test rows: ",nrow(carsTest)))


#sample.split()
rowNumbers<-c(1:nrow(cars))

trainRows<- sample.split(rowNumbers,SplitRatio=0.7)

carsTrain<-cars[trainRows,]
carsTest<-cars[!trainRows,]

print(paste("Number of train rows: ",nrow(carsTrain)))
print(paste("Number of test rows: ",nrow(carsTest)))

################Linear regression#####################
library(devtools)
packages=c("caret")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})
install_github("kassambara/datarium")

# Load the data
data("marketing", package = "datarium")
# Inspect the data
sample_n(marketing, 10)

#splitting data
set.seed(123)
rowNumbers<-c(1:nrow(marketing))

trainRows<- sample.split(rowNumbers,SplitRatio=0.7)

train.data<-marketing[trainRows,]
test.data <-marketing[!trainRows,]

#creating model
model <-lm(sales~youtube+facebook+newspaper,data=train.data)

# Summarize the model
summary(model)

# perform step-wise feature selection
model<-step(model)
summary(model)

# Test model
predictions <- model %>% predict(test.data)

# Model performance
# Prediction error, RMSE
RMSE(predictions, test.data$sales)


#Our model
#sales = 3.43+ 0.045youtube + 0.187facebook


#Prediciton
# New advertising budgets
newdata <- data.frame(
  youtube = 2000, facebook = 1000,
  newspaper = 1000
)
# Predict sales values
model %>% predict(newdata)


##################Decision tree#####################
#set.seed(123)
rowNumbers<-c(1:nrow(iris))

trainRows<- sample.split(rowNumbers,SplitRatio=0.7)

train.data<-iris[trainRows,]
test.data <-iris[!trainRows,]

#model
model <- rpart(Species ~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length,
               data = train.data, method="class")

printcp(model) 

fancyRpartPlot(model, sub="Iris dataset")

out<- predict(model, test.data)

pred.response <- colnames(out)[max.col(out, ties.method = c("random"))] # predict response # actuals

print(paste("Accuracy is ",1-mean(test.data$Species != pred.response)))




