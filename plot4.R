#######################################################################################################################
#######################################             Projeto 1                  ########################################
#######################################               PloT 4                   ########################################
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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
       plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})


## Salavando o arquivo
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
