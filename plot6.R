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
NEIbaltimoreVehicles$city <- 'Baltimore'

#Selecting vehicles of Los Angeles Country
LANEIvehicles<- vehiclesNEI[vehiclesNEI$fips=="06037",]
LANEIvehicles$city <- 'Los Angeles Country'

# Combine them into one data frame
ambosNEI <- rbind(NEIbaltimoreVehicles,LANEIvehicles)

#Ploting
plot6 <- ggplot(ambosNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^3 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions from Motor Vehicles on road in Baltimore & LA, 1999-2008"))

print(plot6)

#Saving graphic
png("plot6.png",width=480,height=480,units="px",bg="transparent")

dev.off()