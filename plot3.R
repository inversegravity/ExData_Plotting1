j <- read.csv(pipe("head -1 household_power_consumption.txt;
                    grep '^[12]/2/2007' household_power_consumption.txt"),
              sep = ";",
              header=TRUE,
              na.strings = "?")

j$DateTime <- strptime(paste(j$Date, j$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
    plot(j$DateTime, j$Sub_metering_1, type="l",
         xlab="", ylab = "Energy sub metering")
    lines(j$DateTime, j$Sub_metering_2, col="red")
    lines(j$DateTime, j$Sub_metering_3, col="blue")
    legend("topright", lty=1, legend = c("Sub_metering_1", 
                                         "Sub_metering_2", 
                                         "Sub_metering_3"),
           col=c("black","red","blue")
    )
dev.off()