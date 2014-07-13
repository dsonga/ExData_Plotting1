
 
url1<- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url1,"./hpc.zip")
unzip("./hpc.zip")


data <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880, na.strings = "?", header=F,sep=";")                                  
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

Png(filename="plot1.png", width=480, height=480)

hist(data$Global_active_power, col="#ff2500",xlab="Global Active Power (kilowatts)", main="Global Active Power")
                    
plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()