#Function to make plot 3

#Read in text file of household power consumption
hpc = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subet to correct two days
hpc_subset <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]

#Get sub metering data
sub1 <- as.numeric(as.character(hpc_subset$Sub_metering_1))
sub2 <- as.numeric(as.character(hpc_subset$Sub_metering_2))
sub3 <- as.numeric(as.character(hpc_subset$Sub_metering_3))

#Generate timestamps from date and time columns
ts <- as.POSIXct(paste(paste(hpc_subset$Date, hpc_subset$Time)), format="%d/%m/%Y %H:%M:%S")

#Save as ping
png("plot3.png")
#Generate plot
plot(ts,sub1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)
#Add sub metering 2 and 3
lines(ts,sub2, col="red")
lines(ts,sub3, col="blue")
#add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col = c("black","red","blue"))
dev.off()