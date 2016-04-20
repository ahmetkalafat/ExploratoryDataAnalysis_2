##Question 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have 
##seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

pm25 <- readRDS("summarySCC_PM25.rds")
Baltimore <- subset(pm25, fips == "24510")
pm25_sampling <- pm25[sample(nrow(pm25), size=5000, replace=F), ]
Baltimore$year <- factor(Baltimore$year, levels=c('1999', '2002', '2005', '2008'))

png("plot3.png")
ggplot(data=Baltimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Years') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') +
  geom_jitter(alpha=0.10)
dev.off()