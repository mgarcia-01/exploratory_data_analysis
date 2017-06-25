#source(file.path(getwd(), paste("plot4", ".R",sep = "")))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
plot1img <- file.path(getwd(), paste("plot1", ".png",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

#NEI <- NEI[which(NEI$year >= 1999 & NEI$year <= 2008),]
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)
NEISCC1 <- NEISCC(which(NEISCC$fips == "24510"))

#plot 1
yearEmission <- aggregate(NEISCC$Emissions, list(NEISCC$year), sum)
names(yearEmission) <- c("year","Emissions")
png(filename = plot1img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot1 <- barplot(yearEmission$Emissions, names.arg = yearEmission$year)
dev.off()
  #plot(yearEmission$year, yearEmission$Emissions, xlab = "year", ylab = "emissions", type = "b")