#########################################################20161005

#install packages
install.packages("XLConnect")

#remove packages
remove.packages('ggplot2')

#load packages
require(haven)
library(haven)

#detach packages 分離
detach("package:haven")

#Basic Symbols

#assign
x<-99
y<-5

#math
x+y
x-y
x/y
x*y
x^2

#餘數
x%%y
#整除
x%/%y

#計算1+.....+20
sum(1:20)

#計算1+....+30的平均
mean(1:30)

#計算1到10連乘
prod(1:10)

#平方根
sqrt(89)

#數列
a<- 1:100

#vector
age=c(78,35,90,24,54)
age





###############################################################20161012
#basic symbols
#c (連結之意：concatenate)
lucky=c(1,2,3)
area=c("新北市","新竹市","高雄縣")

#R基本運算
age=c(78,35,90,24,54)
weight=c(45,68,32,55,52)
mean(weight)
mean(age)
#相關係數
cor(age,weight) 
#圖
plot(age,weight) 


#數學運算函數
x<-98.54321
abs(x) #絕對值
round(x) #四捨五入
round(x,digits = 3) #四捨五入到小數點後第3位
ceiling(x) #比x高的最小整數
floor(x) #比x低的最大整數
trunc(x) #無條件捨去

#數學運算
x<-100
log(x)
log10(x)
log(x,base=10)

# map
install.packages("tmap")
install.packages("maptools")
library(tmap)
library(maptools)
map<-read_shape()
#圖
#在hw裡


############################################################20161019
#logical symbols

c<-100
#也可以用數列
c<-100:300

d<-200
c>d
c<d
c>=d
c<=d
c!=d #!不等於
c==d #==真正的等於

#R的運算特性
c(2,3,4,5)+c(10,20,30,40)
c(2,3,4,5)-c(10,20,30,40)
c(2,3,4,5)*c(10,20,30,40)
c(2,3,4,5)/c(10,20,30,40)

b<-1000
b+c(10,20,30,40,50)

#第四個會再從10開始(ex:5+10)
c(2,3,4,5)+c(10,20,30)
c(2,3,4,5)-c(10,20,30)
c(2,3,4,5)*c(10,20,30)
c(2,3,4,5)/c(10,20,30)

#運算
age<-c(78,35,90,24,54)
plus<-10
age<-age+plus
age

#generate random numbers
e <- runif(10)
e
f <- rnorm(10)
f
g <- runif(10)*100
g


#中括號
letters #小寫英文字母
LETTERS #大寫

letters[1:9]
LETTERS[1:9]

LETTERS[14]
letters[3]
letters[3]
letters[21]

Slogan <- paste0(LETTERS[9]," ",LETTERS[12],letters[15],letters[22],letters[5]," ",LETTERS[14],letters[3],letters[3],letters[21])
Slogan


#plot畫圖
install.packages("plotrix")
library(plotrix)
plot(x=c(-5,5),y=c(-5,5),type = "n")
draw.circle(x=0,y=0,radius=2,nv=100,border="blue",col="tan2")

#基本環境
getwd()
setwd("D:/Rdata")

#套件存放位置
.libPaths()

#自助
??
?mean
??mean
example(mean)
demo(lm.glm)
vignette("stargazer")


#讀寫檔案
###Excel
install.packages("XLConnect")
library(XLConnect)
writeWorksheetToFile(data=CO2,file="CO2.xlsx",sheet="new")
CO3 <- XLConnect   

##通用
install.packages("rio")
library(rio)
GSS <- import("D:/105社會統計/語法/資料/GSS2012.sav")
export(GSS,"GSS.sav")

#認識資料
GSS
names(GSS)
colnames(GSS) #橫
rownames(GSS) #直
head(GSS)
tail(GSS)

class(GSS)
str(GSS)

GSS$age

GSS[1,] #把第1個row叫出來
GSS[,1] #把第1個column叫出來
GSS[1,1]

#橫的前10個
GSS.new <- GSS[,1:10]
#直的前10個
GSS.cases <- GSS[1:10,]


#################################################################20161026
#check the data
data(GSS)
head(GSS)
#看前面幾項
tail(GSS)
#看後面幾項

dim(GSS)
#1475個case(左)    50個變項(上)

nrow(GSS)
#case
ncol(GSS)
#變項

str(GSS)
class(GSS)
#代表GSS是data.frame

unclass(GSS)
#把變項拆開來
summary(GSS)
#基本統計

View(GSS)
fix(GSS)

#資料類型
##character
address <- c("指南路二段64號","指南路二段65號")
address
class(address)

##interger
grades <- c(50L,60L,89L,43L,78L,100L)
grades

##factor
gender <- c(1,2,2,1,1,1,2,1)
table(gender)
gender <- factor(gender,levels=c(1,2),labels=c("男性","女性"))
gender


##date
date1 <- as.Date("2016-10-25")
date1
??as.numeric
as.numeric(date1)
as.Date(17099,origin="1911-1-1")

##NA
x <- rep(c(1,NA),10)
x

is.na(x)

##NULL
z <- c(3,NULL,4,5,NULL)
z

is.null(z)

z<- NULL
is.null(z)


##資料結構
vector
matrix
data.frame
list

##vector - numeric
a=1:200
a=c(1:100)
a=34:1
a=seq(from=3,to=98,by=3)
a=seq(from=3,to=98,length.out=4)
a


##sample
x1 <- sample(1:46,1000,replace=T)
x1


##vector-logical
a<- 1:200
b<-100
x<-(a--b)
x
class(x)
str(x)
sum(x)

##################################################################20161102
library(openxlsx)
library(XLConnect)

sample1990 <- openxlsx::read.xlsx("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1)

sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)
MP2013.new <- readWorksheetFromFile("/Users/angelwang/Desktop/MP-2013-Sample-New.xls",sheet=1,header=T)
MP2013 <- readWorksheetFromFile("/Users/angelwang/Desktop/MP-2013-Sample.xls",sheet=1,header=T)

#data.frame
a=data.frame(x=1:10,y=1:2,z="test")
mydata<-data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))

mydata[1:3,]
mydata[1,]
mydata[c(1,3),]

mydata[,"x1"]
mydata[,c("x1","x2")]

mydata[mydata$x1==2,]
mydata[mydata$x1>=2,]
mydata[mydata$x1!=2,]
mydata[mydata$x1>=2,"x2"]

