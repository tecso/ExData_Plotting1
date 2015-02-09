# the read input code - only Feb 1-2 2007 wanted
# note skip doesn't count header row, and inpput starts row AFTER it
DF1 <- read.table("household_power_consumption.txt", sep = ";", 
                  quote="", header=TRUE, na.strings = "?",
                  skip= 66636, nrows= 2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                  colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
)

# convert dates and times from char to Date and POSIXlt by adding new columns
DF1$NewDate<-as.Date(DF1$Date, "%d/%m/%Y")
DF1$NewTime<-strptime(DF1$Time, "%H:%M:%S")

# plot 1 - a histogram of Global_active_power with 12 breaks
hist(DF1$Global_active_power,col="red",breaks=12,
             xlab="Global Active Power (kilowatts)", main="Global Active Power")
#write file and sign off
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()

