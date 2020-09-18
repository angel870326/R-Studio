# 讀 資 料 (這個比較快)
library(openxlsx)
sample1990<-read.xlsx("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet = 1)





                                                                           #20161102
#用sample1990計算你家鄉(鄉鎮市區層級)的平均年齡，男女性別比例
library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)
TownName<-data.frame(sample1990$TownName,sample1990$Age,sample1990$Sex)
XD<-data.frame(TownName[TownName$sample1990.TownName=="新店",])
mean(XD$sample1990.Age)
sexxd<-data.frame(table(XD$sample1990.Sex))
sexxd$Percent <- sexxd$Freq/sum(sexxd$Freq)*100
sexxd$Percent




###################################### 次 數 分 佈 #################################

# 1.次數分布、圖型  (描述變項)

# Sex
fds<-data.frame(table(sample1990$Sex))
names(fds) <- c("Sex","Freq")
fds$Sex <- c("Male","Female")
fds
barplot(table(sample1990$Sex),names=c("male","female"))
# Age
fda<-data.frame(table(sample1990$Age))
names(fda) <- c("Age","Freq")
fda
barplot(table(sample1990$Age))
# Marital Status
fdm<-data.frame(table(sample1990$MaritalStatus))
names(fdm) <- c("MaritalStatus","Freq")
fdm$MaritalStatus <- c("未婚","有配偶同居","離婚分居","喪偶")
fdm
par(family="STKaiti")
barplot(table(sample1990$MaritalStatus),names=c("未婚","有配偶同居","離婚分居","喪偶"))
# Education
fde<-data.frame(table(sample1990$edu))
names(fde) <- c("edu","Freq")
fde$edu <- c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","研究所","不識字","自修")
fde
barplot(table(sample1990$edu),names=c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","研究所","不識字","自修"))
# Status
fdst<-data.frame(table(sample1990$status))
names(fdst) <- c("status","Freq")
fdst$status <- c("雇主","自營作業","私人僱用","政府僱用","無酬工作者")
fdst
barplot(table(sample1990$status),names=c("雇主","自營作業","私人僱用","政府僱用","無酬工作者"))



#################################### Sample 抽 樣 #################################

#2.抽取120 人，簡單隨機可替代樣本  五個變項的次數分布、圖型(描述)

# Sex
sex <-sample(sample1990$Sex,size =120,replace = TRUE )
sexf <-data.frame(table(sex))
sexf$sex<-c("male","female")
sexf
barplot(table(sex),names=c("male","female"))
# Age
age <-sample(sample1990$Age,size =120,replace = TRUE )
agef <-data.frame(table(age))
agef
barplot(table(age))
# Marital Status
maritalstatus <-sample(sample1990$MaritalStatus,size =120,replace = TRUE )
msf <-data.frame(table(maritalstatus))
msf$maritalstatus<-c("未婚","有配偶同居","離婚分居","喪偶")
msf
barplot(table(maritalstatus),names=c("未婚","有配偶同居","離婚分居","喪偶"))
#Education
edu <-sample(sample1990$edu,size =120,replace = TRUE )
eduf <-data.frame(table(edu))
eduf$edu<-c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","不識字","自修")
eduf
barplot(table(edu),names=c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","不識字","自修"))
#Status
status <-sample(sample1990$status,size =120,replace = TRUE )
stf<-data.frame(table(status))
stf$status<-c("雇主","自營作業","私人僱用","政府僱用","無酬工作者")
stf
barplot(table(status),names=c("雇主","自營作業","私人僱用","政府僱用","無酬工作者"))




##################################### 機 率 分 佈 ##################################

#3.針對性別、年齡，做prob、dist  做出機率分布，是否和母體相同  (抽取一千萬次)

#性別 機 率 分 佈
a.samples <-sample(sample1990$Sex,size =10000000,replace = TRUE )
pds<-data.frame(table(a.samples))
pds$Percent <- pds$Freq/sum(pds$Freq)*100
ProbabilityDistributionSex <- pds
ProbabilityDistributionSex$a.samples<-c("male","female")
ProbabilityDistributionSex
pd<-table(a.samples)
barplot(pd,names=c("male","female"))

#年齡 機 率 分 佈
b.samples <-sample(sample1990$Age,size =10000000,replace = TRUE )
pda<-data.frame(table(b.samples))
pda$Percent <- pda$Freq/sum(pda$Freq)*100
ProbabilityDistributionAge <- pda
ProbabilityDistributionAge
pd1<-table(b.samples)
barplot(pd1)




###################################### 抽 樣 分 佈 #################################
                                                                           #20161109

#1.建立樣本數=120，抽取1000次及100000次的變異數及中位數的抽樣分布，並求各抽樣分佈的變異數及中位數平均。

# 讀 資 料
library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)

# 變 異 數
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

# 中 位 數
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




                                                                          #20161109
##################################### 機 率 分 佈 #################################
                                                                          

#抽取20個樣本（抽取10萬次），做出0-20個男生的機率分佈的table

#男
s <- vector(length = 100000)
for(i in 1:100000){s[i]<-data.frame(table(sample(x=sample1990$Sex,size=20,replace = T)))["1","Freq"]}
pd<-data.frame(table(s))
pd$Percent <- pd$Freq/sum(pd$Freq)*100
ProbabilityDistributionMale <- pd
names(ProbabilityDistributionMale)<-c("Male","Freq","Percent")
ProbabilityDistributionMale







                                                                          #20161116
######################################## e r r o r ################################

#sample1990$Age抽120人共100000次，求error（樣本平均-母體平均）的分佈圖，並求error的平均、變異數、標準差
library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)

N<-120
xbars <- vector(length = 100000)
mean(sample(x=sample1990$Age,size=N,replace = T))
for(i in 1:100000){xbars[i]<-mean(sample(x=sample1990$Age,size=N,replace = T))}
mu<-mean(sample1990$Age)
errors<-xbars-mu
hist(errors)
mean(errors)
var(errors)
sd(errors)




###################################### 信 賴 區 間 ################################

#sample1990$Age，分別用alpha=0.01（N=120）、alpha=0.05（N=120、600），各抽100000次，計算母體平均落在信賴區間的次數及落在區間外的次數

c<-vector(length = 100000)
for (i in 1:100000) {
  mu<-mean(sample1990$Age)
  sample3<-sample(sample1990$Age,120,replace = T) 
  upper<-mean(sample3)+(2.58*sd(sample3)/sqrt(120))
  lower<-mean(sample3)-(2.58*sd(sample3)/sqrt(120))
  c[i]<-ifelse(mu<=upper&mu>=lower,"correct","wrong")}
table(c)


a<-vector(length = 100000)
for (i in 1:100000) {
  mu<-mean(sample1990$Age)
  sample1<-sample(sample1990$Age,120,replace = T) 
  upper<-mean(sample1)+(1.96*sd(sample1)/sqrt(120))
  lower<-mean(sample1)-(1.96*sd(sample1)/sqrt(120))
  a[i]<-ifelse(mu<=upper&mu>=lower,"correct","wrong")}
table(a)


b<-vector(length = 100000)
for (i in 1:100000) {
  mu<-mean(sample1990$Age)
  sample2<-sample(sample1990$Age,600,replace = T) 
  upper<-mean(sample2)+(1.96*sd(sample2)/sqrt(600))
  lower<-mean(sample2)-(1.96*sd(sample2)/sqrt(600))
  b[i]<-ifelse(mu<=upper&mu>=lower,"correct","wrong")}
table(b)





