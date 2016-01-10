#
# This file reads in the data kept in the repo and generates a histogram
# of Global Active Power.
#

library(lubridate)

# Read in all the data... optimize later
powerData <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

# Subset on date manually
pdt <- data[as.character(data$Date) %in% c('1/2/2007', '2/2/2007'),]

# combine Date and Time field
pdt$DateTime <- as.POSIXct(paste(pdt$Date, pdt$Time), format="%d/%m/%Y %H:%M:%S")

# Save the chart
png("plot1.png", width = 480, height = 480, units = "px")
hist(pdt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

