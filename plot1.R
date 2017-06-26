##########################  plot 1  ##############
plot1img <- file.path(getwd(), paste("plot1", ".png",sep = ""))
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

plot1 <- plot(yearEmission$year, yearEmission$Emissions, xlab = "year", ylab = "emissions", type = "b")
dev.off()