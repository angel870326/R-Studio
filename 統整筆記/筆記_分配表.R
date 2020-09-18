######################################  Z 分 佈  ###################################
                                                                          #20161026
## 表
Z <- seq(from=0.00,to=4.00,by=0.01)
pnorm(Z)

b <- round(pnorm(Z)-0.5,4)
c <- round(1-pnorm(Z),4)
x <- data.frame(Z,b,c)
names(x) <- c("Z","Area Between Mean and Z","Area Beyond Z")
x

#更像課本
z1 <- seq(from=0.00,to=3.50,by=0.01)
z2 <- seq(from=3.60,to=4.00,by=0.10)
Z <- union(z1,z2)
b <- round(pnorm(Z)-0.5,4)
c <- round(1-pnorm(Z),4)
x <- data.frame(Z,b,c)
names(x) <- c("Z","Area Between Mean and Z","Area Beyond Z")
x



## 圖

Z1<-seq(from=-4.00,to=4.00,by=0.01)
y1<-dnorm(Z1,mean=0,sd=1)
P<-plot(x=Z1,y=y1,type = "l",col="black",lwd=1.5)

a = seq(-1.5,1.5,len=50)
polygon(c(a,rev(a)),c(dnorm(a),rep(-0.1,50)),col = 'grey')
a0 <- c(0,0)
b0 <- c(dnorm(0),-0.1)
lines(a0,b0)  
text(-0.8,0.1,"(b)")
text(0.8,0.1,"(b)")

P<-plot(x=Z1,y=y1,type = "l",col="black",lwd=1.5)
a1 = seq(-4,-1.5,len=50)
polygon(c(a1,rev(a1)),c(dnorm(a1),rep(-0.1,50)),col = 'grey')
a2 = seq(4,1.5,len=50)
polygon(c(a2,rev(a2)),c(dnorm(a2),rep(-0.1,50)),col = 'grey')
lines(a0,b0)  
text(-1.8,0.02,"(c)")
text(1.8,0.02,"(c)")




#法2(比較多此一舉)
a1 <- c(-1.5,-1.5)
b1 <- c(dnorm(-1.5),-0.1)
lines(a1,b1)
a2 <- c(0,0)
b2 <- c(dnorm(0),-0.1)
lines(a2,b2)  
a3 <- c(1.5,1.5)
b3 <- c(dnorm(1.5),-0.1)
lines(a3,b3)  
a = seq(-1.5,1.5,len=50)
polygon(c(a,rev(a)),c(dnorm(a),rep(-0.1,50)),col = 'grey')
text(-0.8,0.1,"(b)")
text(0.8,0.1,"(b)")





#### 曲 線 下 部 分 塗 色
curve(dnorm(x), xlim = c(-1,1),n = 100)
a = seq(-0.5,0.5,len = 50)
polygon(c(a,rev(a)),c(dnorm(a),rep(0,50)),col = 'grey')
abline(v=c(-1.5,0,1.5))






######################################### t 分 佈 ##################################
                                                                          #20161109

# t 表
t.10<-abs(round(qt(0.10, df = c(1:30,40,60,120,Inf)),3))
t.05<-abs(round(qt(0.05, df = c(1:30,40,60,120,Inf)),3))
t.025<-abs(round(qt(0.025, df = c(1:30,40,60,120,Inf)),3))
t.01<-abs(round(qt(0.01, df = c(1:30,40,60,120,Inf)),3))
t.005<-abs(round(qt(0.005, df = c(1:30,40,60,120,Inf)),3))
t.0005<-abs(round(qt(0.0005, df = c(1:30,40,60,120,Inf)),3))
df<-c(1:30,40,60,120,Inf)
t<-cbind.data.frame(df,t.10,t.05,t.025,t.01,t.005,t.0005)
names(t)<-c("df","0.10","0.05","0.025","0.01","0.005","0.0005")
t

# t 圖
tt <- seq(-4,4,by=0.0001)
df10 <- dt(tt,df=10)
plot(tt,df10,type = "l",col="brown")
df4 <- dt(tt,df=4)
lines(tt,df4,type = "l",col="blue3")
df1 <- dt(tt,df=1)
lines(tt,df1,type = "l",col="black")

legend(2,0.3,c("df1","df4","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue3","brown"))




#利用t(df=1和10)和z比較tail差異（放大圖）

# t z 比 較 圖
Z<-seq(from=-4.00,to=4.00,by=0.01)
y<-dnorm(Z,mean=0,sd=1)
plot(x=Z,y=y,type = "l",col="black",lwd=1.5)

xx <- seq(-4,4,by=0.0001)
df1 <- dt(xx,df=1)
lines(xx,df1,type = "l",col="blue")
df10 <- dt(xx,df=10)
lines(xx,df10,type = "l",col="green")

legend(2,0.2,c("z","df1","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","green"))

#放大
vZ<-seq(from=1.8,to=4.00,by=0.01)
vy<-dnorm(vZ,mean=0,sd=1)
plot(x=vZ,y=vy,type = "l",col="black",lwd=1.5)

vxx <- seq(1.8,4,by=0.0001)
vdf1 <- dt(vxx,df=1)
lines(vxx,vdf1,type = "l",col="blue")
vdf10 <- dt(vxx,df=10)
lines(vxx,vdf10,type = "l",col="green")

legend(3,0.06,c("z","df1","df10"),lty = c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","green"))









##################################### 卡 方 分 佈 #################################
                                                                          #20161116
#表
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


#圖
cc <- seq(0,80,by=0.001)
plot(cc,dchisq(cc,df=10),type = "l",col="orange")
lines(cc,dchisq(cc,df=1),type = "l",col="red")
lines(cc,dchisq(cc,df=20),type = "l",col="green")
lines(cc,dchisq(cc,df=30),type = "l",col="blue")
legend(60,0.08,c("df=1","df=10","df=20","df=30"),lty = c(1,1,1,1),lwd=c(2.5,2.5,2.5,2.5),col=c("red","orange","green","blue"))










