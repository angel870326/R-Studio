# 1.畫出正方形及長方形
L=c(0,0,0,0,0,0,1,2,3,4,5,5,5,5,5,5,4,3,2,1,0)
W=c(0,1,2,3,4,5,5,5,5,5,5,4,3,2,1,0,0,0,0,0,0)
plot(L,W,type = "l")

plot(L,W)
lines(L,W)



l=c(0,0,0,0,1,2,3,4,5,5,5,5,4,3,2,1,0)
w=c(0,1,2,3,3,3,3,3,3,2,1,0,0,0,0,0,0)
plot(l,w,type = "l")

plot(l,w)
lines(l,w)


# 2.在台灣地圖上標出你家的地理位置，並註記縣市鄉鎮名稱
install.packages("tmap")
install.packages("maptools")
install.packages("sp")
library(tmap)
library(maptools)
library(sp)
map <- read_shape("/Users/angelwang/Desktop/台灣地圖.shp")
plot(map)
points(121.503071,24.941421,cex=2,pch=19,col="red")
text(123,26,"New Taipei City, Xindian District")


#20161014實習課
library(haven)
GSS <- read_sav("/Users/angelwang/Desktop/GSS2012.sav")
GSS

names(GSS)
GSS$sex
xx=GSS$sex
xx
table(GSS$sex)
pie(table(xx))

snames <- c("男性","女性")
pie(table(xx),labels = snames)

barplot(table(GSS$age))
hist(GSS$age)

barplot(table(GSS$relig),legend=c("Protestant","Catholic","Jewish","None","Other"))


# 3.製作一個名稱為iq的變項，其中包含100;90;121;145;111等數字，並做出將其乘以6的結果

iq=c(100,90,121,145,111)
iq*6








#課本：
library(haven)
GSS <- read_sav("/Users/angelwang/Desktop/GSS2012.sav")
GSS

names(GSS)
GSS$attend
xx=GSS$attend
xx
table(GSS$attend)
sum(table(GSS$attend))

y <- table(GSS$attend)
round((y/1457) *100,digits = 1)
sum(round((y/1457) *100,digits = 1))

round((y/1451) *100,digits = 1) 
sum(round((y/1451) *100,digits = 1))

cumsum(round((y/1451) *100,digits = 1))

 
#圓餅圖
pie(table(xx))
snames <- c("Never","LT Once a Year","Once a Year","Several Times a Year","Once a Month","2-3* A Month","Nearly Every Week","Every Week","More than Once Week")
pie(table(xx),labels = snames)



#長條圖
hist(GSS$age,breaks = seq(16.5,91,2) , xlim = c(0,100) )

hist(GSS$age,breaks = seq(0,100,2) , xlim = c(0,100) )


#2.13

GSS$relig
table(GSS$relig)
snames <- c("Protestant","Catholic","Jewish","None","Other")
pie(table(GSS$relig),labels = snames)
barplot(table(GSS$relig),names=snames)

GSS$hrs1
table(GSS$hrs1)
hist(GSS$hrs1,labels=TRUE,breaks<-seq(0,100,10))
"hrs1"<-c(5,15,25,35,45,55,65,75,85,95)
"Frequency"<-c(56,70,69,343,173,103,28,11,5,0)
plot(hrs1,Frequency,type = "l")



