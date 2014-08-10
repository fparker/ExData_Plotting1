setwd("~/GitHub/Exdata-005/exdata-data-household_power_consumption")
household_power_consumption <- read.table("household_power_consumption.txt",head=TRUE,sep=";",
                                          stringsAsFactors=FALSE)
consumption<-household_power_consumption[,c(1:9)]
y<-subset(consumption, 
          consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


date1<-as.Date(y$Date, format="%d/%m/%Y")      ##convert to date
y<-cbind(y,date1)                              ##add column

dayofweek<-weekdays(date1)                     
y<-cbind(y,dayofweek)

time<-paste(date1,y$Time, sep=" ")    ##concatenate date and time
datetime <- strptime(time, format="%Y-%m-%d %H:%M:%S")

meter1<-as.numeric(y$Sub_metering_1)
meter2<-as.numeric(y$Sub_metering_2)
meter3<-(y$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(datetime,meter1, type="l", col= "black", ylim=c(0,40), ylab="Energy sub metering",xlab="")
lines(datetime,meter2, type="l", col="red")
lines(datetime,meter3, type="l", col="blue")
names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend('topright', names , 
       lty=1, col=c("black",'red', 'blue'),cex=1)
dev.off()

