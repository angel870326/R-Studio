library(rio)
GSS <- import("/Users/angelwang/Desktop/GSS2012.sav")
names(GSS)

GSS$attend
median(GSS$attend,TRUE)
summary(GSS$attend)

GSS$closeblk
median(GSS$closeblk,TRUE)

GSS$educ
mean(GSS$educ,na.rm=TRUE)

GSS$fefam
median(GSS$fefam,TRUE)

GSS$getahead
mode(GSS$getahead)

GSS$gunlaw
median(GSS$gunlaw,TRUE)

GSS$hrs1
mean(GSS$hrs1,na.rm=TRUE)

GSS$letdie1
median(GSS$letdie1,TRUE)

GSS$marhomo
median(GSS$marhomo,TRUE)

GSS$premarsx
median(GSS$premarsx,TRUE)

x<-c(33,28,11,44,13,32,23,37,14,40,26,27,20,24,26,23,23,19,23,30,27,41)
summary(x)
y<-c(33,28,11,13,32,23,37,14,40,26,27,20,24,26,23,23,19,23,30,27,41)
summary(y)
