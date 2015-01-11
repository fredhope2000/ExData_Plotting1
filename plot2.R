data <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")
feb1st <- strptime("2007-02-01",format="%Y-%m-%d")
feb2nd <- strptime("2007-02-02",format="%Y-%m-%d")
data <- data[strptime(data$Date,format="%d/%m/%Y") >= feb1st,]
data <- data[strptime(data$Date,format="%d/%m/%Y") <= feb2nd,]

data$NewDate <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
with(data,plot(NewDate,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
