#set working directory
setwd('C:/Documents and Settings/duda/My Documents/Coursera/ex2R')
#loading required library
library(ggplot2)

#load files
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

# Selecting vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Selecting vehicles of Baltimore City 
NEIbaltimoreVehicles <- vehiclesNEI[vehiclesNEI$fips=="24510",]

#Ploting
grafico <- ggplot(NEIbaltimoreVehicles,aes(factor(year),Emissions)) +
       geom_bar(stat="identity",fill="red",width=0.75) +
       theme_bw() +  guides(fill=FALSE) +
       labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
       labs(title=expression("PM"[2.5]*" Emissions from motor vehicles on road, Baltimore city, 1999-2008"))
print(grafico)

#Saving graphic as PNG
png("plot5.png",width=480,height=480,units="px",bg="transparent")
dev.off()