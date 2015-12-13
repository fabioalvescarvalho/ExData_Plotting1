
#######################################################################################################################
#######################################################################################################################
#######################################             Projeto 1                  ########################################
#######################################               PloT 2                   ########################################
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

plot(data.subset$Global_active_power~data.subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Salavando o arquivo
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
