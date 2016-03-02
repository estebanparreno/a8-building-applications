# Assignment 8 - Building Applications

# Set working directory
#setwd("~/Documents/UW/Winter Quarter 2016/498f/a8-building-applications")

# Load packages
library(shiny)
library(plotly)

#has a css style sheet
shinyUI(fluidPage(theme = "app.css", 
                  
  #header
  tags$h1("Iris Data Visualization"),
  
  # Create sidebar
  sidebarLayout(
    
    # create Side panel
    sidebarPanel(
      
      # Widget: for inputs
      selectInput("flower_species", label = h3("Choose flower species"), 
                  choices = list("Choose a species..." = NULL, "Setosa" = 'setosa', "Versicolor" = 'versicolor', "Virginica" = 'virginica'), 
                  selected = 'Choose a species...'),
      
      #create image showing species
      imageOutput("image"),
      
      # Widget: Create an action button
      actionButton("render", "Generate plot")
      
    ),
    
    mainPanel(
      plotlyOutput('plot')
    )
  )
))
