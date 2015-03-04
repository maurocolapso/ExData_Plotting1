##--------------------------------------------------------
# Mauro Pazmino
# 3 March, 2015
# Exploratory Data Analysis
# Porject 1
# Plot 1
#--------------------------------------------------------

# Reset R's brain
rm(list=ls())

# Set wroking directory
setwd("~/Desktop/R programming/ExploratoryDataAnalysis/Project1")

# Read, subset and format data

household_power_consumption <- read.csv("~/Desktop/Data Analysis Coursera/household_power_consumption.txt", sep=";")
household_power_consumption$Date = as.Date(household_power_consumption$Date,"%d/%m/%Y") 
houselhold2007 <- subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")
houselhold2007$datetime = paste(houselhold2007$Date, houselhold2007$Time)
houselhold2007$datetime = strptime(houselhold2007$datetime,"%Y-%m-%d %H:%M:%S")

houselhold2007$Global_active_power = as.character(houselhold2007$Global_active_power)
houselhold2007$Global_active_power = as.numeric(houselhold2007$Global_active_power)

houselhold2007$Global_reactive_power = as.character(houselhold2007$Global_reactive_power)
houselhold2007$Global_reactive_power = as.numeric(houselhold2007$Global_reactive_power)

houselhold2007$Sub_metering_1 = as.character(houselhold2007$Sub_metering_1)
houselhold2007$Sub_metering_1 = as.numeric(houselhold2007$Sub_metering_1)

houselhold2007$Sub_metering_2 = as.character(houselhold2007$Sub_metering_2)
houselhold2007$Sub_metering_2 = as.numeric(houselhold2007$Sub_metering_2)

houselhold2007$Sub_metering_3 = as.character(houselhold2007$Sub_metering_3)
houselhold2007$Sub_metering_3 = as.numeric(houselhold2007$Sub_metering_3)

houselhold2007$Voltage = as.character(houselhold2007$Voltage)
houselhold2007$Voltage = as.numeric(houselhold2007$Voltage)


# Code plot

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(houselhold2007, plot(datetime,Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(houselhold2007, lines(datetime, Global_active_power))

with(houselhold2007, plot(datetime, Voltage, type = "n"))
with(houselhold2007, lines(datetime, Voltage))

with(houselhold2007, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(houselhold2007, lines(datetime, Sub_metering_1))
with(houselhold2007, lines(datetime, Sub_metering_2, col = "red"))
with(houselhold2007, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))

with(houselhold2007, plot(datetime,Global_reactive_power, type = "n"))
with(houselhold2007, lines(datetime, Global_reactive_power))

dev.off()
