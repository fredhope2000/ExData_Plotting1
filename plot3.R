data <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character",rep("numeric",7)),na.strings="?")
feb1st <- strptime("2007-02-01",format="%Y-%m-%d")
feb2nd <- strptime("2007-02-02",format="%Y-%m-%d")
data <- data[strptime(data$Date,format="%d/%m/%Y") >= feb1st,]
data <- data[strptime(data$Date,format="%d/%m/%Y") <= feb2nd,]

data$NewDate <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot3.png")
with(data,plot(NewDate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,points(NewDate,Sub_metering_2,col="red",type="l"))
with(data,points(NewDate,Sub_metering_3,col="blue",type="l"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
