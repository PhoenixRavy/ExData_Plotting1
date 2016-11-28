
#setwd("~/Coursera")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
data$DateTime=paste(data$Date, data$Time)
data$DateTime=as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL

subdata <- subset(data, DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1/4
plot(x=(subdata$DateTime), y=subdata$Global_active_power, xlab=NA, ylab="Global Active Power (kilowatts)", type="l")

#plot 2/4
plot(x=(subepc$DateTime), y=subepc$Voltage, xlab="datetime", ylab="Voltage", type="l")

#plot 3/4
plot(x=(subdata$DateTime), y=subdata$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="l")
lines(x=(subdata$DateTime), y=subdata$Sub_metering_2, col="red")
lines(x=(subdata$DateTime), y=subdata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="l", col=c("black","red","blue"), lwd=2,cex=0.7)

#plot 4/4
plot(subepc$DateTime, subepc$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power",  main = "", type = "l")

dev.off()
