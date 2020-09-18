
library(rio)
States <- import("/Users/angelwang/Desktop/!!政治大學/社會統計/資料檔/States.sav")
names(States)


#4.18
States$TrafDths90
States$TrafDths09

quantile(States$TrafDths90)
2.500-1.825
quantile(States$TrafDths09)
1.400-0.925

boxplot(States$TrafDths90)
boxplot(States$TrafDths09)
mode(States$TrafDths90)
mode(States$TrafDths09)
median(States$TrafDths90)
median(States$TrafDths09)
mean(States$TrafDths90)
mean(States$TrafDths09)

sd(States$TrafDths90)
sd(States$TrafDths09)

#4.19
States$FamPoor00
States$FamPoor09
boxplot(States$FamPoor00)
boxplot(States$FamPoor09)

median(States$FamPoor00)
median(States$FamPoor09)
mean(States$FamPoor00)
mean(States$FamPoor09)
range(States$FamPoor00)
range(States$FamPoor09)
quantile(States$FamPoor00)
quantile(States$FamPoor09)
sd(States$FamPoor00)
sd(States$FamPoor09)


