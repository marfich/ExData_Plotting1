plot3 <- function(){
        library(data.table)
        filename <- "household_power_consumption.txt"
        dt <- data.table(read.table(filename, header = TRUE, sep = ";", na="?"))
        dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
	dt$Time <- as.POSIXct(paste(dt$Date, dt$Time))
        startDate <- "2007-02-01"
        endDate <- "2007-02-02"
        dt <- dt[Date>=startDate & Date<=endDate]
        plot(dt$Time,dt$Sub_metering_1, ylab = "Energy sub mettering", xlab="", type="l")
	points(dt$Time,dt$Sub_metering_2,col="red",type="l")
        points(dt$Time,dt$Sub_metering_3,col="blue",type="l")
	legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
}

