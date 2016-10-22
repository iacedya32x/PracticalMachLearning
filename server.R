library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$benchmark <- renderText({
    
      fit <- lm(formula = mpg ~ I(log(wt)) + factor(cyl), data = mtcars)
      
      mpg <- round(
        fit$coefficients[1]+
          fit$coefficients[2]*log(input$weight/1000)+
          ifelse(input$cylinders == 6, fit$coefficients[3],
                 ifelse(input$cylinders == 8, fit$coefficients[4],0)),1)
      
      mpg
  })
  
  output$gascost <- renderText({
    
    fit <- lm(formula = mpg ~ I(log(wt)) + factor(cyl), data = mtcars)
    
    mpg <- round(
      fit$coefficients[1]+
        fit$coefficients[2]*log(input$weight/1000)+
        ifelse(input$cylinders == 6, fit$coefficients[3],
               ifelse(input$cylinders == 8, fit$coefficients[4],0)),1)
    
    paste("$",round(input$cost_gallon/mpg*input$miles_yr,0), sep = " ")
  })
  
})
