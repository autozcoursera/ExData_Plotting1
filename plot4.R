#loading the dataset into R
setwd("D:/gitcode/Rlan")
filename <- "EPC_dataset.zip"
if (!file.exists("EPC dataset")) { 
  unzip(filename) 
}
dat_EPC <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
dat_EPC$Date <- as.Date(dat_EPC$Date,"%Y/%m/%d")
dat_EPC_sub <-subset(dat_EPC,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#No.4
par(mfrow = c(2,2),mar=c(4,4,2,2), oma=c(2,2,0,2))
#plot1
with(dat_EPC_sub,plot(SetTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))
#plot2
with(dat_EPC_sub,plot(SetTime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))
#plot3
with(dat_EPC_sub,{
  plot(SetTime,Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(SetTime,Sub_metering_2 ,col='Red')
  lines(SetTime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),bty = "n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)
#plot4
with(dat_EPC_sub,plot(SetTime,Global_reactive_power,type = "l",xlab = "datetime",
                      ylab = "Global_reactive_power"))

#save png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
