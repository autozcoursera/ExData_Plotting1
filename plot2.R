#loading the dataset into R
setwd("D:/gitcode/Rlan")
filename <- "EPC_dataset.zip"
if (!file.exists("EPC dataset")) { 
  unzip(filename) 
}
dat_EPC <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
dat_EPC$Date <- as.Date(dat_EPC$Date,"%Y/%m/%d")
dat_EPC_sub <-subset(dat_EPC,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#No.2
SetTime <- paste(dat_EPC_sub$Date, dat_EPC_sub$Time)
SetTime <- strptime(SetTime, "%Y-%m-%d %H:%M:%S")
with(dat_EPC_sub,plot(SetTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)"))

#save png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
