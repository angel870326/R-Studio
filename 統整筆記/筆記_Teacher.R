##################################################################20161026

#Normal Distribution
mu <- 0
sigma <- 1
x <- seq(from=-3,to=3,by=.1)
x
y <- 1/(sigma*sqrt(2*pi))*exp(-1/2*((x-mu)/sigma)**2)
y
plot(x=x,y=y,type = "l")
abline(h=0)

##
mu <- 0
sigma <- 1
x <- seq(from=-3,to=3,by=.1)
y <- dnorm(x)
plot(x=x,y=y,type = "l")
abline(h=0)



#same location, variances
x<-seq(-10,10,by=.1)
y1<-dnorm(x,mean=0,sd=1)
y2<-dnorm(x,mean=0,sd=2)
y3<-dnorm(x,mean=0,sd=3)
y4<-dnorm(x,mean=0,sd=4)
plot(x=x,y=y1,type = "l",col="black",lwd=1.5)
lines(x=x,y=y2,col="blue",lwd=1.5)
lines(x=x,y=y3,col="darkgreen",lwd=1.5)
lines(x=x,y=y4,col="gold",lwd=1.5)
#
x<-seq(-10,10,by=.1)
y1<-dnorm(x,mean=-2,sd=0.5)
y2<-dnorm(x,mean=0,sd=2)
y3<-dnorm(x,mean=2,sd=3)
y4<-dnorm(x,mean=5,sd=1)
plot(x=x,y=y1,type = "l",col="black",lwd=1.5)
lines(x=x,y=y2,col="blue",lwd=1.5)
lines(x=x,y=y3,col="darkgreen",lwd=1.5)
lines(x=x,y=y4,col="gold",lwd=1.5)


#課本p.397
pnorm(1.55)
1-pnorm(1.55)
pnorm(1.55)-0.5


####################################################################20161102
sample1990<-rio::import(file="/Users/angelwang/Desktop/Sample.1990.xlsx")
names(sample1990)
table(sample1990$MaritalStatus)
M<-nrow(sample1990)
1:M
#產生1個亂數
runif(1)
runif(1)*M
ceiling(runif(1)*M)

#在console的地方打ceiling跑出來的值
#> census[2229,"MaritalStatus"]
#[1] "2"



##################################################################20161109

library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)
str(sample1990)

###120
a.sample <-sample(x=sample1990$Age,size =120,replace = TRUE )
a.sample
mean(a.sample)
hist(a.sample)
hist(sample1990$Age)


N<-120
xbars <- vector(length = 1000)
sample(x=sample1990$Age,size=N,replace = T)
mean(sample(x=sample1990$Age,size=N,replace = T))
#for重複
for(i in 1:1000){xbars[i]<-mean(sample(x=sample1990$Age,size=N,replace = T))}
xbars
hist(xbars)
mean(xbars)
sd(xbars)


xbars <- vector(length = 100000)
sample(x=sample1990$Age,size=N,replace = T)
mean(sample(x=sample1990$Age,size=N,replace = T))
for(i in 1:100000){xbars[i]<-mean(sample(x=sample1990$Age,size=N,replace = T))}
xbars
hist(xbars,breaks = 100)
mean(xbars)
sd(xbars)
19.37855/sqrt(120)

#母體
mean(sample1990$Age)
sd(sample1990$Age)


#######################################################################20161116
library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)
sample1990$Age

N<-120
a.sample<-sample(x=sample1990$Age,size=N,replace = T)
mu<-mean(sample1990$Age)
xbar<- mean(a.sample)
error<-xbar-mu
print(mu)
print(xbar)
print(error)

xbars <- vector(length = 100000)
sample(x=sample1990$Age,size=N,replace = T)
mean(sample(x=sample1990$Age,size=N,replace = T))
for(i in 1:100000){xbars[i]<-mean(sample(x=sample1990$Age,size=N,replace = T))}
mean(xbars)
errors<-xbars-mu
print(xbars)
print(errors)
hist(print(errors))





