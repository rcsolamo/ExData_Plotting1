## The 'plot2' contains a function to create the line graph of the household
## global minute-averaged active power in kilowatt against time.
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
## 

## The 'plot2()' function generates the second graph of the assignment which 
## is a line graph of the household global minutes-average active power (in kilowatt).
## against time.

## Loading some libraries
library(data.table)

plot2 <- function(){
     # 1. read data with dates 2007-02-01 to 2007-02-02
     #    the data has be pre-processed from the household_power_consumption.txt
     #    file to make the generation of the graph faster.
     theData <- getCleanData()
     # 2. plot global active power vs. date and time
     par(mar=c(5,5,2,2))
     x <- strptime(paste(theData$Date,theData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
     y <- theData$Global_active_power
     plot(x, y, pch=".", ylab="Global Active Power(kilowatt", xlab="")
     lines(x, y)
     # 3. save the plot to a png file called plot2.png with the specified
     #    width=480, height=480 in pixels
     dev.copy(png, file = "plot2.png", width=480, height=480, units="px")
     dev.off()
}

## The 'getCleanData()' function reads the February 2007 data, which was pre-processed
## by the extractData() function for faster processing, into a table called theData
## which will be used by the plot1() function.
getCleanData <- function(){
     theData <- read.table("HPC2007.txt", header=TRUE, sep=";",na.strings="?")
}