epFullData <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

epFullData$DateTime <- strptime(paste(epFullData$Date, epFullData$Time), "%d/%m/%Y %H:%M:%S")

epSubsetData <- subset(epFullData, 
                 as.Date(DateTime) >= as.Date("2007-02-01") & 
                     as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot2.png", height=480, width=480)
plot(epSubsetData$DateTime, 
     epSubsetData$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(epSubsetData$DateTime, epSubsetData$Global_active_power)

dev.off()







