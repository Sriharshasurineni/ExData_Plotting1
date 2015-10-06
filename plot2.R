library(sqldf)

data<-read.csv.sql("project_1.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",header=T,sep=";")






for(n in 1:2880)
{
  data[n,10]<-paste(data[n,1],data[n,2],sep=" ")
}

png(filename="plot1.png")

plot(as.POSIXct(strptime(data[,10],"%d/%m/%Y %H:%M:%S")),data[,3],type="l",ylab="Global Active Power (Kilowatts)", xlab="Time")

dev.off()



