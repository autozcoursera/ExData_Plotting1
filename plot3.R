#loading the dataset into R
setwd("D:/gitcode/Rlan")
filename <- "EPC_dataset.zip"
if (!file.exists("EPC dataset")) { 
  unzip(filename) 
}
dat_EPC <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
dat_EPC$Date <- as.Date(dat_EPC$Date,"%Y/%m/%d")
dat_EPC_sub <-subset(dat_EPC,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#No.3
with(dat_EPC_sub,{
  plot(SetTime,Sub_metering_1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(SetTime,Sub_metering_2 ,col='Red')
  lines(SetTime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
