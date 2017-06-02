fileURL <- "/Users/michaelgarcia/CloudStation/ExploratoryDataAnalysis/household_power_consumption.txt"

hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc <-  hpc[ which(as.character(hpc$Date) >= "2/1/2007"
                      & as.character(hpc$Date) <= "2/2/2007"), ]

hpcData <- subset(hpc, as.character(hpc$Date) >= '2/1/2007' & as.character(hpc$Date) <= '2/2/2007', 
              select=hpc$Date:hpc$Sub_metering_3)


 mydate <- factor(hpc[,1])
 as.Date(mydate, format = "%m/%d/%Y")
#[1] "2006-01-15"

 mydates <- as.Date(c(hpc$Date))
 axis.Date(1, as.Date(sites$date, origin="1960-10-01"))


window(hpc[3], start = as.POSIXct("2007-02-01"), end = as.POSIXct("2006-01-08"))

# convert date info in format 'mm/dd/yyyy'
strDates <- c(hpc$Date)
dates <- as.Date(strDates, "%m/%d/%Y")


##Give each entry a date
hpc$Date = paste0(hpc$Date, "01")
##Convert as before
date = as.Date(as.character(hpc$Date), format("%Y%m%d"));

## plot1.png ,  plot1.R  ####
library(datasets)

x <- seq(0,2*pi,0.1)
y <- sin(x)
plot(x,
     y,
     main="main title",
     sub="sub-title",
     xlab="x-axis label",
     ylab="y-axis label")



hist(round(as.numeric(as.character(hpc$Global_active_power))), col = "red", breaks=seq(0,12,by=1)
     , freq = TRUE  ,xaxt='n' #  labels = seq(eq(0,6,by=2))
     )
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))

  

hist(as.numeric(hpc$Global_active_power)/1000, freq=TRUE
     , col= "red", xlim=c(2,6),  ylim=c(0, 1200)
     )



rug(as.numeric(hpc$Global_active_power)/1000)

dat <- sample(100, 1000, replace=TRUE)
hist(dat, xaxt='n')
axis(side=1, at=seq(0,100, 10), labels=seq(0,1000,100))s