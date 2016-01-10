library(lubridate)

# Read in all the data... optimize later
powerData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

# TEMP! Subset on date manually
pdt <- data[as.character(data$Date) %in% c('1/2/2007', '2/2/2007'),]

# combine Date and Time field
pdt$DateTime <- as.POSIXct(paste(pdt$Date, pdt$Time), format="%d/%m/%Y %H:%M:%S")

# Setup for 4 charts
par(mfrow=c(2,2), mar=c(4,5,2,1), las=1, bty="n")

# First chart
plot(pdt$DateTime, pdt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")

# Second
plot(pdt$DateTime, pdt$Voltage, type="l", ylab="Voltage", xlab="datetime", main="")

# Third
plot(pdt$DateTime,pdt$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
lines(pdt$DateTime,pdt$Sub_metering_2, col="red")
lines(pdt$DateTime,pdt$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

# Fourth
plot(pdt$DateTime, pdt$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", main="", width = 480, height = 480)
