#
# This file reads in the data kept in the repo and generates a chart
# of sub_metering_1/2/3 vs Datetime
#

library(lubridate)

# Read in all the data... optimize later
powerData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

# TEMP! Subset on date manually
pdt <- data[as.character(data$Date) %in% c('1/2/2007', '2/2/2007'),]

# combine Date and Time field
pdt$DateTime <- as.POSIXct(paste(pdt$Date, pdt$Time), format="%d/%m/%Y %H:%M:%S")

#Draw the chart
plot(pdt$DateTime,pdt$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", height=480, width=480)
lines(pdt$DateTime,pdt$Sub_metering_2, col="red")
lines(pdt$DateTime,pdt$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
