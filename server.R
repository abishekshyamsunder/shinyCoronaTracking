#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        library(plotly)
        data<-read.csv('covid_19_clean_complete.csv', stringsAsFactors = TRUE)
        x<-as.Date(data$Date, format = "%m/%d/%y")
        data$Date<-x
        
        output$text1<- renderText({
        Countries <- paste0(input$Countries, collapse = ",")
        y<-as.list(strsplit(Countries, ",")[[1]])
        m<-unlist(y, use.names=FALSE)
        m[1]
        #val<-data$Country.Region %in% y
    })
    output$plot1<-renderPlotly({
        Countries <- paste0(input$Countries, collapse = ",")
        y<-as.list(strsplit(Countries, ",")[[1]])
        m<-unlist(y, use.names=FALSE)
        val<-data$Country.Region %in% m
        A<-data[val,]
        fig<-plot_ly(data = A,x = ~Date,y = ~Confirmed,color = A$Country.Region)
        fig
    })

})
