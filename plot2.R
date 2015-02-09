# You must install the sqldf package!!!
require(sqldf)

# read data, file must be in working directory
data <- read.csv.sql("household_power_consumption.txt", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

# convert data to date
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# open png file
png(file = "plot2.png")

# plot graph with appropriate labels
plot(x <- dados$Date, y <- dados$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close png file
dev.off()