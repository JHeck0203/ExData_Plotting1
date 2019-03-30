
### install.packages("data.table", dependencies=TRUE

library("data.table")

powerconsum <- data.table::fread(input = "household_power_consumption.txt"
                             , na.string = "?")

powerconsum [, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerconsum [, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

powerconsum <- powerconsum [(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width = 480, height = 480)

hist (powerconsum [,Global_active_power], main = "Global Active Power",
      xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")



