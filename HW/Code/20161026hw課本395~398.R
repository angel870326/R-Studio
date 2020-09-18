#作業
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






#圖

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








#曲線下部分塗色
curve(dnorm(x), xlim = c(-1,1),n = 100)
a = seq(-0.5,0.5,len = 50)
polygon(c(a,rev(a)),c(dnorm(a),rep(0,50)),col = 'grey')
#

 
  
abline(v=c(-1.5,0,1.5))





P<-plot(x=Z1,y=y1,type = "l",col="black",lwd=1.5)
abline(v=c(-1.5,0,1.5))


abline(v=c(-1.5,0,1.5))


polygon(P, col = "blue")
coplot(abline(v=c(-1.5,0,1.5)))

??coplot


plot(x=Z1,y=y1,type = "l",col="black",lwd=1.5,panel.last=abline(v=c(-1.5,0,1.5)))


#試
"Area Between Mean and Z" <- round(pnorm(Z)-0.5,4)
"Area Beyond Z" <- round(1-pnorm(Z),4)
data.frame(Z,"Area Between Mean and Z","Area Beyond Z")

cbind.data.frame(Z,"Area Between Mean and Z","Area Beyond Z")
cbind.data.frame(Z,b,c)
