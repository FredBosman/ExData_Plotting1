source("getdata.R")

# get the data
plot2data <- getdata()

# open PNG device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# draw the plot area
with(plot2data,plot(Timestamp, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))

# add the line
with(plot2data, lines(Timestamp, Global_active_power))

# close device
dev.off()

