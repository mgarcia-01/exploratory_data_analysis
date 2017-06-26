###############    plot 5  ################
plot5img <- file.path(getwd(), paste("plot5", ".png",sep = ""))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)


SCC <- SCC[grep("*ehicle*"
                ,SCC$Short.Name),]

#merges scc that is filtered for vehicles
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all = TRUE)
# new dataset filtering for just  Baltimore
NEISCC <- NEISCC[ which(NEISCC$fips == "24510"), ]

yearCoal <- aggregate(NEISCC$Emissions, list(NEISCC$year),mean)
names(yearCoal) <- c("year","Emissions")

# this produced barchart 
png(filename = plot5img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot5 <- barplot(yearCoal$Emissions
                 ,plot = TRUE
                 , names.arg = yearCoal$year
                 , xlab = "Year"
                 , ylab = "Baltimore Avg Coal Emissions"
)
text(x = plot5
     , y = round(as.numeric(yearCoal$Emissions), digits = 1)
     , label = round(as.numeric(yearCoal$Emissions), digits = 1)
     , pos = 1
     , cex = 0.8
     , col = "red"
)

dev.off()