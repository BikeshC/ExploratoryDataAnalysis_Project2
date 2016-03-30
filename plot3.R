if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year+type, NEI[NEI$fips=="24510",], sum)
library("ggplot2")
png('plot3.png')
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, col = type)) + geom_line()
print(g)
dev.off()