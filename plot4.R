plot4 <- function(){
        library(data.table)
        filename <- "household_power_consumption.txt"
        dt <- data.table(read.table(filename, header = TRUE, sep = ";", na="?"))
        dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
	dt$Time <- as.POSIXct(paste(dt$Date, dt$Time))
        startDate <- "2007-02-01"
        endDate <- "2007-02-02"
        dt <- dt[Date>=startDate & Date<=endDate]
	par(mfcol = c(2, 2))
	plot(dt$Time,dt$Global_active_power, ylab = "Global Active Power", xlab="", type="l")
        plot(dt$Time,dt$Sub_metering_1, ylab = "Energy sub mettering", xlab="", type="l")
	points(dt$Time,dt$Sub_metering_2,col="red",type="l")
        points(dt$Time,dt$Sub_metering_3,col="blue",type="l")
	legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
	plot(dt$Time,dt$Voltage, ylab = "Voltage", xlab="datetime", type="l")
	plot(dt$Time,dt$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type="l")
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
}

