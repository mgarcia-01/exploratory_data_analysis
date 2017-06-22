fileURL <- file.path(getwd(), paste("household_power_consumption", ".txt",sep = ""))
plot2URL <- file.path(getwd(), paste("plot2", ".png",sep = ""))


hpc <- read.table(file = fileURL, header = TRUE,sep = ";")

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
myTime <-strptime(paste(hpc$Date, hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
hpc <- cbind(myTime,hpc)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <-  hpc[ which(hpc$Date == "2007-2-1"
                   | hpc$Date == "2007-2-2"), ]
############################## Plot 1 #########################
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
