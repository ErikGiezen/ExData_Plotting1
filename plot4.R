#Exploratory Data Analysis Wk1 plot4

# read the file
hopoco <- read.table("household_power_consumption.txt", dec=".", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# convert Date tot date class
hopoco$Date = as.Date(hopoco$Date, format="%d/%m/%Y")

# select between 2007-02-01 and 2007-02-02
hopoco_sub = hopoco[hopoco$Date >= as.Date("2007-02-01") & hopoco$Date<=as.Date("2007-02-02"),]

# creating timestamp
hopoco_sub$timestamp <- as.POSIXct(paste(hopoco_sub$Date, hopoco_sub$Time), format="%Y-%m-%d %H:%M:%S")

# making the plot
par(mfcol=c(2,2))
png(file="plot4.png",width=480,height=480)

plot(hopoco_sub$timestamp, hopoco_sub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(hopoco_sub$timestamp, hopoco_sub$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = "")
lines(hopoco_sub$timestamp, hopoco_sub$Sub_metering_2 ,col="Red")
lines(hopoco_sub$timestamp, hopoco_sub$Sub_metering_3 ,col="Blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

plot(hopoco_sub$timestamp, hopoco_sub$Voltage, type = "l", ylab = "voltage", xlab = "datetime")

plot(hopoco_sub$timestamp, hopoco_sub$Global_reactive_power, type = "l", ylab= "Global_reactive_power", xlab = "datetime")

#don't forget
dev.off()
