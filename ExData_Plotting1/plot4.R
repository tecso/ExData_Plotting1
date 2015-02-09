# the read input code. note skip doesn't count header row, and inpput starts row AFTER it
DF1 <- read.table("household_power_consumption.txt", sep = ";", 
                  quote="", header=TRUE, na.strings = "?",
                  skip= 66636, nrows= 2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                  colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
)

# convert dates and times
# an idea
as.POSIXct(paste(y, x), format="%d-%m-%Y %H:%M:%S")

# plot 4 - multiplot / 4
par(mfrow=c(2,2))

# plot Global Active Power in a simple graph, but turn off the xaxis ticks 
plot(DF1$Global_active_power, type="l",xlab = "",
     ylab="Global Active Power (kilowatts)", xaxt="n")
# add revised xaxis
axis(1, at=c(10, 1440, 2880), lab=c("Thu","Fri","Sat"))

# plot voltage
plot(DF1$Voltage, type="l", xlab = "datetime", ylab="Voltage", xaxt="n")
# add revised xaxis
axis(1, at=c(10, 1440, 2880), lab=c("Thu","Fri","Sat"))

# plot Sub_metering_1;Sub_metering_2;Sub_metering_3 in one multicolor graph
plot(DF1$Sub_metering_1, type="l",xlab = "", ylab="Energy sub metering", xaxt="n")
lines(DF1$Sub_metering_2, type="l",xlab = "", ylab="Energy sub metering", xaxt="n", col="red")
lines(DF1$Sub_metering_3, type="l",xlab = "", ylab="Energy sub metering", xaxt="n", col="blue")
# add revised xaxis
axis(1, at=c(10, 1440, 2880), lab=c("Thu","Fri","Sat"))
# add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"), lty=c(1,1,1), cex = 0.3, box.col=NA)

# plot Global_reactive_power
plot(DF1$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power", xaxt="n")
# add revised xaxis
axis(1, at=c(10, 1440, 2880), lab=c("Thu","Fri","Sat"))

#write file and sign off
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()




