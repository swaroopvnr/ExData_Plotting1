epFullData <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

epFullData$DateTime <- strptime(paste(epFullData$Date, epFullData$Time), "%d/%m/%Y %H:%M:%S")

epSubsetData <- subset(epFullData, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                     as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

#1
plot(epSubsetData$DateTime, 
     epSubsetData$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(epSubsetData$DateTime, epSubsetData$Global_active_power)

#2
plot(epSubsetData$DateTime, epSubsetData$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(epSubsetData$DateTime, epSubsetData$Voltage)

#3
plot(epSubsetData$DateTime, 
     epSubsetData$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(epSubsetData$DateTime, epSubsetData$Sub_metering_1, col='black')
lines(epSubsetData$DateTime, epSubsetData$Sub_metering_2, col='red')
lines(epSubsetData$DateTime, epSubsetData$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

#4
with(epSubsetData, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(epSubsetData, lines(DateTime, Global_reactive_power))

dev.off()