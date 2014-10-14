library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Gas Mileage of 1974 Automobiles"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("tranny", "Choose a Transmission type:", 
                  choices = c("Automatic", "Manual")),
      
      sliderInput("hp", "How much Horsepower we talking?:", min=52, max=335, value=123),
      sliderInput("wt", "What does she weigh?:", min=1500, max=5500, value=3325)
    ),
    
    # Show a summary of the dataset and an HTML table with the requested
    # number of observations
    mainPanel(
      p("This appliation will estimate what the gas mileage of your rusted-out 1974 vehicle was back when it was new based on the Motor Trend data set in R."),
      p("Simply enter the transmission type, horsepower, and weight on the left and get your result."),
      br(),
      p("Estimated MPG for that hoopty is at least"),
      strong(textOutput("lower")),
      p("and less than"),
      strong(textOutput("upper")),
      h2("How did you do that?"),
      p("Oh it was easy, man."),
      p("I loaded up the mtcars dataset and made sure that transmission type was a factor variable like this:"),
      code("data(mtcars)"),br(),
      code("mtcars$am <- as.factor(mtcars$am)"),br(),
      code("levels(mtcars$am) <- c(\"Automatic\", \"Manual\")"),
      p("Then I trained a model like this:"),
      code("model <- lm(mpg ~ am + wt + hp, data=mtcars)"),
      p("And then I used your input to feed the predict function. Easy, peasy, lemon squeezy.")
    )
  )
))
