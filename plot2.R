# loading dataset file
hpc <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Subsetting the data with desired records
SelData=subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)


## Converting dates
hello_hpc <- paste(as.Date(SelData$Date), SelData$Time)
SelData$Datetime <- as.POSIXct(hello_hpc)

## Creating Plot 2
plot(SelData$Global_active_power~SelData$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to png file
dev.copy(png, file="./data/plot2.png", height=480, width=480)
dev.off()
