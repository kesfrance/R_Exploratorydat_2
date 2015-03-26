#!/usr/bin/R
#
# A script to analyse and create plot1
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

#split emission data by year and compute total emission for each year
d <- split(NEI_1$Emissions, NEI_1$year)
totalEm1999 <- sum(d$"1999")
totalEm2002 <- sum(d$"2002")
totalEm2005 <- sum(d$"2005")
totalEm2008 <- sum(d$"2008")

#create a dataframe with total emission and year
dataFrame <- data.frame(totalEmissions =c(totalEm1999, totalEm2002, totalEm2005, totalEm2008),
                        year= c("1999", "2002", "2005", "2008"))
dataFrame <-transform(dataFrame, year = as.character(year))

#create plot and save to png file
png("plot1.png")
with(dataFrame, plot(year, totalEmissions, type = "b", 
                     ylab = "total PM2.5 emissions (tons)", col = "blue", main = "Total PM2.5 emisions per year"))
dev.off()
