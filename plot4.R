## Script for creating plot4
## The file household_power_consumption.txt was downloaded and available in current working dir.

## Read the full dataset.
fulldf <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = c("?"))

## Convert Date from char to class "Date"
fulldf$Date <- as.Date(fulldf$Date, "%d/%m/%Y")  
mydf <- fulldf[fulldf$Date == "2007-02-01" | fulldf$Date == "2007-02-02", ] ## Subsetting for the required dates.
mydf$Datetime <- paste(as.character(mydf$Date), mydf$Time)                  ## create new datetime column
mydf$Datetime <- strptime(mydf$Datetime, "%Y-%m-%d %H:%M:%S")               ## Convert from char to POSIX

## Open png device and create plot4
png(filename = "plot4.png")
par(mfrow=c(2,2))
with(mydf, {plot(Datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")})
with(mydf, {plot(Datetime, Voltage, type="l")})
plot(mydf$Datetime, mydf$Sub_metering_1, type="l", ylab = "Energy Sub metering", xlab = "")
points(mydf$Datetime, mydf$Sub_metering_2, col = "red", type="l")
points(mydf$Datetime, mydf$Sub_metering_3, col = "blue", type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty =1, bty = "n")
plot(mydf$Datetime, mydf$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "Datetime")
dev.off()

