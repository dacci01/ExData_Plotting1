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

#open png plot device, create plot#2, close device
png(file = "plot2.png",width = 480, height = 480)
with(filt,plot(Date+Time,Global_active_power,type='l',
               xlab='',ylab='Global Active Power (kilowatts)'))
dev.off()
