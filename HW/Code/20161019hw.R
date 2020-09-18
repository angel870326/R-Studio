#畫出“我愛社會統計”的英文字樣（首字大寫，其餘小寫）
Slogan <- paste0(LETTERS[9]," ",letters[12],letters[15],letters[22],letters[5]," ",letters[19],letters[15],letters[3],letters[9],letters[1],letters[12]," ",letters[19],letters[20],letters[1],letters[20],letters[9],letters[19],letters[20],letters[9],letters[3],letters[19])
Slogan


#將GSS2012.sav檔案讀進R，增加一個變項ID（數值從1開始），然後匯出成excel檔，在讀進該EXCEL檔
install.packages("rio")
library(rio)
GSS <- import("/Users/angelwang/Desktop/GSS2012.sav")
GSS$ID <- 1:1457
export(GSS,"GSS.xlsx")
GSS <- import("GSS.xlsx")




install.packages("XLConnect")
library(XLConnect)
install.packages("XLConnectJars")
library(XLConnectJars)
writeWorksheetToFile(data=GSS,file="GSS.xlsx",sheet="new")
GSSEXCEL <- XLConnect::readWorksheetFromFile("/Users/angelwang/Desktop/GSS.xlsx",sheet=1,header=T)






ID <- 1:1457
cbind(GSS,ID)
data.frame(cbind(GSS,ID))
export(data.frame(cbind(GSS,ID)),"GSS.xlsx")
GSS.xlsx <- import("GSS.xlsx")
install.packages("XLConnect")
library(XLConnect)
writeWorksheetToFile(data=GSS.xlsx,file="/Users/angelwang/Desktop/GSS.xlsx",sheet="new")
GSSEXCEL <- XLCoonect::readWorksheetFromFile("/Users/angelwang/Desktop/GSS.xlsx",sheet=1,header=T)

#本來用這樣
library(rio)
GSS <- import("/Users/angelwang/Desktop/GSS2012.sav")
ID <- 1:1457
export(data.frame(cbind(GSS,ID)),"GSS.xlsx")
GSS.xlsx <- import("GSS.xlsx")
                      












#畫出數個同心圓，成為靶圖
library(plotrix)
plot(x=c(-6,6),y=c(-6,6),type = "n")
draw.circle(x=0,y=0,radius=4,nv=100,border="black",col="blueviolet")
draw.circle(x=0,y=0,radius=3,nv=100,border="black",col="cyan")
draw.circle(x=0,y=0,radius=2,nv=100,border="black",col="yellow")
draw.circle(x=0,y=0,radius=1,nv=100,border="black",col="red")

