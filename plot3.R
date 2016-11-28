#setwd("~/Coursera")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
data$DateTime=paste(data$Date, data$Time)
data$DateTime=as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL

png("plot3.png", width = 480, height = 480)
plot(x=(subdata$DateTime), y=subdata$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="l")
lines(x=(subdata$DateTime), y=subdata$Sub_metering_2, col="red")
lines(x=(subdata$DateTime), y=subdata$Sub_metering_3, col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="l", col=c("black","red","blue"), lwd=2,cex=0.7)

dev.off()
