#setwd("~/Coursera")
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE, na.strings="?")
data$DateTime=paste(data$Date, data$Time)
data$DateTime=as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date=NULL
data$Time=NULL

subset_data <- subset(data,datetime$year==107 & datetime$mon==1 & (datetime$mday==1 | datetime$mday==2))

png(file = "plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",ylim=c(0,1200))
dev.off()
