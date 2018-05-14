data<-airquality%>%select(Ozone,Temp)
ggplot(data,aes(x=Temp,y=Ozone))+geom_point()+geom_smooth(method="lm",se=FALSE)
lmodel<-lm(Ozone~Temp,data)

summary(lmodel)

residuals<-residuals(lmodel)
fitted<-predict(lmodel)

plot(residuals, fitted)
