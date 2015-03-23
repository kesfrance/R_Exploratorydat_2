#!/usr/bin/R
#
# A script to analyse and create a plot4
#
# by: Francis Kessie
#
#
# This script works on Fine particulate matter (PM2.5)
# dataset obtained from the National Emissions Inventory (NEI) databse
#
# requires dplyr package to run


#read PM2.5 emisions data
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, year = as.character(year))
NEI_1 <- transform(NEI, type = as.factor(type), year = as.factor(year))

#read the Source Classification Code Table
scc_data <- readRDS("Source_Classification_Code.rds")

#load dplyr
library(dplyr)

# select the subset of the Source Classification Code Table containing coal combustion-related sources 
# by filtering for columns containg "Fuel Comb - Electric Generation - Coal"
coalcomb_sources <- scc_data %>%
  select(SCC, EI.Sector)%>%
  filter(EI.Sector %in% c("Fuel Comb - Electric Generation - Coal"))

#create a character vector that contains the Source Classification Code (SCC)
# associated with the coal combustion-related sources
coalvector <- as.character(coalcomb$SCC)

#filter the PM2.5 Emissions Data for only coal combustion-related sources using the coalvector
coalPM25_data <- filter(NEI_1, SCC %in% coalvector)

#create plot to show how emisons from coal combustion-related sources vary by of emissions by year
# and save as png file
library(ggplot2)
png("plot4.png")
qplot(year, Emissions, data = coalPM25_data)

dev.off()

