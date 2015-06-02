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

#plot 1 - histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(reduced$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 
