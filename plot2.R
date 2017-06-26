###############    #plot 2  ###############
NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)

plot2img <- file.path(getwd(), paste("plot2", ".png",sep = ""))
yearEmission2 <- aggregate(NEISCC$Emissions, list(NEISCC$year), sum)
names(yearEmission2) <- c("year","Emissions")

png(filename = plot2img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot2 <- plot(yearEmission2$year, yearEmission2$Emissions, xlab = "year", ylab = "emissions", type = "b")

dev.off()