#!/usr/bin/R
#
# A script to analyse and create a plot3
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

#create plot of emissions by year, for each of the four types of sources and save to png file
library(ggplot2)
png("plot3.png")
qplot(year, Emissions, data = NEI_2, facets = .~type)
dev.off()
