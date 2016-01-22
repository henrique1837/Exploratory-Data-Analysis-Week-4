#set working directory
setwd('C:/Documents and Settings/duda/My Documents/Coursera/ex2R')

#load files

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# total emissions by year in Baltimore
totalBaltimore <- aggregate(Emissions ~ year,NEI[NEI$fips=="24510",], sum)

#ploting

barplot(totalBaltimore$Emissions, names.arg=totalBaltimore$year,  xlab="Year",  ylab="PM2.5 Emissions (Tons)",  main="Total PM2.5 Emissions From Baltimore City", col='blue')

png("plot2.png",width=480,height=480,units="px",bg="transparent")


dev.off()