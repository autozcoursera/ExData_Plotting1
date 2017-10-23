#loading the dataset into R
setwd("D:/gitcode/Rlan")
filename <- "EPC_dataset.zip"
if (!file.exists("EPC dataset")) { 
  unzip(filename) 
}
dat_EPC <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
dat_EPC$Date <- as.Date(dat_EPC$Date,"%Y/%m/%d")
dat_EPC_sub <-subset(dat_EPC,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#No.1
hist(dat_EPC_sub$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",col = "Red")

#save png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
