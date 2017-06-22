fileURL <- file.path(getwd(), paste("household_power_consumption", ".txt",sep = ""))
plot2URL <- file.path(getwd(), paste("plot2", ".png",sep = ""))


hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
myTime <-strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
hpc <- cbind(myTime,hpc)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]

######################### Plot 2 #########################

png(filename = plot2URL,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

plot(hpc$myTime
     , hpc$Global_active_power
     , type= "l" ## "b"  plots points and lines
     , xlab=""
     , ylab="Global Active Power (kilowatts)")

dev.off()


