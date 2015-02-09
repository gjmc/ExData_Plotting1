# You must install the sqldf package!!!
require(sqldf)

# read data
data <- read.csv.sql("file"household_power_consumption.txt"", header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

# open png file
png(file = "plot1.png")

#plot histogram with appropriate labels
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close png file
dev.off()