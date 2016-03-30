setwd("R\ExploratoryDataAnalysis")
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
aggregatedTotalByYear_Baltimore <- aggregate(Emissions ~ year, NEI[NEI$fips == "24510",], sum)
png('plot2.png')
barplot(height=aggregatedTotalByYear_Baltimore$Emissions, names.arg=aggregatedTotalByYear_Baltimore$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()