#source(file.path(getwd(), paste("plot4", ".R",sep = "")))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

plot(NEI$year, NEI$Emissions)