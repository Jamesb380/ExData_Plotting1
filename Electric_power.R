
#James Bennett
#Electric power consumption

hpc <- read.csv("~/Desktop/ExData_Plotting1/household_power_consumption.txt", sep=";")
head(hpc)

summary(hpc$Date)
hpc_use <- hpc[which(hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007'),]



hpc_use$Date <- strptime(hpc_use$Date,format = "%d/%m/%Y")
hpc_use$Global_active_power <- as.numeric(hpc_use$Global_active_power)
hpc_use$Weekday <- as.factor(weekdays(hpc_use$Date))
str(hpc_use)

dev.set(2)
hist(hpc_use$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red", )
dev.copy(png("./Plot1.png",width = 480,height = 480,units = "px"))

dev.off()
dev.off()

dev.set(2)
plot(hpc_use$Global_active_power,type = 'l')
dev.copy(png("./Plot2.png",width = 480,height = 480,units = "px"))
dev.off()
dev.off()

dev.set(2)
with(hpc_use, plot(Sub_metering_1, type = "n"), col = "black")
with(hpc_use, lines(Sub_metering_2, col = "red") )
with(hpc_use, lines(Sub_metering_3, col = "blue") )
legend("topright", pch = 2, col = c("black","red", "blue"), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))
dev.copy(png("./Plot3.png",width = 480,height = 480,units = "px"))
dev.off()
dev.off()

dev.set(2)
par(mfrow = c(2,2))
plot(hpc_use$Global_active_power,type = 'l')

plot(hpc_use$Voltage,type = 'l')

with(hpc_use, plot(Sub_metering_1, type = "n"), col = "black")
with(hpc_use, lines(Sub_metering_2, col = "red") )
with(hpc_use, lines(Sub_metering_3, col = "blue") )
legend("topright", pch = 2, col = c("black","red", "blue"), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))

plot(hpc_use$Global_reactive_power, type = 'l')
dev.copy(png("./Plot4.png",width = 480,height = 480,units = "px"))


par(mfrow = c(1,1))

dev.off()
dev.off()
