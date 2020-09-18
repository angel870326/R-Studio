#1. 用sample1990的做S^2x(變異數)跟中位數的抽樣跟畫圖（好像就是老師上課用R教的）
#1.建立樣本數=120，抽取1000次及100000次的變異數及中位數的抽樣分布，並求各抽樣分佈的變異數及中位數平均。


library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)

xbars <- vector(length = 1000)
var(sample(x=sample1990$Age,size=120,replace = T))
for(i in 1:1000){xbars[i]<-var(sample(x=sample1990$Age,size=120,replace = T))}
hist(xbars,breaks = seq(200,600,20))
mean(xbars)

xbars1 <- vector(length = 100000)
var(sample(x=sample1990$Age,size=120,replace = T))
for(i in 1:100000){xbars1[i]<-var(sample(x=sample1990$Age,size=120,replace = T))}
hist(xbars1,breaks = seq(200,600,20))
mean(xbars1)



xbars2 <- vector(length = 1000)
median(sample(x=sample1990$Age,size=120,replace = T))
for(i in 1:1000){xbars2[i]<-median(sample(x=sample1990$Age,size=120,replace = T))}
hist(xbars2,breaks = seq(15,40,1))
mean(xbars2)

xbars3 <- vector(length = 100000)
median(sample(x=sample1990$Age,size=120,replace = T))
for(i in 1:100000){xbars3[i]<-median(sample(x=sample1990$Age,size=120,replace = T))}
hist(xbars3,breaks = seq(15,40,1))
mean(xbars3)





#2. P.399的表跟圖（先畫一個常態分佈在找數個df,然後要標出什麼1.2以上的範圍做比較）
#2.製作t表，製作圖（各個df），利用t(df=1和10)和z比較tail差異（放大圖），注意：請標明z跟t的線。

t.10<-abs(round(qt(0.10, df = c(1:30,40,60,120,Inf)),3))
t.05<-abs(round(qt(0.05, df = c(1:30,40,60,120,Inf)),3))
t.025<-abs(round(qt(0.025, df = c(1:30,40,60,120,Inf)),3))
t.01<-abs(round(qt(0.01, df = c(1:30,40,60,120,Inf)),3))
t.005<-abs(round(qt(0.005, df = c(1:30,40,60,120,Inf)),3))
t.0005<-abs(round(qt(0.0005, df = c(1:30,40,60,120,Inf)),3))
df<-c(1:30,40,60,120,Inf)
t<-cbind.data.frame(df,t.10,t.05,t.025,t.01,t.005,t.0005)
names(t)<-c("df","0.10","0.05","0.025","0.01","0.005","0.0005")
t

#t圖
tt <- seq(-4,4,by=0.0001)
df10 <- dt(tt,df=10)
plot(tt,df10,type = "l",col="brown")
df4 <- dt(tt,df=4)
lines(tt,df4,type = "l",col="blue3")
df1 <- dt(tt,df=1)
lines(tt,df1,type = "l",col="black")

legend(2,0.3,c("df1","df4","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue3","brown"))






#圖
Z<-seq(from=-4.00,to=4.00,by=0.01)
y<-dnorm(Z,mean=0,sd=1)
plot(x=Z,y=y,type = "l",col="black",lwd=1.5)

xx <- seq(-4,4,by=0.0001)
df1 <- dt(xx,df=1)
lines(xx,df1,type = "l",col="blue")
df10 <- dt(xx,df=10)
lines(xx,df10,type = "l",col="green")

legend(2,0.2,c("z","df1","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","green"))


#放大
vZ<-seq(from=1.8,to=4.00,by=0.01)
vy<-dnorm(vZ,mean=0,sd=1)
plot(x=vZ,y=vy,type = "l",col="black",lwd=1.5)

vxx <- seq(1.8,4,by=0.0001)
vdf1 <- dt(vxx,df=1)
lines(vxx,vdf1,type = "l",col="blue")
vdf10 <- dt(vxx,df=10)
lines(vxx,vdf10,type = "l",col="green")

legend(3,0.06,c("z","df1","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","green"))






#1試
c <- round(1-pnorm(Z),4)
df1<-abs(round(qt(c, df = 1),3))
df1.1<-round(qt(c, df = 1),3)
lines(x=c(df1,df1.1),y=c(c,c),type = "l")


#2試
c <- seq(from=0,to=1,by=0.0001)
df1<-abs(round(qt(c, df = Inf),3))
df1
df1.1<-round(qt(c, df = Inf),3)
lines(x=c(df1,df1.1),y=c(c,c),type = "l")

xx <- seq(-4,4,by=0.0001)
yy <- dt(xx,df=1)
plot(xx,yy,type = "l")





#3. Sex  N=20 男生女生的人數？ 0～20個男生的機率？ 男生的次數機率分佈（上次作業那樣）
#3.用sample1990抽取20個樣本（抽取10萬次），做出性別的table，並描述0-20個男生的機率分佈。

#男
s <- vector(length = 100000)
for(i in 1:100000){s[i]<-data.frame(table(sample(x=sample1990$Sex,size=20,replace = T)))["1","Freq"]}
pd<-data.frame(table(s))
pd$Percent <- pd$Freq/sum(pd$Freq)*100
ProbabilityDistributionMale <- pd
names(ProbabilityDistributionMale)<-c("Male","Freq","Percent")
ProbabilityDistributionMale





#試
s <- vector(length = 100000)
for(i in 1:100000){s[i]<-sample(x=sample1990$Sex,size=20,replace = T)}  
table(s)
ss<-data.frame(table(s))
ss["1","Freq"]

for(i in 1:100000){s[i]<-(sample(x=sample1990$Sex,size=20,replace = T))["1","Freq"]}














for(i in 1:100000){s[i]<-data.frame(table(sample(x=sample1990$Sex,size=20,replace = T)))["2","Freq"]}
table(s)







#同學
male<- vector(length = 100000)
a<-sample(x=sample1990$Sex,size = 20,replace = T)
for(i in 1:100000){male[i]<-data.frame(table(a))[1,"Freq"]}






