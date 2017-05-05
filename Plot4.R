
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
png(filename = "Plot4.png", width = 480, height = 480, units = "px")


#Create a two by two matrix of plots
par(mfrow=c(2,2))


#First Graph -------------------------------------------------
plot(subDF$Global_active_power,
     type = "l",
     ylab="Global Activity Power",
     xlab="",
     xaxt='n'
)
axis(side=1,xlab="", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 


#Second Graph -------------------------------------------------
plot(subDF$Voltage,
     type = "l",
     ylab="Voltage",
     xlab="datetime",
     xaxt='n'
)
axis(side=1,xlab="datetime", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 
#-------------------------------------------------------------


#Third Graph--------------------------------------------------
plot(subDF$Sub_metering_1,
     type = "l",
     ylab="Energy sub metering",
     xlab="",
     xaxt='n'
)
lines(as.numeric(subDF$Sub_metering_2), col="Red")
lines(as.numeric(subDF$Sub_metering_3), col="Blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"), lty=1, cex=0.8)
axis(side=1,xlab="", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 
#-------------------------------------------------------------


#Fourth Graph------------------------------------------------
plot(subDF$Global_reactive_power,
     type = "l",
     xlab="datetime",
     ylab="Global_reactive_power",
     xaxt='n'
)
subs = nrow(subset(subDF,newDate==as.Date("2007-02-01")))
axis(side=1,xlab="datetime", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 
#-------------------------------------------------------------


#Close the graphics device
dev.off()