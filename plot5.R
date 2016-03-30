if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
motor <- NEI$type == "ON-ROAD" & NEI$fips == "24510"
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI[motor, ], sum)

library("ggplot2")
png('plot5.png')
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) + geom_bar(stat = "identity")
print(g)
dev.off()