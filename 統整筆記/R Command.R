###################################基本操作#########################################

source("路徑") #載入外部程式
demo(套件) #展示套件的示範功能
example(函數) #執行範例程式
library(套件) #載入套件
require(套件) #在自訂函數中使用以載入套件
detach(package:套件) #卸載以載入的套件
install.packages('套件') #安裝套件
data(資料檔) #載入資料檔
head(資料檔,n);tail(資料檔,n) #查看前(後)n 列資料
attach(資料檔) #使用後可直接使用變數名稱操作
getwd() #查詢目前工作目錄
setwd("路徑") #改變工作目錄


#基本運算
%/% #整除
%%  #餘數計算
&   #可用於向量的 and
|   #可用於向量的 or
  
seq(,,by)   #產生以 by 為遞增值的數列
x <- seq(from=0,to=10,by=2)
x

length()   #計算元素個數
sum()      #元素相加
cumsum()   #累積相加
prod()     #元素相乘
cumprod()  #累積相乘




###################################變數與資料#######################################

#向量變數
names() #查詢或建立向量的元素名稱

#因子變數
factor(x,levels=c()) #依照 levels 排列建立 factor 變數
gender <- c(1,2,2,1,1,1,2,1)
gender <- factor(gender,levels=c(1,2),labels=c("男性","女性"))
gender

levels()              #查詢或設定分類資料
ordered(x,levels=c()) #依照 levels 由小到大順序建立有序 factor 變數

#串列變數
list(name1=value1,…)  #建立 list 變數
unlist()              #將 list 變數轉成 table 變數
attributes()          #查看個元素的名稱

#資料框架變數
data.frame()   #建立資料框架變數

#與變數有關的工具函數
class(物件) ; str()  #查詢物件的類別;結構

#資料輸入與輸出
write()                            #資料輸出(輸出矩陣前先轉置)
read.table(header,na.strings,skip) #輸入多變數資料檔
write.table()                      #輸出多變數資料檔
save()                             #將部分物件儲存為 Rdata 格式

#存取其他軟體的資料檔
gdata::read.xls         #載入 xls 檔
xlsx::read.xlsx         #載入 xlsx 檔
xlsReadWrite::write.xls #輸出 xls 檔
xlsx::write.xlsx        #輸出 xlsx 檔

#資料傳換
%in%        #判斷是否在某個集合內
cut(,break) #根據 break 的切割點將資料轉換為 factor 變數

#資料排序
sort(,decreasing=F) #將向量元素依照大小順序排列
rank()              #傳回向量元素的排序等級
order(,dec=F)       #傳回排序後元素在原向量的指標
rev()               #將整個向量倒過來排

#資料切割
split(x,f)  #將 x 元素各對應的分類變數 f 分割資料

#資料合併
union() #聯集兩個變數
rbind() #逐列合併
cbind() #逐行合併
merge() #合併擁有一列以上相同的兩資料框架

#資料轉換
as.                   #改變變數或元素的型態
stack()、unstack()    #將 data.frame 各直行推疊在一起(unstack 作還原動作)
edit()                #以試算表介面編輯變數，僅供下次使用
fix()                 #以試算表介面編輯變數，改變後固定
View()                #以試算表介面查看變數
view(x,n,last,random) #查看變數的 n 個元素
expand.grid()         #將各變數交叉相乘排列
format()              #將資料轉成相同格式






##############################常用函數與程式技巧####################################

#數學函數
exp();log(x,base)  #指數;對數函數
abs()              #絕對值函數
sqrt()             #開根號函數
sign()             #判斷正負號
ceiling(x)         #大於等於 x 的最小整數
floor(x)           #小於等於 x 的最大整數
round(x,n)         #將 x 四捨五入到第 n 位
trunc(x)           #傳回 x 的整數部分
signif(x,k)        #顯示 x 的 k 為有效位數
max();min()        #傳回元素最大值;最小值
pmax(x,y,…);pmin() #傳回指定向量各分量的最大值;最小值


#table 系列函數
table(x1,x2,…,xk,dnn)  #x 為 factor、list、data frame，彙整分類組合發生次數
margin.table(X,margin) #對 table X 逐列、逐行(MA=1、2)加總
colSums();rowSums()    #計算逐行(逐列)總和
colMeans();rowMeans()  #計算逐行(逐列)平均
prop.table(X,margin)   #計算逐列、逐行(MA=1、2)邊際比例
                       #不設定 MA 則計算佔所有格子的比例
as.data.frame(X,responseName) #將 table X 各分類數值以 frame 顯示，res 設定數值名稱
xtabs(計數~分類 1+…,data=X,subset) #指定 X 內分類來彙整指定計數，用 subset 邏輯篩選


#遺失值函數
na.fail(x)              #偵測 x 是否有遺失值，若有則出現錯誤訊息並停止
na.omit();na.exclude()  #去除 NA 值
is.na()                 #判斷個元素是否為 NA
na.rm=T                 #在部分函數內使用，計算時可刪除遺失值


#文字與字串處理
print.data.frame(X,digits=k,quote=F,right=T)#印出 data frame 變數內容，至少印出 k                                                位數
quote                           #設定是否加雙引號，right 設定是否靠右
paste(…,sep,collapse)           #將各字串變數組合，可將所有元素用 collapse 連結一起
rep(x,time,length.out,each)     #重複 x，time=x 重複次數,each=x 內元素重複次數
substr(x,start,stop)            #在 x 中取出從 start 到 end 的子字串
strtrim(x,width)                #以 width 決定取出 x 的寬度
strsplit(x,split)               #依 split 字元將 x 分開
sub("舊字串","新字串",x);gsub() #將 x 中所有找到的舊字串，用新字串代替
grep(pattern,x,ignore.case=T) #輸出 x 內指定字串指標,ignore.case 設定是否忽略大小寫


#常見的 R 程式技巧
assign("變數名稱",運算式) #自動建立變數，並將運算式值存入


#自訂函數
名稱=function(參數,...){}
#參數可以有預設值、也可以是其他已定義之函數
#內部變數不影響外部(除非使用<<-)
#可用...代表其他需要傳入的參數
#函數可以呼叫函數本身成為遞迴
invisible() #用在函數回傳值則函數不顯示計算結果
stop(op)    #停止函數計算;並輸出 Error: op
warning(op) #執行函數計算;最後輸出 Warning message: op
args()      #顯示函數的參數與預設值
formals()   #顯示函數個參數特質
body()      #顯示函數的內容
"%anything%"=function(a,b){} #自訂二元運算子


#流程控制
ifelse(,T,F)                       #用於二分類邏輯判斷、成立執行 T、否則執行 F
if(){ + }else if(){ + }else{}      #用於多分類的邏輯判斷
switch(計算值,運算式 1, 運算式 2…) #依照計算值(整數或文字)決定要執行的運算式
for(k in seq){}                    #以 k 在範圍 seq 中逐步執行運算式
while(){}                          #依照(…)的判斷來執行運算式
repeat{}                           #重複執行運算式直到跳出(break)
break                              #終止並跳離迴圈
next                               #跳過其後的運算，直接執行下一次迴圈






###################################繪圖功能#########################################

#par 圖形設定函數
mai=c(a,b,c,d)    #設定邊界值(inch)，順序為底左頂右
                  #mar 與 mai 同，單位為文字行數
mfcol=c(a,b)      #以 a×ｂ矩陣將多張圖形畫在同一頁，依行排序
mfrow=c(a,b)      #以 a×ｂ矩陣將多張圖形畫在同一頁，依列排序
layout(M)         #設定比較不對稱的多圖佈局，依照Ｍ矩陣設計位置
fig=(x1,x2,y1,y2) #依照座標將圖擺在設定位置上


#圖形基本設定參數
col=k or "顏色名稱"  #設定顏色(0 白,1 紅,2 黑,3 綠,4 藍,5 天藍,6 紫,7 黃,8 灰)
colors()             #可查詢顏色名稱
col.axis、col.lab、col.main、col.sub #改其他部分顏色
lty=k                #設定線的種類(1 為實線、其他會各種虛線)
pch=k or "文字符號"  #設定點的種類
font=k               #1 為一般字體 2 為粗體字 3 斜體 4 粗斜體
font.axis…           #改其他部分的字體
lwd=k                #設定 k 倍的線寬
cex=k                #設定 k 倍的字型大小
cex.axis…            #改其他部分的字體


#高階繪圖函數
plot(x,y);plot(xy)  #畫出 x,y 的散佈圖;畫出 xy(兩行的向量)的散佈圖
curve()             #畫出給定的函數曲線
qqnorm();qqline()   #畫出常態機率圖(Normal Probability Plot); 畫最佳斜線
qqplot(x,y)         #畫出 x、y 兩組資料間的 QQ 圖
hist(x)             #畫出直方圖(以 breaks 設定分隔點、nclass 設定群數)
epicalc::dotplot()  #畫出點狀圖
barplot()           #畫出長條圖
boxplot()           #畫出合鬚圖
pie(x,label)        #以 label 為分類畫出 x 數值的圓餅圖
matplot(x,y)        #以 x 為橫軸，針對 y 的每一行畫圖


#高階繪圖函數共用的輔助參數
add=T                     #覆蓋在前一張圖形上
axes=F                    #不畫出座標軸
type=""
#p 圓點、l 線、b 實心圓點和線、o 空心圓點和線、s(S)階梯線、各點值在頂(底)端、h 垂直線、n 不畫圖
xlab="" ; ylab=""         #設定軸的輔助說明文字
xlim=c(a,b) ; ylim=c(a,b) #將軸的範圍控制在(a,b)
main="文字" ; sub="文字"  #加上主標題、次標題


#附加圖形：低階繪圖函數
points(x,y)               #加上圖點
lines(x,y)                #加上直線
segments(x0,y0,x1,y1)     #以設定座標加上線段
text(x,y,labels)          #在指定位置寫出指定文字
abline(a,b)               #加上直線(y=ax+b)
abline(h=y);abline(v=x)   #加上水平線或垂直線
polygon()                 #在指定位置畫出封閉多邊形、畫出陰影區域
legend(x,y,legend)        #在指定位置畫出文字方塊
title(main,sub)           #加上主標題或副標題
axis(side,at,tick,labels) #加上額外的座標軸
locator(n,type="n")       #圖點座標位置查詢，最多點取 n 次








###################################機率統計#########################################

#機率分配
dnorm(x,mean,sd,log=F)         #計算常態分配在 x 的機率密度函數值
pnorm(x,lower.tail=F,log.p=F)  #常態分配累積到 x 機率值(lower=F 則機率從右尾算起)
qnorm(p, lower.tail=F,log.p=F) #計算常態分配機率為 p 時的分為點
rnorm(n,mean,sd)               #模擬常態分配 n 個隨機亂數
dbinom(size,prob)              #Binomial
dchisq(df,ncp)                 #Chi-Square
dt(df,ncp)                     #T
dunif(min,max)                 #Uniform


#機率計算
set.seed() #設定隨機種子
sample(x,size,re,pr) #從 x 中依照 pr 機率取出 size 個樣本(re=F 不放回)
density(x);plot(density(x)) #依資料計算密度函數;畫出 pdf 圖形
print();summary() #彙整計算結果


#敘述統計
mean(x,trim)    #算術平均,trim 決定去除資料比率
median(x)       #中位數
var(x);sd(x)    #變異數、標準差
range(x)        #最大最小值
mode()          #眾數
quantile(x,pr)  #計算第 pr*100 百分率下的值
IQR()           #內四分位距
fivenum()       #列出 min,Q1,median,Q3,max
cor(x,y)        #計算 x、y 的相關係數







####################################################################################
letters                  #小寫字母所組成之向量
toupper(x)               #將英文小寫字母轉成大寫
date()                   #查詢現在日期時間
menu()                   #執行選擇程序
library(Rcmdr)           #叫出 R Commander 介面
all(logical vector)      #向量存在一個以上的 F 則回傳 F，否則回傳 T
rainbow();heat.colors()  #顏色抓取



