#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# load libraries
library(shiny)
library('rvest')
library('tidyr')
library('caret')
#library('pls')

# read data
water.data<-read.csv('completeMwrd_BOD5_processed.csv',header = TRUE)
#scale data
water.data.scale<-scale(water.data[,c(1:7,9)],center=FALSE)
water.data.scale<-data.frame('Location'=water.data$Location,'Season'=water.data$Season,water.data.scale)
#Create Training and Test Set
set.seed(571)
inTrain<-createDataPartition(y=water.data.scale[,TARGET],p=0.8,list=FALSE)
train<-water.data.scale[inTrain,]
test<-water.data.scale[-inTrain,]
# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)



# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("BOD5 prediction in waste water"),
   
   # Sidebar with input options
   sidebarLayout(
      sidebarPanel(
        
         sliderInput("TKN",
                     "TKN",
                     min = 0,
                     max = 900),
         sliderInput("NH3.N",
                     "NH3.N",
                     min = 0,
                     max = 50),
         sliderInput("P.TOT",
                     "P.TOT",
                     min = 0,
                     max = 320),
         sliderInput("SS",
                     "SS",
                     min = 0,
                     max = 19300),
         sliderInput("FLOW",
                     "FLOW",
                     min = 0,
                     max = 950),
         sliderInput("Rainfall",
                     "Rainfall",
                     min = 0,
                     max = 10),
         numericInput("Location","Location",min = 1,max = 7,step = 1),
         sliderInput("pop.density",
                     "population density",
                     min = 2000,
                     max = 10000),
         numericInput("season","season",min = 1,max = 4,step = 1),
         # Choose Model to fit from Dropdown Menu
         selectInput("model",                       # Name of input
                     "Model Type",                  # Display Label
                     choices = c("None" = "none",   # Available choices in the dropdown
                                 "Linear" = "lm"))
        )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        textOutput('predict BOD5'),
        tabPanel("Summary", verbatimTextOutput("summary")),
        tabPanel("Linear Regression Summary", verbatimTextOutput("Linearsummary"))
        
      )
      
   
)



# Define server 
server <- function(input, output) {
  
  lm1=reactive({train(BOD5 ~.,data=train,method='lm',trControl=controlParameter)}) 
  output$RegSum <- renderPrint({summary(lm1())})
  

   
   
}



# Run the application 
shinyApp(ui = ui, server = server)

