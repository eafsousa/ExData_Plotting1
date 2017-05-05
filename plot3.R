
# Load the data file
dataFile <- "C:/Work/Repositories/Coursera/household_power_consumption.txt"
df <- read.table(dataFile,sep = ";",header = TRUE,na.strings = "?",as.is=TRUE)


# Convert the Date column to date format
df$newDate <- as.Date(df$Date, format="%d/%m/%Y")


#subset the data frane to get only the values fo "2007-02-01" and "2007-02-02"
subDF <- subset(df, newDate>=as.Date("2007-02-01") & df$newDate<=as.Date("2007-02-02"))


# to get the ticks, subset the rows where date = "2007-02-01" 
# the value will correspond to the first row where date = 007-02-02 
# use this value for placing the "Fri" tick
friTick = nrow(subset(subDF,newDate==as.Date("2007-02-01")))


#place the sat tick on the last value
ticks <- c(0,friTick,nrow(subDF))


#Open a graphics device for storing the image
png(filename = "Plot3.png",
    width = 480, height = 480, units = "px")


#Plot the first line
plot(as.numeric(subDF$Sub_metering_1),
     type = "l",
     ylab="Energy sub metering",
     xlab="",
     xaxt='n'
)
#Plot the second line
lines(as.numeric(subDF$Sub_metering_2), col="Red")


#Plot the third line
lines(as.numeric(subDF$Sub_metering_3), col="Blue")


#Add the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"), lty=1, cex=0.8)


#Add the ticks
axis(side=1,xlab="", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 


#Close the graphics device
dev.off()
