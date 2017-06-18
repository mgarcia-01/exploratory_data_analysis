hpc$Date <- as.Date(hpc$Date, "%m/%d/%Y")
hpc <-  hpc[ which(hpc$Date = "2/1/2007"
                   $ hpc$Date = "2/2/2007"), ]




# problem 2 test not used
library(ggplot2)
data(hpc)
qplot(hpc$Date, hpc$Global_active_power, data = hpc[,3])

hpc$Global_active_power <- as.numeric(hpc$Global_active_power) 
hpc$Date <- as.Date(hpc$Date)
mxActivePower <- max(hpc$Global_active_power)

xrange <- range
plot(hpc$Date, hpc$Global_active_power)