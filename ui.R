#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Visualization of growth in Corona Virus Cases"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h1("Select the countries that you want to visualize"),
            checkboxGroupInput("Countries","Choose Countries: ",
                               choiceNames = list("India","US","Germany","Belgium","Mexico","Andorra"),
                               choiceValues = list("India","US","Germany","Belgium","Mexico","Andorra"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("See the plot here: "),
            plotlyOutput("plot1"),
            h4("Documentation: "),
            p("See the plot which shows you the number of Corona Virus Cases in the 6 countries mentioned in the Sidebar."),
            p("Just check the contries which you want displayed and their interactive plots will show up"),
            p("The data is taken from the kaggle website")
        )
    )
))
