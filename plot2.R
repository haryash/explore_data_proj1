## Script for creating plot2
## The file household_power_consumption.txt was downloaded and available in current working dir.

## Read the full dataset.
fulldf <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

## Convert Date from char to class "Date"
fulldf$Date <- as.Date(fulldf$Date, "%d/%m/%Y")  
mydf <- fulldf[fulldf$Date == "2007-02-01" | fulldf$Date == "2007-02-02", ] ## Subsetting for the required dates.
mydf$Datetime <- paste(as.character(mydf$Date), mydf$Time)                  ## create new datetime column
mydf$Datetime <- strptime(mydf$Datetime, "%Y-%m-%d %H:%M:%S")               ## Convert from char to POSIX

## Open png device and create plot2
png(filename = "plot2.png")
plot(mydf$Datetime, mydf$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()