fileURL <- file.path(getwd(), paste("household_power_consumption", ".txt",sep = ""))

plot3URL <- file.path(getwd(), paste("plot3", ".png",sep = ""))


hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
myTime <-strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
hpc <- cbind(myTime,hpc)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]
########### plot 3 ###################

gLines <- c("black", "red", "blue")

gLabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(hpc$myTime, hpc$Sub_metering_1
     , type="l"
     , col=gLines[1]
     , xlab=""
     , ylab="Energy sub metering")
lines(hpc$myTime
      , hpc$Sub_metering_2
      , col=gLines[2])
lines(hpc$myTime
      , hpc$Sub_metering_3
      , col=gLines[3])
legend("topright"
       , legend=gLabels
       , col=gLines, lty="solid")