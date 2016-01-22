#set working directory
setwd('C:/Documents and Settings/duda/My Documents/Coursera/ex2R')
library(ggplot2)
#load files

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# NEIbaltimore
NEIbaltimore <- NEI[NEI$fips=="24510",]
NEIbaltimoreAgregate <- aggregate(Emissions ~ year + type, NEIbaltimore, sum)


#ploting

plot3 <- ggplot(NEIbaltimoreAgregate,aes(year,Emissions,color=type)) + 
 geom_line() +
 labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
 labs(title=expression("PM"[2.5]*" Emissions (Tons), Baltimore City 1999-2008"))

plot3

png("plot3.png",width=480,height=480,units="px",bg="transparent")


dev.off()