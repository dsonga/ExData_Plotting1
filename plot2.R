

url1<- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url1,"./hpc.zip")
unzip("./hpc.zip")


data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(data$DateTime,data$Global_active_power, type="l",col="black", xlab="", ylab="Global Active Power (kilowatts)", main="")
dev.off()
