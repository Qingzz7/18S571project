
library(shiny)
library(DT)
library(ggplot2)
library(reshape2)
#Location 1=calumet, 2=egan,3= hanover park,4=kirie,5=lemont,6=obrien,7=southwest,8=west side

water.data.diff<-water.data.shiny
ui<-fluidPage(
  
  plotOutput("plotall"),
  hr(),

  
  fluidRow(
    column(4,offset=1,
    selectInput("X","Select X Variable:",choices=c("Suspended Solids(SS)"="SS","Total Tjeldahl Nitrogen(TKN) "="TKN",
                                          "Total Phosphorus(P.TOT)"="P.TOT","Nitrogen Ammonia(NH3.N)"="NH3.N","Flow"="FLOW","Location"="Location","Population Density"="Pop.density")),
    selectInput("Y","Select Y Variable:",choices=c('5-Day Biological Oxygen Demand (BOD5)'="BOD5","Suspended Solids(SS)"="SS","Total Tjeldahl Nitrogen(TKN) "="TKN",
                                          "Total Phosphorus(P.TOT)"="P.TOT","Nitrogen Ammonia(NH3.N)"="NH3.N","Flow"="FLOW","Location"="Location","Population Density"="Pop.density")),
   selectInput("Color","Color Plot By:",choices=c('All'='Location.name', levels(water.data.diff$Location.name)))
   ),
 
  mainPanel(
    textOutput("Loc")
  )
  )
)

server<-function(input,output,session){
  #  output$TABLE=DT::renderDT({
  #    datatable(water.data.scale, class='cell-border stripe',selection=list(target='column'))%>%formatStyle('BOD5',backgroundColor=styleInterval(3.4,c('gray','yellow')))
  # })
  
  water.data.diff<-reactive({water.data.shiny[water.data.shiny$Location.name %in% input$Color,]})
  

    output$plotall<-renderPlot({
    g<-ggplot(water.data.diff(),aes_string(x=input$X,y=input$Y), color=input$Color)+geom_point()
    g<-g+stat_smooth(aes(linetype="Regression"),method="lm",formula=y~x,se=FALSE,colour=1,size=0.5)
  facets<-paste(input$facet_row,'~',input$facet_col)
     if(input$Color !='Location.name'){
     g<-g+aes_string(color=as.factor(input$Color))
     g<-g+labs(title=paste(input$X,input$Y,sep=" vs. "),subtitle=paste0(input$Color))
     }
    
    if(input$Color=='Location.name'){
      g<-ggplot(water.data.shiny,aes_string(x=input$X,y=input$Y))+geom_point(aes(color=Location.name))
      g<-g+stat_smooth(aes(linetype="Regression"),method="lm",formula=y~x,se=FALSE,colour=1,size=0.5)
      g<-g+labs(title=paste(input$X,input$Y,sep=" vs. "),subtitle=paste0(input$Color))
     }
    print(g)

    })
    output$Loc<-renderText({
   
    })
}
shinyApp(ui=ui,server=server)
