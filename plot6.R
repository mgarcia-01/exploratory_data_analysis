###############    plot 6  ###############
library(ggplot2)
plot5img <- file.path(getwd(), paste("plot5", ".png",sep = ""))
NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

SCC <- SCC[grep("*ehicle*"
                ,SCC$Short.Name),]
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all = TRUE)
NEISCC <- NEISCC[ which(NEISCC$fips == "24510" | NEISCC$fips == "06037"), ]
NEISCC[NEISCC$city =="24510"]<-"Baltimore"
NEISCC[NEISCC$city =="06037"] <- "Los Angeles"
cityEmission <- aggregate(NEISCC$Emissions, list(NEISCC$fips,NEISCC$year), mean)
##names(cityEmission) <- c("city","year","Emissions")

png(filename = plot2img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

cityEm <- ggplot(cityEmission
                 , aes(y=x, x=Group.2)
)
cityEm+geom_line(aes(group=as.character(Group.1)
                     ,colour=factor(as.character(Group.1))
)
)+geom_area(aes(group=as.character(Group.1)
                ,colour=factor(as.character(Group.1))
)
)+geom_point(aes(group=as.character(Group.1)
                 ,colour=factor(as.character(Group.1))
)
,size = 3
,position = "identity"
)
dev.off()