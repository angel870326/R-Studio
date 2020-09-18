#電腦的cpu的廠牌名稱、速度


#電腦的ram廠牌名稱、速度、容量

#電腦的硬碟廠牌名稱、速度、容量

#ram廠商設計最高可放置＿條，容量共計＿

#R的版本
RStudio.Version()

#R軟體安裝位置
getwd()

#R的工作目錄(working directory)在哪
getwd()



#
.RData







#用sample1990計算你家鄉(鄉鎮市區層級)的平均年齡，男女性別比例
library(XLConnect)
sample1990 <- readWorksheetFromFile("/Users/angelwang/Desktop/Sample.1990.xlsx",sheet=1,header=T)
TownName<-data.frame(sample1990$TownName,sample1990$Age,sample1990$Sex)
XD<-data.frame(TownName[TownName$sample1990.TownName=="新店",])
mean(XD$sample1990.Age)
sexxd<-data.frame(table(XD$sample1990.Sex))
sexxd$Percent <- sexxd$Freq/sum(sexxd$Freq)*100
sexxd$Percent


#不用了
a<-sample1990[369:411,"Age"]
mean(a)
b<-sample1990[369:411,"Sex"]
sexxd<-data.frame(table(b))
sexxd$Percent <- sexxd$Freq/sum(sexxd$Freq)*100
sexxd$Percent




#上課的作業
#1
###不要的
mysp1990 <- data.frame(sample1990$Sex,sample1990$Age,sample1990$MaritalStatus,sample1990$edu,sample1990$status)

##
fds<-data.frame(table(sample1990$Sex))
names(fds) <- c("Sex","Freq")
fds$Sex <- c("Male","Female")
fds
barplot(table(sample1990$Sex),names=c("male","female"))

fda<-data.frame(table(sample1990$Age))
names(fda) <- c("Age","Freq")
fda
barplot(table(sample1990$Age))

fdm<-data.frame(table(sample1990$MaritalStatus))
names(fdm) <- c("MaritalStatus","Freq")
fdm$MaritalStatus <- c("未婚","有配偶同居","離婚分居","喪偶")
fdm
par(family="STKaiti")
barplot(table(sample1990$MaritalStatus),names=c("未婚","有配偶同居","離婚分居","喪偶"))

fde<-data.frame(table(sample1990$edu))
names(fde) <- c("edu","Freq")
fde$edu <- c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","研究所","不識字","自修")
fde
barplot(table(sample1990$edu),names=c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","研究所","不識字","自修"))

fdst<-data.frame(table(sample1990$status))
names(fdst) <- c("status","Freq")
fdst$status <- c("雇主","自營作業","私人僱用","政府僱用","無酬工作者")
fdst
barplot(table(sample1990$status),names=c("雇主","自營作業","私人僱用","政府僱用","無酬工作者"))




##
sex <-sample(sample1990$Sex,size =120,replace = TRUE )
sexf <-data.frame(table(sex))
sexf$sex<-c("male","female")
sexf
barplot(table(sex),names=c("male","female"))

age <-sample(sample1990$Age,size =120,replace = TRUE )
agef <-data.frame(table(age))
agef
barplot(table(age))

maritalstatus <-sample(sample1990$MaritalStatus,size =120,replace = TRUE )
msf <-data.frame(table(maritalstatus))
msf$maritalstatus<-c("未婚","有配偶同居","離婚分居","喪偶")
msf
barplot(table(maritalstatus),names=c("未婚","有配偶同居","離婚分居","喪偶"))

edu <-sample(sample1990$edu,size =120,replace = TRUE )
eduf <-data.frame(table(edu))
eduf$edu<-c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","不識字","自修")
eduf
barplot(table(edu),names=c("國小","托兒所","幼稚園","嬰兒其他","國中","高中","高職","專科","大學","不識字","自修"))

status <-sample(sample1990$status,size =120,replace = TRUE )
stf<-data.frame(table(status))
stf$status<-c("雇主","自營作業","私人僱用","政府僱用","無酬工作者")
stf
barplot(table(status),names=c("雇主","自營作業","私人僱用","政府僱用","無酬工作者"))



##
###性別機率分佈
a.samples <-sample(sample1990$Sex,size =10000000,replace = TRUE )
pds<-data.frame(table(a.samples))
pds$Percent <- pds$Freq/sum(pds$Freq)*100
ProbabilityDistributionSex <- pds
ProbabilityDistributionSex$a.samples<-c("male","female")
ProbabilityDistributionSex
pd<-table(a.samples)
barplot(pd,names=c("male","female"))

###年齡機率分佈
b.samples <-sample(sample1990$Age,size =10000000,replace = TRUE )
pda<-data.frame(table(b.samples))
pda$Percent <- pda$Freq/sum(pda$Freq)*100
ProbabilityDistributionAge <- pda
ProbabilityDistributionAge
pd1<-table(b.samples)
barplot(pd1)






#2

##
town <- rio::import(file="/Users/angelwang/Desktop/105年6月行政區五歲年齡組性別人口統計_鄉鎮市區 .xlsx")
str(town)
library(plyr)


男性年齡組 <- names(town)[grep(x=names(town), pattern="男性")]

Males <- town[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", 男性年齡組) ]
Males.Age <- reshape2::melt(data=Males, id.vars=c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY"),measure.vars=男性年齡組,variable.name="AgeGroup", value.name="人口數")

II <- seq(from=0, to=95, by=5)
Groups <- data.frame(AgeGroup=c(paste0(II, "-", II+4, "歲男性"), "100歲男性"),Age=c(II, 100))

Males.Age <- plyr::join(x=Males.Age, y=Groups, by="AgeGroup")

Males.Age <- Males.Age[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", "AgeGroup", "Age", "人口數") ]

Males.Age <- Males.Age[ order(Males.Age$TOWN_ID, Males.Age$Age), ]

Males.Age$Sex <- "男性"

stats.M <- plyr::ddply(.data=Males.Age, .variables=.(TOWN_ID, TOWN, COUNTY_ID, COUNTY), summarize, 男性總人口數=sum(人口數), 男性平均年齡=weighted.mean(x=Age+2.5, w=人口數))



女性年齡組 <- names(town)[grep(x=names(town), pattern="女性")]

Females <- town[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", 女性年齡組) ]
Females.Age <- reshape2::melt(data=Females, id.vars=c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY"),measure.vars=女性年齡組,variable.name="AgeGroup", value.name="人口數")

II <- seq(from=0, to=95, by=5)
Groups <- data.frame(AgeGroup=c(paste0(II, "-", II+4, "歲女性"), "100歲女性"),Age=c(II, 100))

Females.Age <- plyr::join(x=Females.Age, y=Groups, by="AgeGroup")

Females.Age <- Females.Age[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", "AgeGroup", "Age", "人口數") ]

Females.Age <- Females.Age[ order(Females.Age$TOWN_ID, Females.Age$Age), ]

Females.Age$Sex <- "女性"

stats.F <- plyr::ddply(.data=Females.Age, .variables=.(TOWN_ID, TOWN, COUNTY_ID, COUNTY), summarize, 女性總人口數=sum(人口數), 女性平均年齡=weighted.mean(x=Age+2.5, w=人口數))

#1.統計全國有多少人，男性女性分別有多少、一百歲以上有多少人(描述、平均年齡)
sum(c(stats.M$男性總人口數,stats.F$女性總人口數))
sum(stats.M$男性總人口數)
sum(stats.F$女性總人口數)
sum(c(Males$"100歲男性",Females$"100歲女性"))


#2.統計每個縣市有多少人、男性女性分別有多少
stats1<-data.frame(stats$COUNTY_ID,stats$COUNTY,stats$總人口數,stats$男性總人口數,stats$女性總人口數)
stats1 <- plyr::ddply(.data=stats1, .variables=.(stats.COUNTY_ID, stats.COUNTY), summarize, stats.總人口數=sum(stats.總人口數), stats.男性總人口數=sum(stats.男性總人口數),stats.女性總人口數=sum(stats.女性總人口數))
names(stats1)<-c("COUNTY_ID","COUNTY","總人口數","男性總人口數","女性總人口數")
stats1

#3.統計鄉鎮有多少人、男性女性分別有多少?
stats<-stats.M
stats$女性總人口數<-stats.F$女性總人口數
stats$總人口數<-cbind(stats$男性總人口數+stats$女性總人口數)
鄉鎮<-data.frame(stats$TOWN,stats$總人口數,stats$男性總人口數,stats$女性總人口數)
names(鄉鎮)<-c("TOWN","總人口數","男性總人口數","女性總人口數")
鄉鎮


#4.最多人口數是那些鄉鎮、最少人口數的是那些?
max(stats$總人口數)
stats[stats$總人口數==553430,]
min(stats$總人口數)
stats[stats$總人口數==658,]

#5.最老的鄉鎮、最年輕的鄉鎮?
stats$女性平均年齡<-stats.F$女性平均年齡
stats$總平均年齡<-cbind((stats$男性平均年齡+stats$女性平均年齡)/2)
max(stats$總平均年齡)
stats[stats$總平均年齡>=51,]
min(stats$總平均年齡)
stats[stats$總平均年齡<=34.2,]



#最後描述  說明為何性別、年齡有差距?












































#作業1：sex,age,matritalstatus,edu,status

#抽出120樣本

#製作sex.age的機率分佈比較和母體機率一不一樣
#1000萬次

#作業2
#在moodle最後一個
#統計6月全國有多少人，男女各多少，100歲以上
#計算每一縣市佔多少人，男女個多少
#計算全國每一個鄉鎮有多少人，男女個多少，最多人最少人，男最多最少
#？？最年輕最老












