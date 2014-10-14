library(shiny)
library(datasets)
data(mtcars)
mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")

# Build a model one time. Don't do it again
model <- lm(mpg ~ am + wt + hp, data=mtcars)

shinyServer(function(input, output) {
  results <- reactive(predict(model, data.frame(am=input$tranny, wt=input$wt/1000, hp=input$hp), interval="confidence"))
  output$lower <- renderText({results()[2]})
  output$upper <- renderText({results()[3]})
})