library(sqldf)

data<-read.csv.sql("project_1.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",header=T,sep=";")






for(n in 1:2880)
{
  data[n,10]<-paste(data[n,1],data[n,2],sep=" ")
}



x<-as.POSIXct(strptime(data[,10],"%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png")


par(mfrow=c(2,2),pin=c(8,7),mar=c(5,4.1,4.1,3))      # number of rows, number of columns

plot(as.POSIXct(strptime(data[,10],"%d/%m/%Y %H:%M:%S")),data[,3],type="l",cex.lab=0.8,ylab="Global Active Power (Kilowatts)", xlab="Time")

plot(x,data[,5],type="l",ylab="Voltage", xlab="datetime")


plot(x,data[,7],type="l",col="red", ylab="Energy sub metering", xlab="Time",cex.lab=0.8)

lines(x,data[,8],col="green")

lines(x,data[,9],col="blue")

legend(x="topright",
       legend=c("Sub_metering_1","sub_metering_2","Sub_metering_3"),
       col=c("red","green","blue"),
       lwd=1,
       cex=0.8,
       merge=FALSE)



plot(x,data[,4],type="l",cex.lab=0.8,xlab="datetime",ylab="Global_Reactive_Power")






dev.off()
