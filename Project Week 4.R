#source(file.path(getwd(), paste("plot4", ".R",sep = "")))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

#NEI <- NEI[which(NEI$year >= 1999 & NEI$year <= 2008),]

NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)
NEISCC1 <- NEISCC[which(NEISCC$)]

plot(NEI$year, NEI$Emissions)