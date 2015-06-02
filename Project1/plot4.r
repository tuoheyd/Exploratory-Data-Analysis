data<-read.delim("household_power_consumption.txt", sep = ";", colClasses= "character")

#combine the date and time together and create a R time class
newtime<-paste(data$Date, data$Time)
data$Date<-strptime(newtime, "%d/%m/%Y %H:%M:%S")

#free up memory
rm("newtime")
 
#subset to the desired time window
reduced<-data[data$Date>"2007-02-01" & data$Date<"2007-02-03",]
for (i in 3:9)
{
   reduced[,i]<-as.numeric(reduced[,i])
}
print("Completed Data input")

#plot 4 - 2x2 plots
png(filename = "plot4.png", width = 480, height = 480)
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
dev.off() 