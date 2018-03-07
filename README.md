# MATH571 Final Project


### Members
- Travis Boltz
- Yitao Ma
- Yue Ning
- Yuqing Zhao
***

### Progress of Project

| Date          | Detail                | Note              |
| ------------- |:--------------------: | -----------------:|
| 02-02         | Proposal submit       | Draft             |
| 02-13         | First meeting         | Objective is comfimed & Data analysis steps update|
| 02-27         | meeting               | Prepare for 5min presentation on Thursday. Finalize proposal| 
| 03-07         | meeting               | Prepare for project plan use ASANA| 

***

### [Project plan]
(https://app.asana.com/0/583167069344786/583167069344797)


### Problem Definition 
- Water waste can be a serious problem for the Great Lakes Regoin, especailly when untreated sewage makes its way into the natural ecosystem from combined sewage overflows (CSO's).  
- Without careful waste water management, the raw sewage provides nutrients, like nitrogen and phosphorus, provides the foodstock for algae to grow unchecked resulting in a harmful algae bloom.   
- We want to use these chemical measurements and others that are present in the water to predict the concentration of nitrogen. 


### Data Sources
- We are going to work on a wastewater [dataset ](http://www.mwrd.org/irj/portal/anonymous?NavigationTarget=navurl://9f766d4f820e9482d016681c86031b76) with about 13,000 observations.    
 - We also would like to do some demographic analysis on the data.  
  [Stickney](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Stickney.pdf), [Calumet](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Calumet.pdf), [O'Brien](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_O'Brien.pdf), [Kirie](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Kirie.pdf), [Egan](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Egan.pdf), [Hanover_Park](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Hanover_Park.pdf),  [Lemont](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Lemont.pdf)  
- We also plan on adding the [daily rainfall](https://drive.google.com/file/d/1BHuq89bgyt7kC_Paf1_CjnWiG4uBgm2d/view) to our data set obtained from Wolfram Alpha


### Pre-processing steps 
1. Clean data for further analysis. Data tables will be combined first.   
2. Then we will summarize the data. 
3. Missing values or other value errors will be processed.  
4. Data may be transformed before analysis. 
5. Random sampling will be used to draw samples.   
6. Dataset will be split into training and testing data set.     

### Data Analysis Steps
1. Analysis the population, manufacturing facilities in the 10 miles range and daily rainfalls(inch) to see their relationships with the attributes. 
2. Show the summary statistics and scattering plot of every attributes at different locations and years. 
3. Use ANOVA test to see if there is any difference at different locations. 
4. Use T-tests p-approach to compare each pair of the locations at same years for each attributes.
5. Create dummy variables as needed for future modeling.

### Results Evaluation
- __Regression__ __classification__ and __clustering method__ would be used in this project. 

- __Adjusted R**2 and MSE__ will be used to evaulate our regression model. 

- __Cross-validation__ will be used in building models to avoid overfittings.  

- Several metrics like __recall__, __precision__ and __F1 Score__ will be used to evaluate the classification models.  __ROC curve__, __AUC__ and __confusion matrix__ would be used as success metrics so far. 


### Final Deliverables
- Final report will be delivered to summarize all analysis results and possible predictions.   
- Figures will be used to visualize the results and provide a direct impression.   
- Presentation will be given as a complementary to the report to show the work to audiences.  
