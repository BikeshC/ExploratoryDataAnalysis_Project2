if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
library("ggplot2")
subsetNEI <- NEI$type == "ON-ROAD" & (NEI$fips == "24510" | NEI$fips == "06037")
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, NEI[subsetNEI,], sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
png('plot6.png')
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()