j <- read.csv(pipe("head -1 household_power_consumption.txt;
                    grep '^[12]/2/2007' household_power_consumption.txt"),
              sep = ";",
              header=TRUE,
              na.strings = "?")

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
    hist(j$Global_active_power, 
         col=rgb(red=251,green=0,blue=7, maxColorValue = 255),
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)"
    )
dev.off()