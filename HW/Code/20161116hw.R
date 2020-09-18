# 1. 建立卡方分佈表。繪製卡方分佈表圖形，自選數個自由度作圖。

c.99<-round(qchisq(0.99, df=c(1:30),lower.tail = F),6)
c.98<-round(qchisq(0.98, df=c(1:30),lower.tail = F),6)
c.95<-round(qchisq(0.95, df=c(1:30),lower.tail = F),5)
c.90<-round(qchisq(0.90, df=c(1:30),lower.tail = F),4)
c.80<-round(qchisq(0.80, df=c(1:30),lower.tail = F),4)
c.70<-round(qchisq(0.70,df=c(1:30),lower.tail = F),3)
c.50<-round(qchisq(0.50,df=c(1:30),lower.tail = F),3)
c.30<-round(qchisq(0.30,df=c(1:30),lower.tail = F),3)
c.20<-round(qchisq(0.20,df=c(1:30),lower.tail = F),3)
c.10<-round(qchisq(0.10,df=c(1:30),lower.tail = F),3)
c.05<-round(qchisq(0.05,df=c(1:30),lower.tail = F),3)
c.02<-round(qchisq(0.02,df=c(1:30),lower.tail = F),3)
c.01<-round(qchisq(0.01,df=c(1:30),lower.tail = F),3)
c.001<-round(qchisq(0.001,df=c(1:30),lower.tail = F),3)
chi_square<-data.frame(c.99,c.98,c.95,c.90,c.80,c.70,c.50,c.30,c.20,c.10,c.05,c.02,c.01,c.001)
names(chi_square)<-c("0.99","0.98","0.95","0.90","0.80","0.70","0.50","0.30","0.20","0.10","0.05","0.02","0.01","0.001")
chi_square



cc <- seq(0,80,by=0.001)
plot(cc,dchisq(cc,df=10),type = "l",col="orange")
lines(cc,dchisq(cc,df=1),type = "l",col="red")
lines(cc,dchisq(cc,df=20),type = "l",col="green")
lines(cc,dchisq(cc,df=30),type = "l",col="blue")
legend(60,0.08,c("df=1","df=10","df=20","df=30"),lty = c(1,1,1,1),lwd=c(2.5,2.5,2.5,2.5),col=c("red","orange","green","blue"))






# 2. sample1990$Age抽120人共100000次，求error（樣本平均-母體平均）的分佈圖，並求error的平均、變異數、標準差
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





# 3. sample1990$Age，分別用alpha=0.01（N=120）、alpha=0.05（N=120、600），各抽100000次，計算母體平均落在信賴區間的次數及落在區間外的次數

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









































#可悲的嘗試


length=100000
ConfidenceInterval<-function(alpha,length,N){xbar<-rbindlist(lapply(X=1:length, function(x){Age<-sample(x=sample1990$Age,size=N,replace = T)}data.table(xbarr=mean(Age),Sd=sd(Age))))xbar<-xbar[,":="(low=xbarr-qnorm(1-alpha/2)*Sd,high=xbarr+qnorm(1-alpha/2)*Sd,order=.I)]miss<-subset(x=xbars,low>mu|high<mu)plot(xbar$xbarr,xbar$order,pch=16,xlim = c(20,40),xlab = "Mean Age",ylab = "Samples",main=paste("alpha=",alpha,",N=",N,sep = ""))graphics::segments(x0=xbar$low,y0=xbar$order,x1=xbar$high,y1=xbar$order,col="orange")graphics::segments(x0=miss$low,y0=miss$order,x1=miss$high,y1=miss$order,col="blue")abline(v=mu,lty=2,lwd=2,col="red")points(x=xbar$low,y=xbar$order,pch=0,cex=0.5)points(x=xbar$high,y=xbar$order,pch=0,cex=0.5)}


#http://www.r-graph-gallery.com/84-tukey-test/























#100000
n=length(xbars)
# sample standard deviation
sd = sd(xbars)
# standard error estimate
SE = sd/sqrt(n)

#Since there are two tails of the Student t distribution, the 95% confidence level would imply the 97.5th percentile of the Student t distribution at the upper tail. Therefore, tα∕2 is given by qt(.975, df=n-1). We multiply it with the standard error estimate SE and get the margin of error.

# margin of error 
E = qt(0.975, df=0.01)*SE  

E = qt(.975, df=n-1)*SE  
??qt

#We then add it up with the sample mean, and find the confidence interval.
# sample mean 
confidenceinterval<-mean(xbars) + c(-E, E) 
plot(confidenceinterval)





confint(xbars, vector(length = 100000), level = 0.95)



data.table(Mean=mean(a.sample),Sd=sd(a.sample))


left <- mean(w1$vals)-error
right <- mean(w1$vals)+error





alpha=0.01
qnorm(1-alpha/2)




