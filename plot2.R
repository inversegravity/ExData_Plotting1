j <- read.csv(pipe("head -1 household_power_consumption.txt;
                    grep '^[12]/2/2007' household_power_consumption.txt"),
              sep = ";",
              header=TRUE,
              na.strings = "?")

j$DateTime <- strptime(paste(j$Date, j$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
    plot(j$DateTime, j$Global_active_power, type="l", 
         xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()