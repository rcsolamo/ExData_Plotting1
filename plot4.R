## The 'plot4' contains a function that creates four (4) graphs.
## 
## Details of each function can be found below.
##
## Author: Ma. Rowena C. Solamo
##
## This is a partial requirement to the Exploratory Analysis Course in coursera.org
## dated May 5 - June 2, 2014 Session under the guidance of Prof. Roger D. Peng,
## Johns Hopkins Bloomberg School of Public.
##
## The course is part of the Data Science Specialization found in coursera.org.
##
## TO DO LIST:
## TODO (rcsolamo) : provide comments

## The 'plot4()' function generates the four (4) graphs of the programming
## assignments.  They are:
##   1.) Global Active Power (Graph 2 of programming assignment)
##   2.) Voltage vs. datetime (new graph)
##   3.) Energy Submetering (Graph 3 of the programming assignment)
##   4.) Global Active Power (noisy)
plot4 <- function(){
     # 1. read data with dates 2007-02-01 to 2007-02-02
     #    the data has be pre-processed from the household_power_consumption.txt
     #    file to make the generation of the graph faster.
     theData <- getCleanData()
     
     # 2. Open the device- png- to which the graph is printed.
     #    We used png rather than dev.copy to ensure that it
     #    will fit the specified dimension of the file.
     png(file = "plot4.png", width=480, height=480, units="px")
     
     # 3. Setting Global Parameter for plot     
     par(mar=c(5,5,2,2), mfrow=c(2,2))
     x <- strptime(paste(theData$Date,theData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

     # 4. Plot the graphs
     # 4.1 Generating the graph for Global Active Power vs. DateTime
     yGlobalActivePower <- theData$Global_active_power
     plot(x, yGlobalActivePower, pch=".", ylab="Global Active Power(kilowatts)", xlab="")
     lines(x, yGlobalActivePower)

     # 4.2 Generating the graph for Voltage vs DateTime
     yVoltage <- theData$Voltage
     plot(x, yVoltage, pch=".", ylab="Voltage", xlab="datetime")
     lines(x, yVoltage)

     # 4.3 Generating the graph for the Energy Submetering
     ySubmetering1 <- theData$Sub_metering_1
     ySubmetering2 <- theData$Sub_metering_2
     ySubmetering3 <- theData$Sub_metering_3
     plot(x, ySubmetering1, pch=".", col="black",ylab="Energy sub metering",xlab="")
     lines(x, ySubmetering1)
     points(x, ySubmetering2, pch=".", col="red")
     lines(x, ySubmetering2, col="red")
     points(x, ySubmetering3, pch=".", col="blue")
     lines(x,ySubmetering3, col="blue")
     legend("topright", pch="-", col=c("black", "red","blue"), 
          legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

     # 4.4 Global Active Power vs. datetime
     yGlobalReactivePower <- theData$Global_reactive_power
     plot(x, yGlobalReactivePower, pch=".", xlab="datetime", ylab="Global_reactive_power")
     lines(x, yGlobalReactivePower)
     
     # 5. Turn off the device.
     dev.off()
}

## The 'getCleanData()' function reads the February 2007 data, which was pre-processed
## by the extractData() function for faster processing, into a table called theData
## which will be used by the plot1() function.
getCleanData <- function(){
     theData <- read.table("HPC2007.txt", header=TRUE, sep=";",na.strings="?")
}