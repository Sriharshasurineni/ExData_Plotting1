library(sqldf)

data<-read.csv.sql("project_1.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",header=T,sep=";")






for(n in 1:2880)
{
  data[n,10]<-paste(data[n,1],data[n,2],sep=" ")
}



x<-as.POSIXct(strptime(data[,10],"%d/%m/%Y %H:%M:%S"))

png(filename="plot3.png")


plot(x,data[,7],type="l",col="red", ylab="Energy sub metering")

lines(x,data[,8],col="green")

lines(x,data[,9],col="blue")

legend(x="topright",
       legend=c("Sub_metering_1","sub_metering_2","Sub_metering_3"),
       col=c("red","green","blue"),
       lwd=1, 
      
       
       merge=FALSE)

dev.off()
