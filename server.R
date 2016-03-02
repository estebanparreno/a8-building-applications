# Assignment 8 - Building Applications

# Set working directory
#setwd("~/Documents/UW/Winter Quarter 2016/498f/a8-building-applications")

# Load packages
library(shiny)
library(dplyr)
library(plotly)

# Load iris data
data("iris")

shinyServer(function(input, output) {
  
  #used for creating plot
  createPlot <- eventReactive(input$render, {
    
    runif(input$flower_species != NULL)
    
    
    title_plot <- paste0("Petal Length vs. Sepal Length (and Sepal Width) for ", input$flower_species, " Flowers")
    dataframe <- filter(iris, Species == input$flower_species)
    p <- plot_ly(data = dataframe, x = Sepal.Length, y = Petal.Length, mode = "markers", 
                 color = Sepal.Width, size = Petal.Width) %>%
      layout(title = title_plot, width = 825, height = 525) 
    return (p)
  })
  
  #used for rending image
  output$image <- renderImage({
    if (is.null(input$flower_species))
      return(NULL)
    
    if (input$flower_species == "setosa") {
      return(list(
        src = "images/image1.JPG",
        contentType = "image/jpeg",
        alt = "Setosa",
        width = "100%"
      ))
    } else if (input$flower_species == "versicolor") {
      return(list(
        src = "images/image2.jpg",
        filetype = "image/jpeg",
        alt = "Versicolor",
        width = "100%"
      ))
    } else if (input$flower_species == "virginica") {
      return(list(
        src = "images/image3.jpg",
        filetype = "image/jpeg",
        alt = "Virginica",
        width = "100%"
      ))
    }
    
  }, deleteFile = FALSE)
  
  
  # Create a plot variable on output 
  output$plot <- renderPlotly({ 
    createPlot()
  })
})
