plot1 <- function(){
	library(data.table)
	filename <- "household_power_consumption.txt"
	dt <- data.table(read.table(filename, header = TRUE, sep = ";", na="?"))
	dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
	startDate <- "2007-02-01"
	endDate <- "2007-02-02"
	dt <- dt[Date>=startDate & Date<=endDate]
	hist(dt$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
	dev.copy(png, file="plot1.png", width=480, height=480)
	dev.off()
}
