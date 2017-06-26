##########################  plot 1  ##############
NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)

yearEmission <- aggregate(NEISCC$Emissions, list(NEISCC$year), sum)
names(yearEmission) <- c("year","Emissions")

png(filename = plot1img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot1 <- barplot(yearEmission$Emissions, names.arg = yearEmission$year)
dev.off()