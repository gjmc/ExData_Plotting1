# You must install the sqldf package!!!
require(sqldf)

# read data, file must be in working directory
data <- read.csv.sql("household_power_consumption.txt", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

# convert data to date
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# open png file
png(file = "plot4.png")

# plot graph with appropriate labels
par(mfrow = c(2,2))
with(dados, {
  plot(x <- data$Date, y <- data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x <- data$Date, y <- data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x <- data$Date, y <- data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x <- data$Date, y <- data$Sub_metering_2, col = "red")
  lines(x <- data$Date, y <- data$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(x <- data$Date, y <- data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Close png file
dev.off()