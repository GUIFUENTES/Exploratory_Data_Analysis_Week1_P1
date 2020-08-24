##PLOT 1 - GLOBAL ACTIVE POWER

#cargar libreria
library(data.table)
setwd("C:/Users/FUENTES BARRERA/Documents/GAFB/Cousera/Data Science - Coursera/Course 4 - Exploratory Data Analysis/Week 1/project")
## create a new table "elect_power" from .txt file
elect_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Give names 
names(elect_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                        "Sub_metering_2","Sub_metering_3")
##Period  2007-02-01 and 2007-02-02
subelect_power <- subset(elect_power,elect_power$Date=="1/2/2007" | elect_power$Date =="2/2/2007")

png("plot1.png", width=480, height=480)

##plot function
hist(as.numeric(as.character(subelect_power$Global_active_power)),col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

##Title "Global Active Power"
title(main="Global Active Power")

dev.off()

##PLOT 2 - "Global Active Power Vs Time"

#Load library

library(data.table)
setwd("C:/Users/FUENTES BARRERA/Documents/GAFB/Cousera/Data Science - Coursera/Course 4 - Exploratory Data Analysis/Week 1/project")
## create a new table "elect_power" from .txt file
elect_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Give names 
names(elect_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                        "Sub_metering_2","Sub_metering_3")
##Period  2007-02-01 and 2007-02-02
subelect_power <- subset(elect_power,elect_power$Date=="1/2/2007" | elect_power$Date =="2/2/2007")

##
png("plot2.png", width=480, height=480)

##Transforming the data and time vbles object of date and position

subelect_power$Date <- as.Date(subelect_power$Date, format="%d/%m/%Y")
subelect_power$Time <- strptime(subelect_power$Time, format="%H:%M:%S")
subelect_power[1:1440,"Time"] <- format(subelect_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subelect_power[1441:2880,"Time"] <- format(subelect_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Plot function
plot(subelect_power$Time,as.numeric(as.character(subelect_power$Global_active_power)),type="l",xlab=""
     ,ylab="Global Active Power (kilowatts)")

##Title 
title(main="Global Active Power Vs Time")

dev.off()

##PLOT 3

library(data.table)

setwd("C:/Users/FUENTES BARRERA/Documents/GAFB/Cousera/Data Science - Coursera/Course 4 - Exploratory Data Analysis/Week 1/project")

## create a new table "elect_power" from .txt file
elect_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Give names 
names(elect_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                        "Sub_metering_2","Sub_metering_3")
##Period  2007-02-01 and 2007-02-02
subelect_power <- subset(elect_power,elect_power$Date=="1/2/2007" | elect_power$Date =="2/2/2007")

##
png("plot3.png", width=480, height=480)

##Transforming the data and time vbles object of date and position

subelect_power$Date <- as.Date(subelect_power$Date, format="%d/%m/%Y")
subelect_power$Time <- strptime(subelect_power$Time, format="%H:%M:%S")
subelect_power[1:1440,"Time"] <- format(subelect_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subelect_power[1441:2880,"Time"] <- format(subelect_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Plotting function
plot(subelect_power$Time,subelect_power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Graph title
title(main="Energy sub-metering")

dev.off()

##PLOT 4

library(data.table)

setwd("C:/Users/FUENTES BARRERA/Documents/GAFB/Cousera/Data Science - Coursera/Course 4 - Exploratory Data Analysis/Week 1/project")

## create a new table "elect_power" from .txt file
elect_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Give names 
names(elect_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                        "Sub_metering_2","Sub_metering_3")
##Period  2007-02-01 and 2007-02-02
subelect_power <- subset(elect_power,elect_power$Date=="1/2/2007" | elect_power$Date =="2/2/2007")

##
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

##Transforming the data and time vbles object of date and position

subelect_power$Date <- as.Date(subelect_power$Date, format="%d/%m/%Y")
subelect_power$Time <- strptime(subelect_power$Time, format="%H:%M:%S")
subelect_power[1:1440,"Time"] <- format(subelect_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subelect_power[1441:2880,"Time"] <- format(subelect_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Plotting function for 4 plots
with(subelect_power,{
  plot(subelect_power$Time,as.numeric(as.character(subelect_power$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subelect_power$Time,as.numeric(as.character(subelect_power$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subelect_power$Time,subelect_power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subelect_power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subelect_power$Time,as.numeric(as.character(subelect_power$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()