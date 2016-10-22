library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gas Mileage Benchmarking"),
  p("This app allows the user to create two benchmarks to consider when shopping for a new vehicle:
    Gas Mileage and Cost."),
  h3("Directions on how to use this interface"),
  p("1). Use the first scroll bar to select the desired weight of the vehicle."),
  p("2). Use the second scroll bar to select the desired number of cylinders of the vehicle."),
  p("3). Use the first box to enter in the number of miles you drive per year."),
  p("4). Use the second box to enter in the cost per gallon of gas in your area."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput(inputId = "weight",
                   label = "Weight (in lbs):",
                   min = 1000,
                   max = 2000,
                   value = 1000,
                   step = 50),
       sliderInput(inputId = "cylinders",
                   label = "Number of Cylinders:",
                   min = 4,
                   max = 8,
                   value = 2,
                   step = 2),
       numericInput(inputId = "miles_yr",
                 label = "Miles Driven per Year (no dollar signs, commas, or spaces)",
                 value = 5000),
       numericInput(inputId = "cost_gallon",
                    label = "Cost per Gallon of Gas (no dollar signs, commas, or spaces)",
                    value = 2.25),
       submitButton(text = "Apply Selections")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h3("Miles per Gallon Benchmark"),
        h4(textOutput("benchmark")),
        h3("Approximate Gas Cost per Year"),
        h4(textOutput("gascost"))
    )
  )
))
