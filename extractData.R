## The 'extractData' contains a function to extract the February 2007 data
## from the 'household_power_consumption.txt' and places it at the
## 'HPC2007.txt'
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
## ##

## The extractData() function extracts the observations for the February 2007
## household consumption.  The output of this function will be the basis
## the other plot functions necessary for the course project 1 of the
## Exploratory Analysis.  This makes the generation of the plots faster by
## giving it only the data it needs.
##
## The needed data is saved in the file HPC2007.txt
extractData <- function(){
     readConnection <- file("household_power_consumption.txt", "rt")
     writeConnection <- file("HPC2007.txt","wt")
     input <- readLines(readConnection,1)
     writeLines(input, writeConnection)
     while (length(input <- readLines(readConnection, n=10000)) > 0 ){
          for (i in 1:length(input)){
               temp <- unlist(strsplit(input[i], split=";"))
               theDate <- as.Date(temp[1], format="%d/%m/%Y")
               if(theDate == as.Date("1/2/2007",format="%d/%m/%Y") | theDate == as.Date("2/2/2007",format="%d/%m/%Y")) {
                    print(input[i])
                    writeLines(input[i],writeConnection)
               }
          }  # end of for i
     } # end of while
     close(readConnection)
     close(writeConnection)
}