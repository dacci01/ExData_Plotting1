library("lubridate")
#
#read data
data<-read.table(file='household_power_consumption.txt',sep=';',header=T,
                 colClasses=c('factor','factor','numeric','numeric',
                              'numeric','numeric','numeric','numeric',
                              'numeric'),na.strings='?')
#
#convert dates and times with lubridate package
data[,1]<-dmy(data[,1])
data[,2]<-hms(data[,2])
filt<-data[year(data[,1])==2007 & month(data[,1])==2 & day(data[,1])<3,]

#open png plot device, create plot#3, close device
png(file = "plot3.png",width = 480, height = 480)
with(filt,plot(Date+Time,Sub_metering_1,type='l',
               xlab='',ylab='Energy sub metering'))
with(filt,lines(Date+Time,Sub_metering_2,xlab='',ylab='',col='red'))
with(filt,lines(Date+Time,Sub_metering_3,xlab='',ylab='',col='blue'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1,col=c('black','red','blue'))
dev.off()
