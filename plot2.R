#Declare hpc file location
hpc_file <- "C:/Cousera/Data Sciences/Data Visualization/household_power_consumption.txt"

#Create hpc data table
hpc_dt <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create hpc subset data table
hpc_dt_subset <- hpc_dt[hpc_dt$Date %in% c("1/2/2007","2/2/2007") ,]

#Create timestamp structure, convert Global_active_power to numeric
hpc_date_time <- strptime(paste(hpc_dt_subset$Date, hpc_dt_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(hpc_dt_subset$Global_active_power)

#Create png plot with hpc_date_time, Global_active_power
png("plot2.png", width=480, height=480)
plot(hpc_date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()