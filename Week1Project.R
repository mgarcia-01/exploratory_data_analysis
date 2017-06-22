fileURL <- "/Users/michaelgarcia/CloudStation/ExploratoryDataAnalysis/household_power_consumption.txt"
##fileURL <- "afp://mga_share/DataScienceDirectory/ExploratoryDataAnalysis/household_power_consumption.txt"
## afp://DOMAIN;User@ServerName/ShareName
fileURL <- "T:/DataScienceDirectory/ExploratoryDataAnalysis/household_power_consumption.txt"
#abc <- download.file(fileURL, destfile = abc)
##updated
plot1URL <- "/Users/michaelgarcia/exploratorydata_analysis/exploratory_data_analysis/plot1.png"
plot2URL <- "/Users/michaelgarcia/exploratorydata_analysis/exploratory_data_analysis/plot2.png"
plot1URL <- "F:/RStudio Files/exploratory_data_analysis/plot1.png"

hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))



hpc$datetime <- paste(hpc$Date,hpc$Time)
#hpc$datetime <- cbind(hpc$Date,hpc$Time)
hpc$weekday <- weekdays(hpc$Date)
names(hpc$weekday) <- c("weekday")
names(hpc$datetime) <- c("datetime")
myTime <-strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
hpc <- cbind(myTime,hpc)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]

#hpc$datetime <- as.Date(hpc$datetime, "%d/%m/%Y %H:%M:%S")


#hpc$weektime <- paste(weekdays(hpc$Date),hpc$Time)
#hpc$weektime <- cbind(weekdays(hpc$Date),hpc$Time)




## plot1.png ,  plot1.R  ####
library(datasets)


############################## Plot 1 #########################


#hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## this prints to .png file
png(filename = plot1URL,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,## ...,
    #type = c("cairo", "cairo-png", "Xlib", "quartz"), 
    antialias = c("default"))

hist(hpc$Global_active_power, col = "red"   
      #, breaks=seq(0,6, by = 1)
     #, freq = TRUE  ,xaxt='n' 
    # ,labels = seq(0,6,by=1)
     ,main="Global Active Power"
    #, ylim = c(0,1200)
     ,xlab="Global Active Power (kilowatts)"
    )



axis(side=1, at=seq(0,6, by=1), labels=seq(0,6, by=1))
axis(side=2, at=seq(0,1000,200), labels=seq(0,1000,200))

##dev.copy(png,plot1URL)
##dev.off()

######################### Plot 2 #########################

plot(hpc$myTime
     , hpc$Global_active_power
     , type= "l" ## "b"  plots points and lines
     , xlab=""
     , ylab="Global Active Power (kilowatts)")

dev.copy(png,plot2URL)
dev.off()

###### Plot 2 Alternative- No WeekDay Label  ####
library(ggplot2)

wk_hpc <- aggregate(hpc$Global_active_power, list(hpc$myTime,hpc$Time), mean)
  #wk_hpc$Time <- factor(wk_hpc$Time)


names(wk_hpc) <- c("myTime","Time", "Global_active_power")
ggplot(wk_hpc
       , aes( x = wk_hpc$myTime, y = wk_hpc$Global_active_power
                    , group = 1) 
       
       ) + geom_line() 
         + ylim(0,max(wk_hpc$Global_active_power))
        
####################### Plot 3####################

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

####################### Plot 4 ####################
      
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
