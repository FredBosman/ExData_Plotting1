source("getdata.R")

# get the data
plot1data <- getdata()

# open PNG device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# plot the histogram
hist(plot1data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close device
dev.off()

