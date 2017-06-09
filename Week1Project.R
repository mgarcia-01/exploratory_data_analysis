fileURL <- "/Users/michaelgarcia/CloudStation/ExploratoryDataAnalysis/household_power_consumption.txt"
hpc <- read.table(file = fileURL, header = TRUE,sep = ";")


hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]



## plot1.png ,  plot1.R  ####
library(datasets)


##### Plot 1 #####

hist(as.numeric(as.character(hpc$Global_active_power)), col = "red", breaks=seq(0,12,.5)
     , freq = TRUE  ,xaxt='n' #  labels = seq(eq(0,6,by=2))
     ,main="Global Active Power", ylim = c(0,1200)
     ,xlab="Global Active Power (kilowatts)"
     
     )
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
#axis(side=2, at=seq(0,1000,200), labels=seq(0,1000,200))


##### Plot 2 #####

library(ggplot2)
data(hpc)
qplot(hpc$Date, hpc$Global_active_power, data = hpc[,3])

hpc$Global_active_power <- as.numeric(hpc$Global_active_power) 
hpc$Date <- as.Date(hpc$Date)
mxActivePower <- max(hpc$Global_active_power)

xrange <- range
plot(hpc$Date, hpc$Global_active_power)


library(ggplot2)

wk_hpc <- aggregate(hpc[,3], list(hpc$Date, hpc$Time), mean)
names(wk_hpc) <- c("Date","Time", "Global_active_power")
ggplot(wk_hpc, aes( x = factor(wk_hpc$Time), y = wk_hpc$Global_active_power) #, group = 1
       , labs(x = c(unique(weekdays(wk_hpc$Date))))) + geom_line() + ylim(
        0,max(wk_hpc$Global_active_power))




