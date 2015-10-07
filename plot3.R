source("getdata.R")

# get the data
plot3data <- getdata()

# open PNG device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# draw the plot area
with(plot3data,plot(Timestamp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))

# draw the lines
with(plot3data, lines(Timestamp, Sub_metering_1, col = "black"))
with(plot3data, lines(Timestamp, Sub_metering_2, col = "red"))
with(plot3data, lines(Timestamp, Sub_metering_3, col = "blue"))

# add legend
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# close device
dev.off()

