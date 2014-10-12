j <- read.csv(pipe("head -1 household_power_consumption.txt;
                    grep '^[12]/2/2007' household_power_consumption.txt"),
              sep = ";",
              header=TRUE,
              na.strings = "?")

j$DateTime <- strptime(paste(j$Date, j$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

    par(mfrow = c(2,2))

    plot(j$DateTime, j$Global_active_power, type="l", 
         xlab="", ylab = "Global Active Power"
    )
    
    plot(j$DateTime, j$Voltage, type="l", 
         ylab = "Voltage", xlab = "datetime")
    
    plot(j$DateTime, j$Sub_metering_1, type="l",
         xlab="", ylab = "Energy sub metering")
    lines(j$DateTime, j$Sub_metering_2, col="red")
    lines(j$DateTime, j$Sub_metering_3, col="blue")
    legend("topright", lty=1, legend = c("Sub_metering_1", 
                                         "Sub_metering_2", 
                                         "Sub_metering_3"),
           col=c("black","red","blue"),
           bty="n"
    )
    
    plot(j$DateTime, j$Global_reactive_power, type="l", 
         ylab = "Global_reactive_power", xlab = "datetime")
dev.off()