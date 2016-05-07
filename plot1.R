#Declare hpc file location
hpc_file <- "C:/Cousera/Data Sciences/Data Visualization/household_power_consumption.txt"

#Create hpc data table
hpc_dt <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Create hpc subset data table
hpc_dt_subset <- hpc_dt[hpc_dt$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert Global_active_power to numeric
Global_active_power <- as.numeric(hpc_dt_subset$Global_active_power)

#Create png histogram with Global_active_power
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()