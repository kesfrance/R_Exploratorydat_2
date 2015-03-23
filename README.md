# R_Exploratorydat_2
A repo containing R-programs I generated for exploratory analysis as part of the exploratory data analysis
course on Coursera

Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is 
harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting 
national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. 
Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National 
Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over 
the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

Data

The source folder contains two files:
First, is the PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data 
for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type
of source for the entire year.

Second, is the Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the
SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few 
different ways from more general to more specific and you may choose to explore whatever categories you think are most 
useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

Questions

The exploratory plots address the following questions using various plotting systems in R. 
 
plot1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

plot2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

plot3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

plot4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

plot5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?