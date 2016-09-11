#Function to make plot 1

#Read in text file of household power consumption
hpc = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#Subet to correct two days
hpc_subset <- hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]

#Save as png file
png("plot1.png")
#Create histogram
hist(as.numeric(as.character(hpc_subset$Global_active_power)),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = paste("Global Active Power"),
     col = "red"
)
dev.off()