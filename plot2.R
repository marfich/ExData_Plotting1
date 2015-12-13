plot2 <- function(){
        library(data.table)
        filename <- "household_power_consumption.txt"
        dt <- data.table(read.table(filename, header = TRUE, sep = ";", na="?"))
        dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
	dt$Time <- as.POSIXct(paste(dt$Date, dt$Time))
        startDate <- "2007-02-01"
        endDate <- "2007-02-02"
        dt <- dt[Date>=startDate & Date<=endDate]
        plot(dt$Time,dt$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}

