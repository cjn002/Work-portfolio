#1
a<-read.table("C:/Users/emma5/Desktop/1102 FDA/mid/A.csv",sep=",", na.strings = "miss", header = T)
a$Date<-as.Date(a$Date)
a1<-read.table("C:/Users/emma5/Desktop/1102 FDA/mid/A1.csv",sep=",", na.strings = "miss", header = T)
a1$Date<-as.Date(a1$Date)
b<-read.table("C:/Users/emma5/Desktop/1102 FDA/mid/B.csv",sep=",", na.strings = "miss", header = T)
b$Date<-as.Date(b$Date)
b1<-read.table("C:/Users/emma5/Desktop/1102 FDA/mid/B1.csv",sep=",", na.strings = "miss", header = T)
b1$Date<-as.Date(b1$Date)
c<-read.table("C:/Users/emma5/Desktop/1102 FDA/mid/C.csv",sep=",", na.strings = "miss", header = T)
c$Date<-as.Date(c$Date)
summary(a)
summary(a1)
summary(b)
summary(b1)
summary(c)
#2
a<-a[a$Date>="2004-01-01"&a$Date<="2021-12-31",]
summary(a)
a1<-a1[a1$Date>="2004-01-01"&a1$Date<="2021-12-31",]
summary(a1)
b<-b[b$Date>="2004-01-01"&b$Date<="2021-12-31",]
summary(b)
b1<-b1[b1$Date>="2004-01-01"&b1$Date<="2021-12-31",]
summary(b1)
c<-c[c$Date>="2004-01-01"&c$Date<="2021-12-31",]
summary(c)
#3
library(xts)
a<-xts(a[, 2:7], order.by = a$Date)
a<-to.monthly(a)
a1<-xts(a1[, 2:7], order.by = a1$Date)
a1<-to.monthly(a1)
b<-xts(b[, 2:7], order.by = b$Date)
b<-to.monthly(b)
b1<-xts(b1[, 2:7], order.by = b1$Date)
b1<-to.monthly(b1)
c<-xts(c[, 2:7], order.by = c$Date)
c<-to.monthly(c)
#4
a.Close<-as.numeric(a$a.Close)
a_np<-a.Close/a.Close[1]
a1.Close<-as.numeric(a1$a1.Close)
a1_np<-a1.Close/a1.Close[1]
b.Close<-as.numeric(b$b.Close)
b_np<-b.Close/b.Close[1]
b1.Close<-as.numeric(b1$b1.Close)
b1_np<-b1.Close/b1.Close[1]
c.Close<-as.numeric(c$c.Close)
c_np<-c.Close/c.Close[1]
#5
df<-data.frame(cbind(index(a),a_np,a1_np,b_np,b1_np,c_np))
names(df)<-c("Date",'a_np','a1_np','b_np','b1_np','c_np')
summary(df[-1])
#6
windows()
par(mfrow=c(1,3))
y.range<-range(df[,2:6])
plot(x = df$Date, y = df$a_np, 
     type = "l",
     xlab = "Date", ylab = "Normalized Price", 
     col = "black", lty = 1, lwd = 2, 
     main = "A, A1 and C",
     ylim = y.range,xaxt='n')
axis(side = 1,df$Date,labels = df$Date)
lines(x = df$Date, y = df$a1_np,
      col = "gray", lty = 4, lwd = 2)
lines(x = df$Date, y = df$c_np,
      col = "gray", lty = 3, lwd = 2)
legend("topleft", c("A","A1","C"),
       lty = c(1,4,3), lwd = c(2,2,2), col = c("black","gray","gray"))
plot(x = df$Date, y = df$a1_np, 
     type = "l",
     xlab = "Date", ylab = "Normalized Price", 
     col = "black", lty = 1, lwd = 2, 
     main = "A1, A and C",
     ylim = y.range,xaxt='n')
axis(side = 1,df$Date,labels = df$Date)
lines(x = df$Date, y = df$a_np,
      col = "gray", lty = 4, lwd = 2)
lines(x = df$Date, y = df$c_np,
      col = "gray", lty = 3, lwd = 2)
legend("topleft", c("A1","A","C"),
       lty = c(1,4,3), lwd = c(2,2,2), col = c("black","gray","gray"))
plot(x = df$Date, y = df$c_np, 
     type = "l",
     xlab = "Date", ylab = "Normalized Price", 
     col = "black", lty = 1, lwd = 2, 
     main = "C, A and A1",
     ylim = y.range,xaxt='n')
axis(side = 1,df$Date,labels = df$Date)
lines(x = df$Date, y = df$a_np,
      col = "gray", lty = 4, lwd = 2)
lines(x = df$Date, y = df$a1_np,
      col = "gray", lty = 3, lwd = 2)
legend("topleft", c("C","A","A1"),
       lty = c(1,4,3), lwd = c(2,2,2), col = c("black","gray","gray"))
#7
windows()
par(mfcol=c(2,1))
y<-range(df[,4:5])
plot(x = df$Date, y = df$b_np, 
     type = "l",
     xlab = "Date", ylab = "Normalized Price", 
     col = "black", lty = 1, lwd = 2, 
     main = "B and B1",
     ylim = y,xaxt='n')
axis(side = 1,df$Date,labels = df$Date)
lines(x = df$Date, y = df$b1_np,
      col = "gray", lty = 4, lwd = 1)
legend("topleft", c("B","B1"),
       lty = c(1,4), lwd = c(2,2), col = c("black","gray"))
plot(x = df$Date, y = df$b1_np, 
     type = "l",
     xlab = "Date", ylab = "Normalized Price", 
     col = "black", lty = 1, lwd = 2, 
     main = "B1 and B",
     ylim = y,xaxt='n')
axis(side = 1,df$Date,labels = df$Date)
lines(x = df$Date, y = df$b_np,
      col = "gray", lty = 4, lwd = 1)
legend("topleft", c("B1","B"),
       lty = c(1,4), lwd = c(2,2), col = c("black","gray"))
