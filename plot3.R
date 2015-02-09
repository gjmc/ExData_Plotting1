# You must install the sqldf package!!!
require(sqldf)

# read data, file must be in working directory
data <- read.csv.sql("household_power_consumption.txt", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

# convert data to date
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# open png file
png(file = "plot3.png")

# plot graph with appropriate labels
plot(x <- data$Date, y <- data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x <- data$Date, y <- data$Sub_metering_2, col = "red")
lines(x <- data$Date, y <- data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close png file
dev.off()