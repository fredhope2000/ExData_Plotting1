data <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")
feb1st <- strptime("2007-02-01",format="%Y-%m-%d")
feb2nd <- strptime("2007-02-02",format="%Y-%m-%d")
data <- data[strptime(data$Date,format="%d/%m/%Y") >= feb1st,]
data <- data[strptime(data$Date,format="%d/%m/%Y") <= feb2nd,]

png(filename="plot1.png")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
