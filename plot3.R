## The 'plot3' contains a function to create the line graphs for three
## Submetering data vs. date and time
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


## The 'plot3()' function generates the third graph of the assignment which 
## consists of line graphs for the three submettring data.
plot3 <- function(){
     # 1. read data with dates 2007-02-01 to 2007-02-02
     #    the data has be pre-processed from the household_power_consumption.txt
     #    file to make the generation of the graph faster.
     theData <- getCleanData()
     
     # 2. Open the device- png- to which the graph is printed.
     #    We used png rather than dev.copy to ensure that it
     #    will fit the specified dimension of the file.  The
     #    graph is saved in plot2.png.
     png(file = "plot3.png", width=480, height=480, units="px")
     
     # 3. plot global active power vs. date and time
     par(mar=c(4,4,1,1))
     x <- strptime(paste(theData$Date,theData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
     y1 <- theData$Sub_metering_1
     y2 <- theData$Sub_metering_2
     y3 <- theData$Sub_metering_3
     plot(x, y1, pch=".", col="black",ylab="Energy sub metering",xlab="")
     lines(x, y1)
     points(x, y2, pch=".", col="red")
     lines(x, y2, col="red")
     points(x, y3, pch=".", col="blue")
     lines(x,y3, col="blue")
     legend("topright", pch="-", col=c("black", "red","blue"), 
            legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
     
     # 4. Turn off the device.
     dev.off()
}

## The 'getCleanData()' function reads the February 2007 data, which was pre-processed
## by the extractData() function for faster processing, into a table called theData
## which will be used by the plot1() function.
getCleanData <- function(){
     theData <- read.table("HPC2007.txt", header=TRUE, sep=";",na.strings="?")
}