### Creating Plot3
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

### convert values to numeric
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1, na.rm = TRUE)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2, na.rm = TRUE)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3, na.rm = TRUE)


png(file="C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/Plot3.png",
    width=480, height=480)

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

dev.off()