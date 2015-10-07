getdata <- function () {
	# check if data directory exists
	if (!file.exists("data")) {
	    # create dir
	    dir.create("data")
	}

  # check if file is downloaded and unzipped
	if (!file.exists("data/household_power_consumption.txt")) {
		# download file
		fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file(fileUrl, destfile = "./data/household_power_consumption.zip")

		# save download date
		dateDownloaded <- date()

		# unzip dataset
		unzip("./data/household_power_consumption.zip", exdir = "./data/")
	}
	
  # check if subset exists
  if (!file.exists("data/household_power_consumption_subset.txt")) {
    # read data
    consumptionAll <- read.csv("./data/household_power_consumption.txt", sep = ";")
    
    # create subset
    consumptionSub <- consumptionAll[(consumptionAll$Date == "1/2/2007" | consumptionAll$Date == "2/2/2007"),]
    
    # free memory
    rm(consumptionAll)
    
    #write subset to file
    write.table(consumptionSub, file="./data/household_power_consumption_subset.txt", sep = ";", row.names = FALSE, col.names = TRUE)
  }
  else {
    # read data
    consumptionSub <- read.csv("./data/household_power_consumption_subset.txt", sep = ";")
  }

	# convert Date and Time
	#consumptionSub$Date <- as.Date(consumptionSub$Date, "%d/%m/%Y")
	#consumptionSub$Time <- strptime(consumptionSub$Time , "%H:%M:%S")
	consumptionSub$Timestamp <- with(consumptionSub, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
  

	# return subset
	consumptionSub
}


