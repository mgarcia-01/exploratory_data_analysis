
############################## Plot 1 #########################
fileURL <- "/Users/michaelgarcia/CloudStation/ExploratoryDataAnalysis/household_power_consumption.txt"
##fileURL <- "afp://mga_share/DataScienceDirectory/ExploratoryDataAnalysis/household_power_consumption.txt"
## afp://DOMAIN;User@ServerName/ShareName
fileURL <- "T:/DataScienceDirectory/ExploratoryDataAnalysis/household_power_consumption.txt"
#abc <- download.file(fileURL, destfile = abc)
##updated
##updated some used for otehr pc
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

## plot1.png ,  plot1.R  ####
library(datasets)


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