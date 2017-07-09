#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
source("dataProcessing.r")

# Define server logic required to draw the desired line plots
# and click buttons
shinyServer(function(input, output) {
   
	output$createPlot <- renderPlot({
	  if (input$Proceed) {
	    
  		# Get the right time
  		if (input$StartTime < input$EndTime) {
  			first <- input$StartTime
  			second <- input$EndTime
  		} else {
  			first <- input$EndTime
  			second <- input$StartTime
  		}
  		subsettedData <- subsetByTime(localAQ, first, second)
  		#print(colnames(subsettedData))
  		#print(subsettedData)
  		# TODO: check if empty?
  		
  		# TODO: Remove missing data?
  		outputVar <- input$PlottingVariable
  		x <- list(title="Date", titlefont=list(family="Courier New", 
  		                                       size=16))
  		y <- list(title=outputVar, titlefont=list(family="Courier New", 
  		                                          size=16))
  		if (input$PlottingVariable == "Ozone") {
  		  #print("trying to plot")
  		  plot(subsettedData$Time, subsettedData$Ozone, type="b",
  		       ylab=outputVar, xlab="Time", main=input$PlottingVariable,
  		       col="red")
  		  #plot_ly(subsettedData, x = ~Time, y = ~Ozone, type="scatter",
  		  #        mode="lines") %>% layout(xaxis=x, yaxis=y)  
  		} else if (input$PlottingVariable == "Temp") {
  		  plot(subsettedData$Time, subsettedData$Temp, type="b",
  		       ylab=outputVar, xlab="Time", main=input$PlottingVariable,
  		       col="red")
  		  #plot_ly(subsettedData, x = ~Time, y = ~Temp, type="scatter",
  		  #        mode="lines") %>% layout(xaxis=x, yaxis=y)  
  		} else if (input$PlottingVariable == "Solar.R") {
  		  plot(subsettedData$Time, subsettedData$Solar.R, type="b",
  		       ylab=outputVar, xlab="Time", main=input$PlottingVariable,
  		       col="red")
  		  #plot_ly(subsettedData, x = ~Time, y = ~Solar.R, type="scatter",
  		  #        mode="lines") %>% layout(xaxis=x, yaxis=y)  
  		} else if (input$PlottingVariable == "Wind") {
  		  plot(subsettedData$Time, subsettedData$Wind, type="b",
  		       ylab=outputVar, xlab="Time", main=input$PlottingVariable,
  		       col="red")
  		  #plot_ly(subsettedData, x = ~Time, y = ~Wind, type="scatter",
  		  #        mode="lines") %>% layout(xaxis=x, yaxis=y)  
  		}
  		# if (input$PlottingVariable == "Ozone") {
  		#   #print("plotting ozone")
  		#   #subsettedData <- subsettedData[~is.na(subsettedData$Ozone)]
  		#   #print("plotting ozone plotly")
  		#   #print(colnames(subsettedData))
  		#   plot_ly(subsettedData, x = ~Time, y = ~Ozone, type="scatter",
  		#           mode="lines", name="Ozone", title="New York Air Quality Measurements, 1973") %>% layout(xaxis=x, yaxis=y)  
  		# } else if (input$PlottingVariable == "Temp") {
  		#   #subsettedData <- subsettedData[~is.na(subsettedData$Temp)]
  		#   plot_ly(subsettedData, x = ~Time, y = ~Temp, type="scatter",
  		#           mode="lines", name="Temp") %>% layout(xaxis=x, yaxis=y)  
  		# } else if (input$PlottingVariable == "Solar.R") {
  		#   #subsettedData <- subsettedData[~is.na(subsettedData$Solar.R)]
  		#   plot_ly(subsettedData, x = ~Time, y = ~Solar.R, type="scatter",
  		#           mode="lines", name="Solar.R") %>% layout(xaxis=x, yaxis=y)  
  		# } else if (input$PlottingVariable == "Wind") {
  		#   #subsettedData <- subsettedData[~is.na(subsettedData$Wind)]
  		#   plot_ly(subsettedData, x = ~Time, y = ~Wind, type="scatter",
  		#           mode="lines", name="Wind") %>% layout(xaxis=x, yaxis=y)  
  		# }
  	
	  }
  })
})
