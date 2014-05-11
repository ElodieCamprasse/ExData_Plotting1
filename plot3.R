data<-read.table("household_power_consumption.txt", sep=";")
subset1<-subset(data, V1== "1/2/2007")
subset2<-subset(data, V1== "2/2/2007")
subsets<-rbind(subset1, subset2)
new_data<-within(subsets, { Date_time=paste(V1, V2) })
new_data_OK<-within(new_data, { Date_time<-strptime(Date_time, format= "%d/%m/%Y %H:%M:%S") })

dev.copy(png, file = "plot3.png")
plot(new_data_OK$Date_time, as.numeric(type.convert(as.character(new_data_OK$V7), dec = ".")), type= 'l', xlab= " ", ylab= "Energy sub metering")
points(new_data_OK$Date_time, as.numeric(type.convert(as.character(new_data_OK$V8), dec = ".")), type= 'l', col="red")
points(new_data_OK$Date_time, as.numeric(type.convert(as.character(new_data_OK$V9), dec = ".")), type= 'l', col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
