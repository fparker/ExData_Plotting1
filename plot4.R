setwd("~/GitHub/Exdata-005/exdata-data-household_power_consumption")
household_power_consumption <- read.delim("household_power_consumption.txt",
                                          stringsAsFactors=FALSE)
consumption<-household_power_consumption[,c(1:9)]
y<-subset(consumption, 
          consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


date1<-as.Date(y$Date, format="%d/%m/%Y")
y<-cbind(y,date1)

dayofweek<-weekdays(date1)
y<-cbind(y,dayofweek)

time<-paste(date1,y$Time, sep=" ")
datetime <- strptime(time, format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)  ##write png file
par(mfrow=c(2,2))

plot(datetime,as.numeric(y$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     ylim=c(0,6))

plot(datetime,(as.numeric(y$Voltage)), type="l", 
     ylab="Voltage")

plot(datetime,meter1, type="l", col= "black", ylim=c(0,38), ylab="Energy sub metering",xlab="")
lines(datetime,meter2, type="l", col="red")
lines(datetime,meter3, type="l", col="blue")
names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend('topright', names , 
       lty=1, col=c("black",'red', 'blue'),cex=1)

plot(datetime,(as.numeric(y$Global_reactive_power)), type="l", 
     ylab="Global Reactive Power", ylim=c(0,.5))
dev.off()