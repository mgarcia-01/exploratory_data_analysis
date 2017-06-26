#source(file.path(getwd(), paste("plot4", ".R",sep = "")))
plot1img <- file.path(getwd(), paste("plot1", ".png",sep = ""))


NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))

NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

#NEI <- NEI[which(NEI$year >= 1999 & NEI$year <= 2008),]
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)
NEISCC1 <- NEISCC[ which(NEISCC$fips == "24510"), ]


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
#plot(yearEmission$year, yearEmission$Emissions, xlab = "year", ylab = "emissions", type = "b")


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


###############    #plot 3  ###############
library(ggplot2)
plot3img <- file.path(getwd(), paste("plot3", ".png",sep = ""))

NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))

NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all.y = TRUE)

NEISCC <- NEISCC[ which(NEISCC$fips == "24510"), ]
yearEmission3 <- aggregate(NEISCC$Emissions, list(NEISCC$type, NEISCC$year),sum)
###names(yearEmission3) <- c("year", "type","Emissions")

png(filename = plot3img,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot3 <- ggplot(yearEmission3
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


###############    plot 4  ###############
plot4img <- file.path(getwd(), paste("plot4", ".png",sep = ""))
NEIFile <- file.path(getwd(), paste("summarySCC_PM25", ".rds",sep = ""))
SCCFile <- file.path(getwd(), paste("Source_Classification_Code", ".rds",sep = ""))
NEI <- readRDS(NEIFile)
SCC <- readRDS(SCCFile)

SCC <- SCC[grep("*coal*|*Coal*",SCC$Short.Name),]
NEISCC <- merge(x = NEI, y = SCC, by = "SCC", all = TRUE)


yearCoal <- aggregate(NEISCC$Emissions, list(NEISCC$year),mean)
#names(yearCoal) <- c("year","Emissions")

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



###############    plot 5  ###############
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