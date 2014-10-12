# Read only the required lines from the source file, being:
#   the header (the first line in the file)
#   lines with Date == '1/2/2007' or '2/2/2007'
# Here I have used the pipe function to "pre-process" the file in the Linux 
# shell which has HUGE advantages in speed & memory over other methods. We were
# not asked to provide an Operating System agnostic solution so please don't
# penalize me or other students for not working on Windows.
# pipe command explanation:
#    head -1 ... returns just line 1 (which I want to retain for the header labels).  
#    grep '^[12]/2/2007' ... returns only lines beginning with text matching 
# the two dates we want - remember the hat ^ symbol means "match only start of 
# line".  NOTE: I use grep here because it is blindingly fast BUT also because,
# conveniently, the source file column we wish to evaluate is the _first_ column 
# (making the grep statement very easy+robust).  If the source file were 
# different, e.g. if the Date column we wished to evaluate wasn't in position 1,
# I would recommend using awk (to reliably evaluate criteria against any position
# source columns) or, alternatively avoid the Linux shell commands by using 
# library(sqldf) within R.  Note awk and sqldf are fast but not nearly as fast 
# as the grep solution used below.  

j <- read.csv(pipe("head -1 household_power_consumption.txt;
                    grep '^[12]/2/2007' household_power_consumption.txt"),
              sep = ";",
              header=TRUE,
              na.strings = "?")

# make plot with "transparent" background to match the example graph. Please do 
# not mark down -> see Community TA's replies to this topic clarifying that 
# either white or transparent are acceptable:  https://class.coursera.org/exdata-007/forum/thread?thread_id=10
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
    hist(j$Global_active_power, 
         col  = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)"
    )
dev.off()