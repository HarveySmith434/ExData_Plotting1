#Declare hpc file location
hpc_file <- "C:/Cousera/Data Sciences/Data Visualization/household_power_consumption.txt"

#Create hpc data table
hpc_dt <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create hpc subset data table
hpc_dt_subset <- hpc_dt[hpc_dt$Date %in% c("1/2/2007","2/2/2007") ,]

#Create timestamp structure, convert Sub_metering_1, Sub_metering_2, Sub_metering_3 to numeric
hpc_date_time <- strptime(paste(hpc_dt_subset$Date, hpc_dt_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(hpc_dt_subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(hpc_dt_subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(hpc_dt_subset$Sub_metering_3)
 
#Create png plot with hpc_date_time, Sub_metering_1, Sub_metering_2, Sub_metering_3
png("plot3.png", width=480, height=480)
plot(hpc_date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(hpc_date_time, Sub_metering_2, type="l", col="red")
lines(hpc_date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()