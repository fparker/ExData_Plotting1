setwd("~/GitHub/Exdata-005/exdata-data-household_power_consumption")
household_power_consumption <- read.table("household_power_consumption.txt",head=TRUE,sep=";",
                                          stringsAsFactors=FALSE)
consumption<-household_power_consumption[,c(1:9)]
y<-subset(consumption, 
          consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")


date1<-as.Date(y$Date, format="%d/%m/%Y")
y<-cbind(y,date1)

dayofweek<-weekdays(date1)
y<-cbind(y,dayofweek)

time<-paste(date1,y$Time, sep=" ")
datetime<- strptime(time, format="%Y-%m-%d %H:%M:%S")

##png("plot2.png", width = 480, height = 480)
plot(datetime,(as.numeric(y$Global_active_power)), type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     ylim=range(as.numeric(y$Global_active_power))
     
dev.off()