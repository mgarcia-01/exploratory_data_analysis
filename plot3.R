###############    #plot 3  ###############
library(ggplot2)
plot3img <- file.path(getwd(), paste("plot3", ".png",sep = ""))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))

NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all = TRUE)

NEISCC <- NEISCC[ which(NEISCC$fips == "24510"), ]
yearEmission3 <- aggregate(NEISCC$Emissions, list(NEISCC$type, NEISCC$year),sum)
###names(yearEmission3) <- c("year", "type","Emissions")

png(filename = plot3img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default")
    )

    ggplot(yearEmission3
                , aes(y=x, x=Group.2)
                )+geom_line(aes(group=Group.1
                                ,colour=factor(Group.1)
                                )
                            )+geom_point(aes(group=Group.1
                                             ,colour=factor(Group.1)
                                              )
                                        , size = 2
                                        )
dev.off()