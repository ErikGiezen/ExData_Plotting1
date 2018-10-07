#Exploratory Data Analysis Wk1 plot1

# read the file
hopoco <- read.table("household_power_consumption.txt", dec=".", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# convert Date tot date class
hopoco$Date = as.Date(hopoco$Date, format="%d/%m/%Y")

# select between 2007-02-01 and 2007-02-02
hopoco_sub = hopoco[hopoco$Date >= as.Date("2007-02-01") & hopoco$Date<=as.Date("2007-02-02"),]

# making the histogram
png(file="plot1.png",width=480,height=480)
hist(hopoco_sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

#don't forget
dev.off()
