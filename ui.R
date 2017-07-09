#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
require(markdown)
require(data.table)
library(miniUI)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("New York Air Quality Measurements, 1973"),
  
  #miniContentPanel(
	selectInput("StartTime", "Start Date", 
				choices=seq(as.Date("1973-05-01"), as.Date("1973-09-29"), "days")),
	selectInput("EndTime", "End Date",
				choices=seq(as.Date("1973-05-01"), as.Date("1973-09-29"), "days")),
	selectInput("PlottingVariable", "What Variable Do You Want to Plot?",
				choices=c("Ozone", "Solar.R", "Temp", "Wind")),
  #),
  checkboxInput("Proceed", "Proceed?"),
  
  mainPanel(
	  plotOutput("createPlot")
  )
))
