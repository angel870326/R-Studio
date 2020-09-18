#上次Ｒ小考TA講解

#1
library(openxlsx)
s1<-read.xlsx("/Users/angelwang/Desktop/Sample.1990-1207.xlsx",sheet = "Census")

s1$Sex<-factor(s1$Sex,levels = c(1,2),labels = c("男性","女性"))
table1<-table(s1$Sex)
table2<-prop.table(table1)
sex.table<-data.frame(cbind(table1,table2))
sex.table$累積次數<-cumsum(sex.table$table1)
sex.table$累積百分比<-cumsum(sex.table$table2)
names(sex.table)<-c("人數","百分比","累積次數","累積百分比")
sex.table
barplot(table(s1$Sex),main = "兩性人數",ylab = "人數",ylim = c(0,3000))

table(s1$Sex,s1$status)

#2
s1.household<-s1[s1$relation==1,]
# , 右邊是變項
table(s1.household$Sex)

s1.household<-s1[s1$relation==1,"s1$Sex"]
class(s1.household)
str(s1.household)

#把數字變文字或把文字變數字
as.numeric()
as.character()

%in%



#4
a1<-s.age[s.age$Town==1,];a1<-mean(a1$age)
#放到excel往下拉就會自動跑出365個




