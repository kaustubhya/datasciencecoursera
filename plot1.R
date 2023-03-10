library("data.table")

## Kaustubhya Shukla's work

setwd("~/C:/Users/kaust/Downloads/datasciencecoursera-master/datasciencecoursera-master/4_Exploratory_Data_Analysis/week-1/peer-project1")


powerDT1 <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )


powerDT1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


powerDT1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT1 <- powerDT1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
