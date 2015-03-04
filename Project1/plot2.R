##--------------------------------------------------------
# Mauro Pazmino
# 2 March, 2015
# Exploratory Data Analysis
# Porject 1
# Plot 2
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

# Code plot
png(file = "plot2.png", width = 480, height = 480)
with(houselhold2007, plot(datetime,Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(houselhold2007, lines(datetime, Global_active_power))

dev.off()
