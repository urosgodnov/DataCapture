packages=c("ggplot2","ggthemes","ggThemeAssist","gridExtra","plotly","lattice")
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

index$year<-as.character(index$year)

##############Basic function############

plot(index$year,index$pop)

#lines
plot(index$year,index$pop, type="l")

#histogram
plot(index$year,index$pop, type="h")

#title and axis labels
plot(index$year,index$pop, type="l", main="Population by year",
     xlab="year",ylab="population")


##############Lattice############
data<-index[,1:2]
dotplot(pop~year,data=data,main="Population by year",
        xlab="year",ylab="population", pch=4)

###########ggplot2#################
######Basic object

g<-ggplot(index,aes(x=year,y=pop, group=1))+geom_line()


######Adding titles
g<-g+ggtitle("Population by year")+xlab("Year")+ylab("Population")

g

######Adding theme
g<-g+theme_light()

g

######ggThemeAssistGadget
ggThemeAssistGadget(g)


######Facet_grid
g<- ggplot(airquality, aes(x=Ozone, y=Temp))+geom_point()

g

g<-g+ggtitle("Ozone vs. Temp")+facet_grid(Month~.)

g

g<-g+facet_grid(.~Month)+ggtitle("Ozone vs. Temp by months")

g


######Geom_smooth
g<- ggplot(airquality, aes(x=Ozone, y=Temp))+geom_point()

g<-g+geom_smooth(method = lm, se = FALSE)

g

g<-g+facet_grid(.~Month)+ggtitle("Ozone vs. Temp by months")

g<-g+geom_smooth(method = lm, se = FALSE)

g

######gridExtra
g<- ggplot(airquality, aes(x=Ozone, y=Temp))+geom_point()
g<-g+facet_grid(.~Month)+ggtitle("Ozone vs. Temp by months")
g<-g+geom_smooth(method = lm, se = FALSE)

g

y<- ggplot(index,aes(x=year,y=pop, group=1))+geom_line()
y<-y+ggtitle("Population by year")+xlab("Year")+ylab("Population")

y


grid.arrange(g, y, ncol=2)
grid.arrange(g, y, nrow=2)


######Geom_bar

#data already aggregated
g<-ggplot(index,aes(x=year,y=pop))+geom_bar(stat="identity")

#data needs to be aggregated
m<-as.data.frame(mpg)

ggplot(m, aes(x=class))+geom_bar(stat="count")

######fill
t<-as.data.frame(Titanic)

t1<-ggplot(t,aes(x=Class,y=Freq, fill=Survived))+geom_bar(stat="identity", position = "dodge")

t1<-t1+facet_grid(Sex~Age)

t1

######Lab
t<-as.data.frame(Titanic) %>%group_by(Age,Sex,Class)%>% mutate(percentage=round(100*Freq/sum(Freq)))


t1<-ggplot(t,aes(x=Class,y=percentage, fill=Survived))+geom_bar(stat="identity")

t1<-t1+facet_grid(Sex~Age)

t1

######plotly

ggplotly(t1)  

