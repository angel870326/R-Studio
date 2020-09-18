###讀資料
library(haven)
GSS <- read_sav("/Users/angelwang/Desktop/GSS2012.sav")
names(GSS)

#比較快
library(rio)
GSS <- import("/Users/angelwang/Desktop/GSS2012.sav")
names(GSS)




##看其中一個變項
GSS$sex
xx=GSS$sex
xx
table(xx)

##打出中文
par(family="STHeiti")


##畫圖

#圓餅圖
snames <- c("男性","女性")
pie(table(xx),labels = snames)
barplot(table(GSS$age))
hist(GSS$age)

#legend  圖的方匡註解
barplot(table(GSS$relig),legend=c("Protestant","Catholic","Jewish","None","Other"))



###課本

##p.40表
table(GSS$attend)
sum(table(GSS$attend))

#百分比
y <- table(GSS$attend)
round((y/1457) *100,digits = 1)
sum(round((y/1457) *100,digits = 1))

#扣除掉ＮＡ的百分比
round((y/1451) *100,digits = 1) 
sum(round((y/1451) *100,digits = 1))

#累計百分比
cumsum(round((y/1451) *100,digits = 1))

#自己做成data.frame
attend<-data.frame(table(GSS$attend))
attend$Percent<-round((y/1457) *100,digits = 1)
attend$Valid_Percent<-round((y/1451) *100,digits = 1)
attend$Cumulative_Percent<-cumsum(round((y/1451) *100,digits = 1))
attend$Var1<-c("Never","LT Once a Year","Once a Year","Several Times a Year","Once a Month","2-3* A Month","Nearly Every Week","Every Week","More than Once Week")



##p.52圓餅圖
xx<-GSS$attend
pie(table(xx))
snames <- c("Never","LT Once a Year","Once a Year","Several Times a Year","Once a Month","2-3* A Month","Nearly Every Week","Every Week","More than Once Week")
pie(table(xx),labels = snames)


##p.53 hist
hist(GSS$age,breaks = seq(16.5,91,2) , xlim = c(0,100) )
hist(GSS$age,breaks = seq(0,100,2) , xlim = c(0,100) )

##2.13
table(GSS$relig)
# pie chart
snames <- c("Protestant","Catholic","Jewish","None","Other")
pie(table(GSS$relig),labels = snames)
#barplot
barplot(table(GSS$relig),names=snames)

table(GSS$hrs1)
#histogram
hist(GSS$hrs1,labels=TRUE,breaks<-seq(0,100,10))
# line chart
"hrs1"<-c(5,15,25,35,45,55,65,75,85,95)
"Frequency"<-c(56,70,69,343,173,103,28,11,5,0)
plot(hrs1,Frequency,type = "l")




