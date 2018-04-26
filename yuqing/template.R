# UI template

install.packages("shiny")
library(shiny)

ui=fluidPage()
server=function(input,output){}
shinyApp(ui=ui,server = server)
