########################################20161026####################################

###sample抽樣

#創造出一個有2000筆資料，4個變項的資料（年齡、性別、體重、婚姻狀態（單身、已婚、離婚、喪偶））

age <- sample(30:80,2000,replace = T)
gender <- sample(c("male","female"),2000,replace=T)
weight <- sample(40:90,2000,replace = T)
marital_status <- sample(c("單身","已婚","離婚","喪偶"),2000,replace=T)

mydata <- data.frame(age,gender,weight,marital_status)
head(mydata)
tail(mydata)

#年齡與體重 平均數、標準差
mean(age)
mean(weight)
sd(age)
sd(weight)

#性別與婚姻狀態  次數交叉表
table(gender,marital_status)





####################################20161019課本題##################################
library(rio)
States <- import("/Users/angelwang/Desktop/!!政治大學/社會統計/資料檔/States.sav")
names(States)




#######################################20161012#####################################

# 1.畫出正方形及長方形
L=c(0,0,0,0,0,0,1,2,3,4,5,5,5,5,5,5,4,3,2,1,0)
W=c(0,1,2,3,4,5,5,5,5,5,5,4,3,2,1,0,0,0,0,0,0)
plot(L,W,type = "l")

l=c(0,0,0,0,1,2,3,4,5,5,5,5,4,3,2,1,0)
w=c(0,1,2,3,3,3,3,3,3,2,1,0,0,0,0,0,0)
plot(l,w,type = "l")

# 2.在台灣地圖上標出你家的地理位置，並註記縣市鄉鎮名稱
install.packages("tmap")
install.packages("maptools")
install.packages("sp")
library(tmap)
library(maptools)
library(sp)
map <- read_shape("/Users/angelwang/Desktop/!!政治大學/社會統計/資料檔/台灣地圖.shp")
plot(map)
points(121.503071,24.941421,cex=2,pch=19,col="red")
text(123,26,"New Taipei City, Xindian District")

# 3.製作一個名稱為iq的變項，其中包含100;90;121;145;111等數字，並做出將其乘以6的結果
iq=c(100,90,121,145,111)
iq*6







#####################################20161005算數####################################

#計算1乘到170
prod(1:170)

#計算1到1000中所有偶數的連乘
a<-seq(from=2,to=1000,by=2)
prod(a)

#計算1到8888數列中為3的倍數之數字的總和
z<-seq(from=3,to=8886,by=3)
sum(z)

#請產生一串數列，從5到1990，中間每個數字間隔5，並計算此數列的平均數與標準差
y<-seq(from=5,to=1990,by=5)
mean(y)
sd(y)

#計算27,18,36,77,102的平均
x<-c(27,18,36,77,102)
mean(x)



