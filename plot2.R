#
# This file reads in the data kept in the repo and generates a chart for
# Global Active Power vs Datetime
#

library(lubridate)

# Read in all the data... optimize later
powerData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

# TEMP! Subset on date manually
pdt <- data[as.character(data$Date) %in% c('1/2/2007', '2/2/2007'),]

# combine Date and Time field
pdt$DateTime <- as.POSIXct(paste(pdt$Date, pdt$Time), format="%d/%m/%Y %H:%M:%S")

#Draw the chart
plot(pdt$DateTime, pdt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")

