plot4img <- file.path(getwd(), paste("plot4", ".png",sep = ""))
NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

SCC <- SCC[grep("*coal*|*Coal*",SCC$Short.Name),]
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all = TRUE)


yearCoal <- aggregate(NEISCC$Emissions, list(NEISCC$year),mean)
names(yearCoal) <- c("year","Emissions")

# this produces barchart 
png(filename = plot4img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot4 <-barplot(yearCoal$Emissions
                ,plot = TRUE
                , names.arg = yearCoal$year
                , xlab = "Year"
                , ylab = "US Avg Coal Emissions"
)
text(x = plot4
     , y = round(as.numeric(yearCoal$Emissions), digits = 1)
     , label = round(as.numeric(yearCoal$Emissions), digits = 1)
     , pos = 1
     , cex = 0.8
     , col = "red"
)

dev.off()