
#######################################################################################################################
#######################################################################################################################
#######################################             Projeto 1                  ########################################
#######################################               PloT 3                   ########################################
#######################################################################################################################

## Obtendo todos os dados
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extraindo dados parciais
data.subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Convertendo  dados
datetime <- paste(as.Date(data.subset$Date), data.subset$Time)
data.subset$Datetime <- as.POSIXct(datetime)

## Gráfico 2 - Plot 2

with(data.subset, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})


legend("topright", col=c("black", "red", "blue"), lty=1, lwd=0.5, 
       legend=c("Sub1", "Sub2", "Sub3"))


legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lw  
       
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))




## Salavando o arquivo
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
