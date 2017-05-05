
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
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")

#Plot the line
plot(subDF$Global_active_power,
     type = "l",
     ylab="Global Active Power (Kilowatts)",
     xlab="",
     xaxt='n'
     )


#Add the ticks
axis(side=1,xlab="", labels=c("Thu", "Fri" ,"Sat"), at=ticks) 


#Closes the graphic device
dev.off()


