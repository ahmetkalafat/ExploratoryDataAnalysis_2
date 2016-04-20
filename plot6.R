##Question 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
##in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle 
##emissions?
library(ggplot2)

pm25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm25$year <- factor(pm25$year, levels=c('1999', '2002', '2005', '2008'))
Mariland.onroad <- subset(pm25, fips == '24510' & type == 'ON-ROAD')
California.onroad <- subset(pm25, fips == '06037' & type == 'ON-ROAD')
Mariland.DF <- aggregate(Mariland.onroad[, 'Emissions'], by=list(Mariland.onroad$year), sum)
colnames(Mariland.DF) <- c('year', 'Emissions')
Mariland.DF$City <- paste(rep('Mariland', 4))

California.DF <- aggregate(California.onroad[, 'Emissions'], by=list(California.onroad$year), sum)
colnames(California.DF) <- c('year', 'Emissions')
California.DF$City <- paste(rep('California', 4))

DF <- as.data.frame(rbind(Mariland.DF, California.DF))

png("plot6.png")

ggplot(data=DF, aes(x=year, y=Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

dev.off()