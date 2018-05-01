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
water.data=water.data[,-1]
#scale data
water.data.scale<-scale(water.data[,c(1:7,9)],center=FALSE)
water.data.scale<-data.frame('Location'=water.data$Location,'Season'=water.data$Season,water.data.scale)
#Create Training and Test Set
set.seed(571)
inTrain<-createDataPartition(y=water.data.scale$BOD5,p=0.8,list=FALSE)
train<-water.data.scale[inTrain,]
test<-water.data.scale[-inTrain,]
# perform cross-validtion on training data set
controlParameter=trainControl(method = "cv",number = 10,savePredictions = TRUE)
# perform linear regreesion on training data
lm_model<-train(BOD5~.,data=train,method='lm',trControl=controlParameter)
# constrcut empty data frame for prediction
newdf=data.frame(matrix(ncol = 9,nrow = 0))
colnames(newdf)=names(water.data[,-1])


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("BOD5 prediction in waste water"),
   
   # Sidebar with input options
   sidebarLayout(
     
      sidebarPanel(
        
         sliderInput("TKN",
                     "TKN",
                     value = 27,
                     min = 0,
                     max = 900),
         sliderInput("NH3.N",
                     "NH3.N",
                     value = 15.2,
                     min = 0,
                     max = 50),
         sliderInput("P.TOT",
                     "P.TOT",
                     value = 4.6,
                     min = 0,
                     max = 320),
         sliderInput("SS",
                     "SS",
                     value = 154,
                     min = 0,
                     max = 19300),
         sliderInput("FLOW",
                     "FLOW",
                     value = 132,
                     min = 0,
                     max = 950),
         sliderInput("Rainfall",
                     "Rainfall",
                     value = 0.1,
                     min = 0,
                     max = 10),
         sliderInput("Location",
                     "Location",
                     value = 1,
                     min = 1,
                     max = 7,
                     step = 1),
         sliderInput("Pop.density",
                     "Pop.density",
                     value = 5048,
                     min = 2000,
                     max = 10000),
         sliderInput("Season",
                     "Season",
                     value = 1,
                     min = 1,
                     max = 4,
                     step = 1),
         # numericInput("Location","Location",value =1,  min = 1,max = 7,step = 1),
         # numericInput("Season","Season",value = 1 ,min = 1,max = 4,step = 1),
         # Choose Model to fit from Dropdown Menu
         selectInput("model",                       # Name of input
                     "Model Type",                  # Display Label
                     choices = c("None" = "none",   # Available choices in the dropdown
                                 "Linear" = "lm"))
        ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(
          type = "tabs",
          tabPanel("Training Data Summary", verbatimTextOutput("datasummary")),
          tabPanel("Linear Regression Model Summary", 
                   verbatimTextOutput("model")),
          tabPanel("Predict BOD5",textOutput('pred'))
          
        )
        
      )
      
    )
)



# Define server 
server <- function(input, output) {
  # Generate summary statistics of the training dataset
  output$datasummary <- renderPrint({summary(train)})
  
  # regression model
  output$model <- renderPrint({summary(lm_model)})
  
  # predict output
  # take input data
  # dataIn <- reactive(
  #   {
  #     predict(lm_model,
  #             rbind(newdf,c(
  #               input$TKN,
  #               input$NH3.N,
  #               input$P.TOT,
  #               input$SS,
  #               input$FLOW,
  #               input$Rainfall,
  #               input$Location,
  #               input$Pop.density,
  #               input$Season ))
  #             )
  #   }
  # )
  # output$pred <- renderPrint({dataIn()})
  
  output$pred <- renderPrint({'prediction result'})

   
}



# Run the application 
shinyApp(ui = ui, server = server)

