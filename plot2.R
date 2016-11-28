
#setwd("~/Coursera")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
data$DateTime=paste(data$Date, data$Time)
data$DateTime=as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL

subdata <- subset(data, DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot2.png", width=480, height=480)
plot(x=(subdata$DateTime), y=subdata$Global_active_power, xlab=NA, ylab="Global Active Power (kilowatts)", type="l")
dev.off()
