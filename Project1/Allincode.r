data<-read.delim("household_power_consumption.txt", sep = ";")
newtime<-paste(data$Date, data$Time)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, " %H:%M:%S")
 
data$Date<-strptime(newtime, "%d/%m/%Y %H:%M:%S")
#data[,3:9]<-as.numeric(as.character(data[,3:9]))
 
reduced<-data[data$Date>"2007-02-01" & data$Date<"2007-02-03",]
for (i in 3:9)
{
  reduced[,i]<-as.numeric(as.character(reduced[,i]))
}
 
#plot 1
hist(reduced$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
 
#plot 2
plot(reduced$Date, reduced$Global_active_power,
     ylab="Global Active Power (kilowatts)", type="l" )
 
#plot 3
plot(reduced$Date, reduced$Sub_metering_1,
     ylab="Energy sub metering", type="l", xlab="" )
lines(reduced$Date, reduced$Sub_metering_2, col="red")
lines(reduced$Date, reduced$Sub_metering_3, col="blue")
colors<-c("black", "red", 'blue')
legend(x=strptime("2007-02-02  6:00:00", "%Y-%m-%d %H:%M:%S"), y=39,
       legend=names(reduced)[7:9], col=colors, lwd=2)
 
#plot 4
par(mfrow=c(2,2))
plot(reduced$Date, reduced$Global_active_power,
     ylab="Global Active Power (kilowatts)", type="l" )
 
 
plot(reduced$Date, reduced$Voltage,
     ylab="Voltage", xlab="datetime", type="l" )
 
plot(reduced$Date, reduced$Sub_metering_1,
     ylab="Energy sub metering", type="l", xlab="" )
lines(reduced$Date, reduced$Sub_metering_2, col="red")
lines(reduced$Date, reduced$Sub_metering_3, col="blue")
colors<-c("black", "red", 'blue')
legend(x=strptime("2007-02-01  12:00:00", "%Y-%m-%d %H:%M:%S"), y=39,
       legend=names(reduced)[7:9], col=colors, lwd=2, bty="n")
 
plot(reduced$Date, reduced$Global_reactive_power, type="l" )
