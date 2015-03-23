#!/usr/bin/R
#
# A script to analyse and create a plot5
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
NEI_1 <- transform(NEI, type = as.factor(type), year = as.factor(year))

#load dplyr
library(dplyr)

#filter data for Baltimore city, that is where fips == "24510" 
NEI_2 <- filter(NEI_1, fips %in% c("24510"))
head(NEI_2)

#read the Source Classification Code Table
scc_data <- readRDS("Source_Classification_Code.rds")

#load dplyr
library(dplyr)

# select the subset of the Source Classification Code Table containing moto vehicle sources 
# by filtering for columns containing 
motovehicle_sources <- scc_data %>%
  select(SCC, EI.Sector)%>%
  filter(EI.Sector %in% c("Mobile - On-Road Gasoline Light Duty Vehicles", 
                         "Mobile - On-Road Gasoline Heavy Duty Vehicles", 
                         "Mobile - On-Road Diesel Heavy Duty Vehicles",
                         "Mobile - On-Road Diesel Light Duty Vehicles"))

#create a character vector that contains the Source Classification Code (SCC)
# associated with the emissions from motor vehicle sources
mot.vehicle_vector <- as.character(motovehicle_sources$SCC)


#filter the PM2.5 Emissions Data for motor vehicle sources using the mot.vehicle_vector
mot.veh.PM25_data <- filter(NEI_2, SCC %in% mot.vehicle_vector)

#create plot to show how emisons from moto vehicle-related sources vary by year
# and save as png file
library(ggplot2)
png("plot5.png")
qplot(year, Emissions, data = mot.veh.PM25_data)

dev.off()
