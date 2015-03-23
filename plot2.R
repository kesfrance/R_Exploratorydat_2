#!/usr/bin/R
#
# A script to analyse and create a plot2
#
# by: Francis Kessie
#
#
# This script works on Fine particulate matter (PM2.5)
# dataset obtained from the National Emissions Inventory (NEI) databse
#
# requires dplyr package to run



#read data from RDS file
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, year = as.character(year))
NEI_1 <- transform(NEI, type = as.factor(type), year = as.factor(year))

#load dplyr
library(dplyr)

#filter data for Baltimore city, that is where fips == "24510" 
NEI_2 <- filter(NEI_1, fips %in% c("24510"))

#split emission data by year and compute total emission for each year
b <- split(NEI_2$Emissions, NEI_2$year)
totalEm1999b <- sum(b$"1999")
totalEm1999b - totalEm1999
totalEm2002b <- sum(b$"2002")
totalEm2005b <- sum(b$"2005")
totalEm2008b <- sum(b$"2008")

#create a dataframe with total emission and year
dataFrameb <- data.frame(totalEmissionsb =c(totalEm1999b, totalEm2002b, totalEm2005b, totalEm2008b),
                        year= c("1999", "2002", "2005", "2008"))
dataFrameb <-transform(dataFrameb, year = as.character(year))

#make the plot and save to png file
png("plot2.png")
with(dataFrameb, plot(year, totalEmissionsb, type = "b", 
                     ylab = "total PM2.5 emissions (tons)", 
                     col = "red", main = "Total PM2.5 emisions in Baltimore city"))
dev.off()
