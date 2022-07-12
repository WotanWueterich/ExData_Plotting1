### Creating Plot4
### loading data
### importing required libraries
library(data.table)
library(lubridate)
main <- fread("C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt")
main_df <- main
### convert column to datetime for subsetting
main_df$dt <- paste(main_df$Date, main_df$Time, sep = " ")
main_df$dt <- as.POSIXct(main_df$dt, format = "%d/%m/%Y %H:%M:%S")
plot_data <- main_df[main_df$dt >= "2007-02-01 00:00:00 CET" & main_df$dt <="2007-02-03 00:00:00 CET", ] ### filter dataset

### converting required data to numeric
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1, na.rm = TRUE)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2, na.rm = TRUE)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3, na.rm = TRUE)
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power, na.rm = TRUE)
plot_data$Global_reactive_power <- as.numeric(plot_data$Global_reactive_power, na.rm = TRUE)
plot_data$Voltage <- as.numeric(plot_data$Voltage, na.rm = TRUE)


png(file="C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/Plot4.png",
    width=480, height=480)
par(mfrow = c(2,2))

plot(plot_data$dt,
     plot_data$Global_active_power,
     type = 'l',
     xlab = "",
     ylab = "Global Active Power",
     ylim = c(0,6))

plot(plot_data$dt,
     plot_data$Voltage,
     type = 'l',
     xlab = "datetime",
     ylab = "Voltage",
     ylim = c(234,246)
     )
plot(plot_data$dt,
     plot_data$Sub_metering_1,
     type = 'l',
     xlab = "",
     ylab = "Energy sub metering",
)
lines(plot_data$dt, plot_data$Sub_metering_2, col = "red")
lines(plot_data$dt, plot_data$Sub_metering_3, col = "blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),
       lty = 1
)

plot(plot_data$dt,
     plot_data$Global_reactive_power,
     type = 'l',
     xlab = "datetime",
     ylab = "Global_reactive_power",
     ylim = c(0,0.5))

dev.off()