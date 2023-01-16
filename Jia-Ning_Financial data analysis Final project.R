data_0050<-read.table("C:/Users/emma5/Desktop/1102 FDA/0050.TW.csv",header = T, sep=",",na.strings = 'null')
data_0052<-read.table("C:/Users/emma5/Desktop/1102 FDA/0052.TW.csv",header = T, sep=",",na.strings = 'null')
data_0053<-read.table("C:/Users/emma5/Desktop/1102 FDA/0053.TW.csv",header = T, sep=",",na.strings = 'null')
data_0055<-read.table("C:/Users/emma5/Desktop/1102 FDA/0055.TW.csv",header = T, sep=",",na.strings = 'null')
data_0056<-read.table("C:/Users/emma5/Desktop/1102 FDA/0056.TW.csv",header = T, sep=",",na.strings = 'null')
data_0061<-read.table("C:/Users/emma5/Desktop/1102 FDA/0061.TW.csv",header = T, sep=",",na.strings = 'null')
data_00635<-read.table("C:/Users/emma5/Desktop/1102 FDA/00635U.TW.csv",header = T, sep=",",na.strings = 'null')
data_00636<-read.table("C:/Users/emma5/Desktop/1102 FDA/00636.TW.csv",header = T, sep=",",na.strings = 'null')
data_00646<-read.table("C:/Users/emma5/Desktop/1102 FDA/00646.TW.csv",header = T, sep=",",na.strings = 'null')
data_00662<-read.table("C:/Users/emma5/Desktop/1102 FDA/00662.TW.csv",header = T, sep=",",na.strings = 'null')
data_00668<-read.table("C:/Users/emma5/Desktop/1102 FDA/00668.TW.csv",header = T, sep=",",na.strings = 'null')
data_00728<-read.table("C:/Users/emma5/Desktop/1102 FDA/00728.TW.csv",header = T, sep=",",na.strings = 'null')
data_00735<-read.table("C:/Users/emma5/Desktop/1102 FDA/00735.TW.csv",header = T, sep=",",na.strings = 'null')
data_2317<-read.table("C:/Users/emma5/Desktop/1102 FDA/2317.TW.csv",header = T, sep=",",na.strings = 'null')
data_2330<-read.table("C:/Users/emma5/Desktop/1102 FDA/2330.TW.csv",header = T, sep=",",na.strings = 'null')
data_2357<-read.table("C:/Users/emma5/Desktop/1102 FDA/2357.TW.csv",header = T, sep=",",na.strings = 'null')
data_2382<-read.table("C:/Users/emma5/Desktop/1102 FDA/2382.TW.csv",header = T, sep=",",na.strings = 'null')
data_2707<-read.table("C:/Users/emma5/Desktop/1102 FDA/2707.TW.csv",header = T, sep=",",na.strings = 'null')
data_3034<-read.table("C:/Users/emma5/Desktop/1102 FDA/3034.TW.csv",header = T, sep=",",na.strings = 'null')
data_5704<-read.table("C:/Users/emma5/Desktop/1102 FDA/5704.TWO.csv",header = T, sep=",",na.strings = 'null')
data_006208<-read.table("C:/Users/emma5/Desktop/1102 FDA/006208.TW.csv",header = T, sep=",",na.strings = 'null')

data_0050[,1]<-as.Date(data_0050[,1])
data_adj<-data.frame(matrix(0, nrow(data_2317), 22))
data_adj[,1]<-data_0050$Date
data_adj[,2:22]<-cbind(data_0050$Adj.Close,data_0052$Adj.Close,data_0053$Adj.Close,data_0055$Adj.Close,
                       data_0056$Adj.Close,data_0061$Adj.Close,data_006208$Adj.Close,data_00635$Adj.Close,
                       data_00636$Adj.Close,data_00646$Adj.Close,data_00662$Adj.Close,
                       data_00668$Adj.Close,data_00728$Adj.Close,data_00735$Adj.Close,
                       data_2317$Adj.Close,data_2330$Adj.Close,data_2357$Adj.Close,data_2382$Adj.Close,
                       data_2707$Adj.Close,data_3034$Adj.Close,data_5704$Adj.Close)
colnames(data_adj)<-c('Date','data_0050','data_0052','data_0053','data_0055','data_0056',
                      'data_0061','data_006208','data_00635U','data_00636','data_00646','data_00662','data_00668',
                      'data_00728','data_00735','data_2317','data_2330','data_2357','data_2382',
                      'data_2707','data_3034','data_5704')
write.table(data_adj,"C:/Users/emma5/Desktop/1102 FDA/data_adj.csv",sep=',')

rm(list = ls(all = TRUE))
source("C:/Users/emma5/Desktop/1102 FDA/function_FDA.R")
data_adj<-read.table("C:/Users/emma5/Desktop/1102 FDA/data_adj.csv",header = T, sep=",")
sum(is.na(data_adj)) #no NAs
data_adj[,1]<-as.Date(data_adj[,1])

#Time series plots of prices
windows()
y.range<-range(data_adj[,2:6])
plot(x=data_adj$Date, y=data_adj$data_0050, main = 'Time series plots of asset prices(0050,0052,0053,0055,0056)',
     xlab = "Date", ylab = 'Price',type = 'l',lwd = 1,ylim = y.range,col=1)
lines(x=data_adj$Date, y=data_adj$data_0052,col = 2,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_0053,col = 3,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_0055,col = 4,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_0056,col = 5,lwd = 1)
legend("topleft", legend = c('0050','0052','0053','0055','0056'), col = c(1,2,3,4,5), lwd = c(1,1,1,1,1))

windows()
y.range<-range(data_adj[,7:11])
plot(x=data_adj$Date, y=data_adj$data_0061, main = 'Time series plots of asset prices(0061, 006208, 00635U, 00636, 00646)',
     xlab = "Date", ylab = 'Price',type = 'l',lwd = 1,ylim = y.range,col=1)
lines(x=data_adj$Date, y=data_adj$data_006208,col = 2,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_00635U,col = 3,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_00636,col = 4,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_00646,col = 5,lwd = 1)
legend("topleft", legend = c('0061','006208','00635U','00636','00646'), col = c(1,2,3,4,5), lwd = c(1,1,1,1,1))

windows()
y.range<-range(data_adj[,12:16])
plot(x=data_adj$Date, y=data_adj$data_00662,main = 'Time series plots of asset prices(00662, 00668, 00728, 00735, 2317)',
     xlab = "Date", ylab = 'Price',type = 'l',lwd = 1,ylim = y.range,col=1)
lines(x=data_adj$Date, y=data_adj$data_00668,col = 2,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_00728,col = 3,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_00735,col = 4,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_2317,col = 5,lwd = 1)
legend("topleft", legend = c('00662','00668','00728','00735','2317'), col = c(1,2,3,4,5), lwd = c(1,1,1,1,1))

windows()
y.range<-range(data_adj[,17:22])
plot(x=data_adj$Date, y=data_adj$data_2330,main = 'Time series plots of asset prices(2330, 2357, 2382, 2707, 3034, 5704)',
     xlab = "Date", ylab = 'Price',type = 'l',lwd = 1,ylim = y.range,col=1)
lines(x=data_adj$Date, y=data_adj$data_2357,col = 2,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_2382,col = 3,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_2707,col = 4,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_3034,col = 5,lwd = 1)
lines(x=data_adj$Date, y=data_adj$data_5704,col = 6,lwd = 1)
legend("topleft", legend = c('2330','2357','2382','2707','3034','5704'), col = c(1,2,3,4,5,6), lwd = c(1,1,1,1,1,1))

#asset returns
ret_0050<-c(NA,retx(data_adj$data_0050))
ret_0052<-c(NA,retx(data_adj$data_0052))
ret_0053<-c(NA,retx(data_adj$data_0053))
ret_0055<-c(NA,retx(data_adj$data_0055))
ret_0056<-c(NA,retx(data_adj$data_0056))
ret_0061<-c(NA,retx(data_adj$data_0061))
ret_006208<-c(NA,retx(data_adj$data_006208))
ret_00635U<-c(NA,retx(data_adj$data_00635U))
ret_00636<-c(NA,retx(data_adj$data_00636))
ret_00646<-c(NA,retx(data_adj$data_00646))
ret_00662<-c(NA,retx(data_adj$data_00662))
ret_00668<-c(NA,retx(data_adj$data_00668))
ret_00728<-c(NA,retx(data_adj$data_00728))
ret_00735<-c(NA,retx(data_adj$data_00735))
ret_2317<-c(NA,retx(data_adj$data_2317))
ret_2330<-c(NA,retx(data_adj$data_2330))
ret_2357<-c(NA,retx(data_adj$data_2357))
ret_2382<-c(NA,retx(data_adj$data_2382))
ret_2707<-c(NA,retx(data_adj$data_2707))
ret_3034<-c(NA,retx(data_adj$data_3034))
ret_5704<-c(NA,retx(data_adj$data_5704))

datax<-data.frame(matrix(0, 729, 22))
datax[,1]<-data_adj$Date
datax[,2:ncol(datax)]<-cbind(ret_0050,ret_0052,ret_0053,ret_0055,ret_0056,
                             ret_0061,ret_006208,ret_00635U,ret_00636,ret_00646,
                             ret_00662,ret_00668,ret_00728,ret_00735,ret_2317,
                             ret_2330,ret_2357,ret_2382,ret_2707,ret_3034,ret_5704)  

colnames(datax)<-c("Date",'x0050','x0052','x0053','x0055','x0056','x0061','x006208',
                   'x00635U','x00636','x00646','x00662','x00668','x00728','x00735',"x2317","x2330",
                   "x2357",'x2382','x2707','x3034','x5704')    
datax<-datax[-1,]
datax[,2:22]<-datax[,2:22]*100
write.table(datax, "C:/Users/emma5/Desktop/1102 FDA/datax.csv", sep = ",")

summary_ind<-rbind(apply(datax[,2:22],2,NROW),apply(datax[,2:22],2,min),
                   apply(datax[,2:22],2,median)*252,
                   apply(datax[,2:22],2,max),
                   apply(datax[,2:22],2,mean)*252,
                   apply(datax[,2:22],2,sd)*sqrt(252),
                   apply(datax[,2:22],2,my_skewness)/sqrt(252),
                   apply(datax[,2:22],2,my_kurtosis)/252,
                   apply(datax[,2:22],2,my_acf1))
rownames(summary_ind)<-c('No. of Obs.','Min','Median','Max','Mean',"Std.","SKewness","Kurtosis","ACF1")
summary_ind<-t(round(summary_ind,3))
summary_ind<-data.frame(summary_ind)
write.table(summary_ind, "C:/Users/emma5/Desktop/1102 FDA/summary_ind.csv", sep = ",")

#Time series plots of asset returns
windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x0050,main = 'Time series plots of asset returns (0050)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x0052,main = 'Time series plots of asset returns (0052)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x0053,main = 'Time series plots of asset returns (0053)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 6)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x0055,main = 'Time series plots of asset returns (0055)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x0056,main = 'Time series plots of asset returns (0056)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x0061,main = 'Time series plots of asset returns (0061)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x006208,main = 'Time series plots of asset returns (006208)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x00635U,main = 'Time series plots of asset returns (00635U)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x00636,main = 'Time series plots of asset returns (00636)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x00646,main = 'Time series plots of asset returns (00646)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x00662,main = 'Time series plots of asset returns (00662)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x00668,main = 'Time series plots of asset returns (00668)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x00728,main = 'Time series plots of asset returns (00728)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x00735,main = 'Time series plots of asset returns (00735)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x2317,main = 'Time series plots of asset returns (2317)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x2330,main = 'Time series plots of asset returns (2330)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x2357,main = 'Time series plots of asset returns (2357)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x2382,main = 'Time series plots of asset returns (2382)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=datax$x2707,main = 'Time series plots of asset returns (2707)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=datax$x3034,main = 'Time series plots of asset returns (3034)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

plot(x=datax$Date,y=datax$x5704,main = 'Time series plots of asset returns (5704)',
     xlab = "Date", ylab = 'Return(%)',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)

#portfolio return

rm(list = ls(all = TRUE))
source("C:/Users/emma5/Desktop/1102 FDA/function_FDA.R")
#fixed weight
datax<-read.table("C:/Users/emma5/Desktop/1102 FDA/datax.csv",header = T, sep=",")
datax$Date<-as.Date(datax$Date)
datax[,2:22]<-datax[,2:22]/100
por_retN<-por_ret_N(datax[, 2:ncol(datax)])
cumr_n<-cumprod((1+por_retN)) 

#buy-and-hold portfolio
rx<-rbind(0, datax[,2:ncol(datax)])                ##add initial period (return=0)   
rx<-1+rx                                             ##gross return
cumr_bh<-apply(rx, 2, cumprod)                       ##cumulative return of each asset
cumr_bh<-apply(cumr_bh, 1, mean)                     ##average of these cumulative returns

por_retbh<-cumr_bh[-1]/cumr_bh[-length(cumr_bh)]-1   ##portfolio return at each period(後-前)/前

## price weighted portfolio
data_adj<-read.table("C:/Users/emma5/Desktop/1102 FDA/data_adj.csv",header = T, sep=",")
wpx<-cbind(data_adj$data_0050,data_adj$data_0052,data_adj$data_0053,data_adj$data_0055,data_adj$data_0056,data_adj$data_0061,data_adj$data_006208,data_adj$data_00635,data_adj$data_00636,
                     data_adj$data_00646,data_adj$data_00662,data_adj$data_00668,data_adj$data_00728,data_adj$data_00735,data_adj$data_2317,data_adj$data_2330,data_adj$data_2357,data_adj$data_2382,data_adj$data_2707,data_adj$data_3034,data_adj$data_5704)/(data_adj$data_0050+data_adj$data_0052+data_adj$data_0053+data_adj$data_0055+data_adj$data_0056+data_adj$data_0061+data_adj$data_006208+data_adj$data_00635+data_adj$data_00636+
                                                                                                                                                                                                                                                                data_adj$data_00646+data_adj$data_00662+data_adj$data_00668+data_adj$data_00728+data_adj$data_00735+data_adj$data_2317+data_adj$data_2330+data_adj$data_2357+data_adj$data_2382+data_adj$data_2707+data_adj$data_3034+data_adj$data_5704)
wpx<-wpx[-nrow(wpx),]
por_retpw<-numeric(nrow(datax))

for(i in 1:nrow(datax)){
  
  por_retpw[i]<-as.matrix(datax[i, 2:ncol(datax)])%*%wpx[i,]
  
}

pw_cumr<-cumprod((1+por_retpw))

#gmvp
data_ret<-datax[, 2:ncol(datax)]
consx<-ABC_mvp(data_ret) 
gmvp_mr<-consx$B/consx$C
w_gmvp<-gmvp_wx(data_ret)                 ##solving gmvp optimization with function
por_ret_gmvp<-numeric(nrow(datax))

for(i in 1:nrow(datax)){
  
  por_ret_gmvp[i]<-as.matrix(datax[i, 2:ncol(datax)])%*%(w_gmvp)
  
}
gmvp_cumr<-cumprod((1+por_ret_gmvp))
gmvp_sd<-mvp_sdx(data_ret, gmvp_mr)

##tangency portfolio
rf<-0.025/252
w_tan<-tan_wx(data_ret, rf)
por_ret_tan<-numeric(nrow(datax))

for(i in 1:nrow(datax)){
  
  por_ret_tan[i]<-as.matrix(datax[i, 2:ncol(datax)])%*%(w_tan)
  
}
tan_cumr<-cumprod((1+por_ret_tan))
result_tan<-tan_mr_sdx(data_ret, rf)
result_tan$mu_tan               
result_tan$sd_tan

#mvp
mu_targ<-0.0008
w_mvp<-mvp_wx(data_ret,mu_targ)
por_ret_mvp<-numeric(nrow(datax))

for(i in 1:nrow(datax)){
  
  por_ret_mvp[i]<-as.matrix(datax[i, 2:ncol(datax)])%*%(w_mvp)
  
}
mvp_cumr<-cumprod((1+por_ret_mvp))
mvp_sd<-mvp_sdx(data_ret,mu_targ)

#no-shortsales gmvp
library(quadprog)
nsgmvp_w<-nsgmvp_wx_quad(data_ret)$solution
nsgmvp_w<-round(nsgmvp_w, 8)
por_ret_nsgmvp<-numeric(nrow(datax))

for(i in 1:nrow(datax)){
  
  por_ret_nsgmvp[i]<-as.matrix(datax[i, 2:ncol(datax)])%*%as.matrix(nsgmvp_w)
  
}
nsgmvp_cumr<-cumprod((1+por_ret_nsgmvp))

#Time series plots of the out-of-sample (oos) portfolio returns
windows()
par(mfrow=c(2,1))
plot(x=datax$Date,y=por_retN,main = 'Time series plots of portfolio returns (Fixed weight)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=por_retbh,main = 'Time series plots of portfolio returns (buy-and-hold)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

windows()
par(mfrow=c(2,1))
plot(x=datax$Date,y=por_retpw,main = 'Time series plots of portfolio returns (price weighted)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=por_ret_gmvp,main = 'Time series plots of portfolio returns (GMVP)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)

windows()
par(mfrow=c(3,1))
plot(x=datax$Date,y=por_ret_tan,main = 'Time series plots of portfolio returns (tangency portfolio)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 2)
abline(h=0,lty=2)
plot(x=datax$Date,y=por_ret_mvp,main = 'Time series plots of portfolio returns (MVP)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 4)
abline(h=0,lty=2)
plot(x=datax$Date,y=por_ret_nsgmvp,main = 'Time series plots of portfolio returns (no-shortsale GMVP)',
     xlab = "Date", ylab = 'Return',type = 'l',lwd = 1,col = 7)
abline(h=0,lty=2)
#Time series plots of the out of sample cumulative gross returns of the portfolios
windows()
y.range<-range(c(nsgmvp_cumr,cumr_n, cumr_bh[-1], pw_cumr,gmvp_cumr,mvp_cumr,tan_cumr))
plot(x = datax$Date, y = cumr_n, ylim = y.range,
     main = "Time series plots of the out of sample cumulative gross returns of the portfolios",
     xlab = "Date", ylab = "Cumulative return", 
     type="l")
lines(x = datax$Date, y = cumr_bh[-1], col = 2, lty =2)
lines(x = datax$Date, y = pw_cumr,  col = 3)
lines(x = datax$Date, y = gmvp_cumr,  col = 4, lty = 2)
lines(x = datax$Date, y = tan_cumr,  col = 5)
lines(x = datax$Date, y = mvp_cumr,  col = 6, lty = 2)
lines(x = datax$Date, y = nsgmvp_cumr,  col = 7)
abline(h = 1,lty=2)
legend("topleft", legend = c("FW","BH", "Price-weighted",'GMVP','tangency','MVP','no-shortsale gmvp'),
       lty = c(1,2,1,2,1,2,1), col = c(1,2,3,4,5,6,7))

por_ret<-data.frame(cbind(por_retN,por_retbh,por_retpw,por_ret_gmvp,por_ret_tan,por_ret_mvp,por_ret_nsgmvp))
colnames(por_ret)<-c("FW","BH", "Price-weighted",'GMVP','tangency','MVP','no-shortsale gmvp')
summary_por<-rbind(apply(por_ret,2,NROW),apply(por_ret,2,min)*100,
                   apply(por_ret,2,median)*252*100,
                   apply(por_ret,2,max)*100,
                   apply(por_ret,2,mean)*252*100,
                   apply(por_ret,2,sd)*sqrt(252)*100,
                   apply(por_ret,2,my_skewness)/sqrt(252),
                   apply(por_ret,2,my_kurtosis)/252,
                   apply(por_ret,2,my_acf1))
rownames(summary_por)<-c('No. of Obs.','Min','Median','Max','Mean',"Std.","SKewness","Kurtosis","ACF1")
summary_por<-t(round(summary_por,3))
summary_por<-data.frame(summary_por)
write.table(summary_por, "C:/Users/emma5/Desktop/1102 FDA/summary_por.csv", sep = ",")

library(quadprog)
kx<-252
hx<-nrow(data_ret)-kx                     ##length of out-of-sample period
wx1_mat<-matrix(0, hx+1, ncol(data_ret))
wx2_mat<-matrix(0, hx+1, ncol(data_ret))
wx3_mat<-matrix(0, hx+1, ncol(data_ret))
wx4_mat<-matrix(0, hx+1, ncol(data_ret))
wx5_mat<-matrix(0, hx+1, ncol(data_ret))
wx6_mat<-matrix(0, hx+1, ncol(data_ret))
por_netrx1<-numeric(hx)
por_netrx2<-numeric(hx)
por_netrx3<-numeric(hx)
por_netrx4<-numeric(hx)
por_netrx5<-numeric(hx)
por_netrx6<-numeric(hx)
tor1<-numeric(hx)
tor2<-numeric(hx)
tor3<-numeric(hx)
tor4<-numeric(hx)
tor5<-numeric(hx)
tor6<-numeric(hx)

hhi1<-numeric(hx)
hhi2<-numeric(hx)
hhi3<-numeric(hx)
hhi4<-numeric(hx)
hhi5<-numeric(hx)
hhi6<-numeric(hx)

slr1<-numeric(hx)
slr2<-numeric(hx)
slr3<-numeric(hx)
slr4<-numeric(hx)
slr5<-numeric(hx)
slr6<-numeric(hx)
epx<-3.5/1000                                                  ##transaction cost
adj.p<-data_adj[,-1]                                            

for(i in 1:hx){
  
  datax1<-data_ret[i:(i+kx-1),]             ##data in the window (rolling window)
  
  wx1<-1/21
  wx2<-cbind(adj.p[i:(i+kx-1),1],adj.p[i:(i+kx-1),2],adj.p[i:(i+kx-1),3],adj.p[i:(i+kx-1),4],adj.p[i:(i+kx-1),5],adj.p[i:(i+kx-1),6],adj.p[i:(i+kx-1),7],
                       adj.p[i:(i+kx-1),8],adj.p[i:(i+kx-1),9],adj.p[i:(i+kx-1),10],adj.p[i:(i+kx-1),11],adj.p[i:(i+kx-1),12],adj.p[i:(i+kx-1),13],
                       adj.p[i:(i+kx-1),14],adj.p[i:(i+kx-1),15],adj.p[i:(i+kx-1),16],adj.p[i:(i+kx-1),17],adj.p[i:(i+kx-1),18],
                       adj.p[i:(i+kx-1),19],adj.p[i:(i+kx-1),20],adj.p[i:(i+kx-1),21])/(adj.p[i:(i+kx-1),1]+adj.p[i:(i+kx-1),2]+adj.p[i:(i+kx-1),3]+adj.p[i:(i+kx-1),4]+adj.p[i:(i+kx-1),5]+adj.p[i:(i+kx-1),6]+adj.p[i:(i+kx-1),7]+adj.p[i:(i+kx-1),8]+adj.p[i:(i+kx-1),9]+adj.p[i:(i+kx-1),10]+adj.p[i:(i+kx-1),11]+adj.p[i:(i+kx-1),12]+adj.p[i:(i+kx-1),13]+adj.p[i:(i+kx-1),14]+adj.p[i:(i+kx-1),15]+adj.p[i:(i+kx-1),16]+adj.p[i:(i+kx-1),17]+adj.p[i:(i+kx-1),18]+adj.p[i:(i+kx-1),19]+adj.p[i:(i+kx-1),20]+adj.p[i:(i+kx-1),21])
  wx2<-wx2[-nrow(wx2),]
  wx2<-as.vector(apply(wx2,2,mean))
  wx3<-as.vector(gmvp_wx(datax1))
  wx4<-as.vector(tan_wx(datax1,rf))
  wx5<-as.vector(mvp_wx(datax1, mu_targ = mu_targ))               ##mvp
  wx6<-nsgmvp_wx_quad(datax1)$solution                          ##nsgmvp
  wx6<-round(wx6,8)
  
  rx<-data_ret[i+kx,]                       ##return at period i+kx (period t+1), scaled by 1/100
  rx_lag<-datax1[nrow(datax1),]                                   ##return at period i+kx-1 (period t)
  
  ## individual assets' turnover over rate
  tor1_ind<-wx1-wx1_mat[i,]*(1+rx_lag)/(1+sum(wx1_mat[i,]*rx_lag))
  tor2_ind<-wx2-wx2_mat[i,]*(1+rx_lag)/(1+sum(wx2_mat[i,]*rx_lag))
  tor3_ind<-wx3-wx3_mat[i,]*(1+rx_lag)/(1+sum(wx3_mat[i,]*rx_lag))
  tor4_ind<-wx4-wx4_mat[i,]*(1+rx_lag)/(1+sum(wx4_mat[i,]*rx_lag))
  tor5_ind<-wx5-wx5_mat[i,]*(1+rx_lag)/(1+sum(wx5_mat[i,]*rx_lag))
  tor6_ind<-wx6-wx6_mat[i,]*(1+rx_lag)/(1+sum(wx6_mat[i,]*rx_lag))
  
  ## portfolio turn over rate
  tor1[i]<-sum(abs(tor1_ind))
  tor2[i]<-sum(abs(tor2_ind))
  tor3[i]<-sum(abs(tor3_ind))
  tor4[i]<-sum(abs(tor4_ind))
  tor5[i]<-sum(abs(tor5_ind))
  tor6[i]<-sum(abs(tor6_ind))
  
  ## portfolio net return
  por_netrx1[i]<-(1+sum(wx1*rx))*(1-epx*tor1[i])-1
  por_netrx2[i]<-(1+sum(wx2*rx))*(1-epx*tor2[i])-1
  por_netrx3[i]<-(1+sum(wx3*rx))*(1-epx*tor3[i])-1
  por_netrx4[i]<-(1+sum(wx4*rx))*(1-epx*tor4[i])-1
  por_netrx5[i]<-(1+sum(wx5*rx))*(1-epx*tor5[i])-1
  por_netrx6[i]<-(1+sum(wx6*rx))*(1-epx*tor6[i])-1
  
  ## HHI
  hhi1[i]<-sum(wx1^2)/(sum(abs(wx1))^2)
  hhi2[i]<-sum(wx2^2)/(sum(abs(wx2))^2)
  hhi3[i]<-sum(wx3^2)/(sum(abs(wx3))^2)
  hhi4[i]<-sum(wx4^2)/(sum(abs(wx4))^2)
  hhi5[i]<-sum(wx5^2)/(sum(abs(wx5))^2)
  hhi6[i]<-sum(wx6^2)/(sum(abs(wx6))^2)
  
  ## SLR
  slr1[i]<-sum(abs(wx1[wx1<0]))/sum(abs(wx1[wx1>0]))
  slr2[i]<-sum(abs(wx2[wx2<0]))/sum(abs(wx2[wx2>0]))
  slr3[i]<-sum(abs(wx3[wx3<0]))/sum(abs(wx3[wx3>0]))
  slr4[i]<-sum(abs(wx4[wx4<0]))/sum(abs(wx4[wx4>0]))
  slr5[i]<-sum(abs(wx5[wx5<0]))/sum(abs(wx5[wx5>0]))
  slr6[i]<-sum(abs(wx6[wx6<0]))/sum(abs(wx6[wx6>0]))
  
  
  ## store portfolio weight vector at this period
  wx1_mat[i+1,]<-wx1
  wx2_mat[i+1,]<-wx2
  wx3_mat[i+1,]<-wx3
  wx4_mat[i+1,]<-wx4
  wx5_mat[i+1,]<-wx5
  wx6_mat[i+1,]<-wx6
  
  print(i) 
  
}  
##Sharpe ratio
por_sr<-data.frame(cbind((mean(por_retN-rf))/(sd(por_retN-rf))*sqrt(252),
                         (mean(por_retbh-rf))/(sd(por_retbh-rf))*sqrt(252),
                         (mean(por_retpw-rf))/(sd(por_retpw-rf))*sqrt(252),
                         (mean(por_ret_gmvp-rf))/(sd(por_ret_gmvp-rf))*sqrt(252),
                         (mean(por_ret_tan-rf))/(sd(por_ret_tan-rf))*sqrt(252),
                         (mean(por_ret_mvp-rf))/(sd(por_ret_mvp-rf))*sqrt(252),
                         (mean(por_ret_nsgmvp-rf))/(sd(por_ret_nsgmvp-rf))*sqrt(252)))
colnames(por_sr)<-c("FW","BH", "Price-weighted",'GMVP','tangency','MVP','no-shortsale gmvp')
rownames(por_sr)<-'Sharpe ratio'
por_sr<-round(por_sr,3)

por_net_sr<-data.frame(cbind((mean(por_netrx1-rf))/(sd(por_netrx1-rf))*sqrt(252),
                             (mean(por_netrx2-rf))/(sd(por_netrx2-rf))*sqrt(252),
                             (mean(por_netrx3-rf))/(sd(por_netrx3-rf))*sqrt(252),
                             (mean(por_netrx4-rf))/(sd(por_netrx4-rf))*sqrt(252),
                             (mean(por_netrx5-rf))/(sd(por_netrx5-rf))*sqrt(252),
                             (mean(por_netrx6-rf))/(sd(por_netrx6-rf))*sqrt(252)))
colnames(por_net_sr)<-c("FW", "Price-weighted",'GMVP','tangency','MVP','no-shortsale gmvp')
rownames(por_net_sr)<-'Sharpe ratio (net portfolio returns)'
por_net_sr<-round(por_net_sr,3)

tor<-rbind(FW=c(summary(tor1),'std.'=sd(tor1)),
                pw=c(summary(tor2),'std.'=sd(tor2)),
gmvp=c(summary(tor3),'std.'=sd(tor3)),
tangency=c(summary(tor4),'std.'=sd(tor4)),
mvp=c(summary(tor5),'std.'=sd(tor5)),
nsgmvp=c(summary(tor6),'std.'=sd(tor6)))
tor<-round(tor,3)
hhi<-rbind(FW=c(summary(hhi1),'std.'=sd(hhi1)),
           pw=c(summary(hhi2),'std.'=sd(hhi2)),
           gmvp=c(summary(hhi3),'std.'=sd(hhi3)),
           tangency=c(summary(hhi4),'std.'=sd(hhi4)),
           mvp=c(summary(hhi5),'std.'=sd(hhi5)),
           nsgmvp=c(summary(hhi6),'std.'=sd(hhi6)))
hhi<-round(hhi,3)
slr<-rbind(FW=c(summary(slr1),'std.'=sd(slr1)),
           pw=c(summary(slr2),'std.'=sd(slr2)),
           gmvp=c(summary(slr3),'std.'=sd(slr3)),
           tangency=c(summary(slr4),'std.'=sd(slr4)),
           mvp=c(summary(slr5),'std.'=sd(slr5)),
           nsgmvp=c(summary(slr6),'std.'=sd(slr6)))
slr<-round(slr,3)
VaR<-rbind(FW=c('VaR'=VaR_samplex(por_retN,1,alphax=0.05),'ES'=ES_samplex(por_retN,1,alphax=0.05),'LPSD'=LPSDx(por_retN,rf)),
           BH=c('VaR'=VaR_samplex(por_retbh,1,alphax=0.05),'ES'=ES_samplex(por_retbh,1,alphax=0.05),'LPSD'=LPSDx(por_retbh,rf)),
           PW=c('VaR'=VaR_samplex(por_retpw,1,alphax=0.05),'ES'=ES_samplex(por_retpw,1,alphax=0.05),'LPSD'=LPSDx(por_retpw,rf)),
           GMVP=c('VaR'=VaR_samplex(por_ret_gmvp,1,alphax=0.05),'ES'=ES_samplex(por_ret_gmvp,1,alphax=0.05),'LPSD'=LPSDx(por_ret_gmvp,rf)),
           tangency=c('VaR'=VaR_samplex(por_ret_tan,1,alphax=0.05),'ES'=ES_samplex(por_ret_tan,1,alphax=0.05),'LPSD'=LPSDx(por_ret_tan,rf)),
           MVP=c('VaR'=VaR_samplex(por_ret_mvp,1,alphax=0.05),'ES'=ES_samplex(por_ret_mvp,1,alphax=0.05),'LPSD'=LPSDx(por_ret_mvp,rf)),
           NSGMVP=c('VaR'=VaR_samplex(por_ret_nsgmvp,1,alphax=0.05),'ES'=ES_samplex(por_ret_nsgmvp,1,alphax=0.05),'LPSD'=LPSDx(por_ret_nsgmvp,rf)))
VaR<-round(VaR,3)
