fileURL <- file.path(getwd(), paste("household_power_consumption", ".txt",sep = ""))
plot4URL <- file.path(getwd(), paste("plot4", ".png",sep = ""))

hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
myTime <-strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
hpc <- cbind(myTime,hpc)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]

####################### Plot 4 ####################
png(filename = plot4URL,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))


gLabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
gLines <- c("black","red","blue")

par(mfrow=c(2,2))

plot(hpc$myTime, hpc$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(hpc$myTime, hpc$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

plot(hpc$myTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$myTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$myTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=gLabels, lty=1, col=gLines)

plot(hpc$myTime, hpc$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()