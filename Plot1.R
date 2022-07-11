### Course Project
### Calculate required memory
rows <- 2075259
columns <- 9
memory_req <- ((columns*rows)/8)/1000000 ### divide by 10e6 for GB
print(memory_req) ### roughly 2,3 GB memory are required

### loading data
### importing required libraries
library(data.table)
library(lubridate)
main <- fread("C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt")
main_df <- main
### convert column to datetime for subsetting

main_df$Date <- as.POSIXct(main_df$Date, format = "%d/%m/%Y")
plot_data <- main_df[main_df$Date >= "2007-02-01 CET" & main_df$Date <="2007-02-02 CET", ] ### filter dataset

### Creating Plot1
### convert values to numeric
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power, na.rm = TRUE)
png(file="C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/Plot1.png",
    width=480, height=460)

hist(plot_data$Global_active_power,
     main = "Global Actice Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     xlim = c(0,6),
     col = "red",
     )
dev.off()

### Creating Plot2

plot_data$day <- format(plot_data$Date, "%d")
png(file="C:/Users/JanBusse/Downloads/exdata_data_household_power_consumption/Plot2.png",
    width=480, height=460)

class(plot_data$Time)
plot(plot_data$Time,
     plot_data$Global_active_power,
     type = 'l',
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot_data$Date
dev.off()