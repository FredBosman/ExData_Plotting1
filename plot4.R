source("getdata.R")

# get the data
plot4data <- getdata()

# open PNG device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# set the par()
par(mfcol = c(2, 2))

# first plot
# draw the plot area
with(plot4data,plot(Timestamp, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
# add the line
with(plot4data, lines(Timestamp, Global_active_power))

# second plot
# draw the plot area
with(plot4data,plot(Timestamp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
# draw the lines
with(plot4data, lines(Timestamp, Sub_metering_1, col = "black"))
with(plot4data, lines(Timestamp, Sub_metering_2, col = "red"))
with(plot4data, lines(Timestamp, Sub_metering_3, col = "blue"))
# add legend
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# third plot
# draw the plot area
with(plot4data,plot(Timestamp, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
# add the line
with(plot4data, lines(Timestamp, Voltage))


# fourth plot
# draw the plot area
with(plot4data,plot(Timestamp, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"))
# add the line
with(plot4data, lines(Timestamp, Global_reactive_power))


# close device
dev.off()

