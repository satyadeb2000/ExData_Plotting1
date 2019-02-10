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


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()