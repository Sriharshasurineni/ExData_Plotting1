library(sqldf)

data<-read.csv.sql("project_1.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",header=T,sep=";")




png(filename="plot1.png")

hist(data[,3],breaks=12,xlab="Global Active Power (Kilowatts)",main="Global Active Power", ylim=c(0,1300),col="red")

dev.off()
