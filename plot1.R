##Question 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

pm25 <- readRDS("summarySCC_PM25.rds")
total <- tapply(pm25$Emissions, pm25$year, sum)
png("plot1.png")
plot(names(total), total, type="l", xlab="Years", ylab=expression("Total Emissions"), main=expression("Total  Emissions by Year"))
dev.off()