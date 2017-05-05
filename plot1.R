
# Load the data file
dataFile <- "C:/Work/Repositories/Coursera/household_power_consumption.txt"
df <- read.table(dataFile,sep = ";",header = TRUE,na.strings = "?",as.is=TRUE)


# Convert the Date column to date format
df$newDate <- as.Date(df$Date, format="%d/%m/%Y")


#subset the data frane to get only the values fo "2007-02-01" and "2007-02-02"
subDF <- subset(df, newDate>=as.Date("2007-02-01") & df$newDate<=as.Date("2007-02-02"))


#Open a graphics device for storing the image
png(filename = "Plot1.png",
    width = 480, height = 480, units = "px")


#plots the histogram
hist(subDF$Global_active_power,
     xlab="Global Active Power (Kilowatts)",
     col="red",
     main = "GLobal Active Power"
     )


#Closes the graphic device
dev.off()
