                                                                           #20161102

#讀資料
town <- rio::import(file="/Users/angelwang/Desktop/!!政治大學/社會統計/資料檔/105年6月行政區五歲年齡組性別人口統計_鄉鎮市區 .xlsx")
str(town)
library(plyr)


#男

#把男性的都抽出來
男性年齡組 <- names(town)[grep(x=names(town), pattern="男性")]

#把男性的都抽出來弄成表
Males <- town[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", 男性年齡組) ]
#更美觀
Males.Age <- reshape2::melt(data=Males, id.vars=c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY"),measure.vars=男性年齡組,variable.name="AgeGroup", value.name="人口數")

II <- seq(from=0, to=95, by=5)
Groups <- data.frame(AgeGroup=c(paste0(II, "-", II+4, "歲男性"), "100歲男性"),Age=c(II, 100))

Males.Age <- plyr::join(x=Males.Age, y=Groups, by="AgeGroup")

Males.Age <- Males.Age[ c("TOWN_ID", "TOWN", "COUNTY_ID", "COUNTY", "AgeGroup", "Age", "人口數") ]

#把 同 鄉 的各年齡男性都排在一起
Males.Age <- Males.Age[ order(Males.Age$TOWN_ID, Males.Age$Age), ]

Males.Age$Sex <- "男性"

#各鄉男性總人數和年齡平均
stats.M <- plyr::ddply(.data=Males.Age, .variables=.(TOWN_ID, TOWN, COUNTY_ID, COUNTY), summarize, 男性總人口數=sum(人口數), 男性平均年齡=weighted.mean(x=Age+2.5, w=人口數))




#女
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

sum(c(stats.M$男性平均年齡/368,stats.F$女性平均年齡/368))/2
sum(stats.M$男性平均年齡)/368
sum(stats.F$女性平均年齡)/368



#3.統計鄉鎮有多少人、男性女性分別有多少?
stats<-stats.M
stats$女性總人口數<-stats.F$女性總人口數
stats$總人口數<-cbind(stats$男性總人口數+stats$女性總人口數)
鄉鎮<-data.frame(stats$TOWN,stats$總人口數,stats$男性總人口數,stats$女性總人口數)
names(鄉鎮)<-c("TOWN","總人口數","男性總人口數","女性總人口數")
鄉鎮




#2.統計每個縣市有多少人、男性女性分別有多少
stats1<-data.frame(stats$COUNTY_ID,stats$COUNTY,stats$總人口數,stats$男性總人口數,stats$女性總人口數)
stats1 <- plyr::ddply(.data=stats1, .variables=.(stats.COUNTY_ID, stats.COUNTY), summarize, stats.總人口數=sum(stats.總人口數), stats.男性總人口數=sum(stats.男性總人口數),stats.女性總人口數=sum(stats.女性總人口數))
names(stats1)<-c("COUNTY_ID","COUNTY","總人口數","男性總人口數","女性總人口數")
stats1




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




