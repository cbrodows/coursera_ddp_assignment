# Load libraries
library(datasets)
require(data.table)
library(dplyr)
library(DT)
#library(rCharts)

# Take a brief look at AQ set
#head(airquality)
localAQ = airquality

# Add a new time field
timeVect <- vector('character', length=0)
for (i in 1:nrow(localAQ)) {
	strr <- sprintf("%02d/%02d/73", localAQ$Month[i], localAQ$Day[i])
	timeVect <- c(timeVect, strr)
}
localAQ$Time <- as.Date(timeVect, format="%m/%d/%y")

subsetByTime <- function(dataset, startDate, endDate) {
  #print("subsetbytime")
  #print(colnames(dataset))
  ds <- subset(dataset, Time >= startDate & Time <= endDate)
  return(ds)
	#return (dataset[(dataset$Time >= startDate) & 
	#			   (dataset$Time <= endDate)]) 
}
# subsetByTemp <- function(dataset, startTemp, endTemp) {
# 	return (dataset[(dataset$Temp >= startTemp) & (dataset$Temp <= endTemp)])
# }
# subsetByWind <- function(dataset, startWind, endWind) {
# 	return (dataset[(dataset$Wind >= startWind) & (dataset$Wind <= endWind)])
# }
# subsetBySolarR <- function(dataset, startSolarR, endSolarR) {
# 	return (dataset[(dataset$Solar.R >= startSolarR) & (dataset$Solar.R <= endSolarR)])
# }
# subsetByOzone <- function(dataset, startOzone, endOzone) {
# 	return (dataset[(dataset$Ozone >= startOzone) & (dataset$Ozone <= endOzone)])
# }