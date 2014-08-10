setwd("~/GitHub/Exdata-005/exdata-data-household_power_consumption")
household_power_consumption <- read.table("household_power_consumption.txt",head=TRUE,sep=";",
                                          stringsAsFactors=FALSE)
consumption<-household_power_consumption[,c(1:9)]
y<-subset(consumption, 
          consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007")

png("plot1.png", width = 480, height = 480)
hist(as.numeric(y$Global_active_power), 
     breaks=20, 
     freq=TRUE, 
     ylim=c(0, 1300),
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
