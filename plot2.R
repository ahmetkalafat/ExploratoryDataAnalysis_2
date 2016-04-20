##Question 2. Have total emissions from PM2.5 decreased in the Baltimore City, 
##Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

pm25 <- readRDS("summarySCC_PM25.rds")
Baltimore <- subset(pm25, fips == "24510")
total <- tapply(Baltimore$Emissions, Baltimore$year, sum)
png("plot2.png")
plot(names(total), total, type="l", xlab="Years", ylab=expression("Total Baltimore City  Emissions (tons)"), main=expression("Total Baltimore City Emissions by Year"))
dev.off()