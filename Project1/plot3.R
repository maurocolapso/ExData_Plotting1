## Plot 3 ##
household_power_consumption <- read.csv("~/Desktop/Data Analysis Coursera/household_power_consumption.txt", sep=";")
household_power_consumption$Date = as.Date(household_power_consumption$Date,"%d/%m/%Y") 
houselhold2007 <- subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")
houselhold2007$datetime = paste(houselhold2007$Date, houselhold2007$Time)
houselhold2007$datetime = strptime(houselhold2007$datetime,"%Y-%m-%d %H:%M:%S")

houselhold2007$Global_active_power = as.character(houselhold2007$Global_active_power)
houselhold2007$Global_active_power = as.numeric(houselhold2007$Global_active_power)

houselhold2007$Sub_metering_1 = as.character(houselhold2007$Sub_metering_1)
houselhold2007$Sub_metering_1 = as.numeric(houselhold2007$Sub_metering_1)

houselhold2007$Sub_metering_2 = as.character(houselhold2007$Sub_metering_2)
houselhold2007$Sub_metering_2 = as.numeric(houselhold2007$Sub_metering_2)

houselhold2007$Sub_metering_3 = as.character(houselhold2007$Sub_metering_3)
houselhold2007$Sub_metering_3 = as.numeric(houselhold2007$Sub_metering_3)

# Code plot
png(file = "plot3.png", width = 480, height = 480)

with(houselhold2007, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(houselhold2007, lines(datetime, Sub_metering_1))
with(houselhold2007, lines(datetime, Sub_metering_2, col = "red"))
with(houselhold2007, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))

dev.off() 
