if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}
coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEISCC[coal, ], sum)

library("ggplot2")
png('plot4.png')
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) + geom_bar(stat = "identity")
print(g)
dev.off()