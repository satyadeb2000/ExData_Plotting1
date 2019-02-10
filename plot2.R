destfilename <- "dataset.zip"
setwd("/Users/satyabratamajumder/Documents/datascience/Exploratory Analysis/Week 1/Assignment/Results")
## Download and unzip the dataset:
if (!file.exists(destfilename)){
  sourceURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(sourceURL, destfilename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(destfilename) 
}

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$DateTime <- as.POSIXct(paste(as.Date(data1$Date), data1$Time))


plot(data1$Global_active_power~data1$DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()