fileURL <- "/Users/michaelgarcia/CloudStation/ExploratoryDataAnalysis/household_power_consumption.txt"

hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

## plot1.png ,  plot1.R  ####
library(datasets)

hist(as.numeric(hpc$Global_active_power)/1000, col = "red" , breaks = 20)

dat <- sample(100, 1000, replace=TRUE)
hist(dat, xaxt='n')
axis(side=1, at=seq(0,100, 10), labels=seq(0,1000,100))