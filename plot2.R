#Function to make plot 2

#Read in text file of household power consumption
hpc = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subet to correct two days
hpc_subset <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]

#Get global active power
gap <- as.numeric(as.character(hpc_subset$Global_active_power))

#Generate timestamp from Time and Date columns
ts <- as.POSIXct(paste(paste(hpc_subset$Date, hpc_subset$Time)), format="%d/%m/%Y %H:%M:%S")

#Save as png
png("plot2.png")
plot(ts,gap,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)
dev.off()