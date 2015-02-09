

# the read input code. note skip doesn't count header row, and inpput starts row AFTER it
DF1 <- read.table("household_power_consumption.txt", sep = ";", 
                  quote="", header=TRUE, na.strings = "?",
                  skip= 66636, nrows= 2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                  colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
)

# convert dates and times by adding 2 new columns
DF1$NewDate<-as.Date(DF1$Date, "%d/%m/%Y")
DF1$NewTime<-strptime(DF1$Time, "%H:%M:%S")

# plot Global Active Power in a simple graph, but turn off the xaxis ticks 
plot(DF1$Global_active_power, type="l",xlab = "",
     ylab="Global Active Power (kilowatts)", xaxt="n")

# add revised xaxis
axis(1, at=c(10, 1440, 2880), lab=c("Thu","Fri","Sat"))

#write file and sign off
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()


# unused ideas
# x<-lapply(DF1, function(x) unique(x))
# x$NewDate
# [1] "2007-02-01" "2007-02-02"

# axis.Date(1, x$NewDate, format="%a", by="day")
#m_range<-c(0,nrow(DF1))

