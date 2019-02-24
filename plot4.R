
# Subsetting the data with desired records
SelData=subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)


## Converting dates
hello_hpc <- paste(as.Date(SelData$Date), SelData$Time)
SelData$Datetime <- as.POSIXct(hello_hpc)

## Creating Plot 4 (PNG)
png(filename="./data/plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(SelData, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_Rective_Power",xlab="datetime")
})

dev.off()
