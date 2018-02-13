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

***
### Problem Definition  
Water waste can be a serious problem for the Great Lakes Regoin, especailly when untreated sewage makes its way into the natural ecosystem from combined sewage overflows (CSO's).  
Without careful waste water management, the raw sewage provides nutrients, like nitrogen and phosphorus, provide the foodstock for algae to grow unchecked resulting in a harmful algae bloom.  Harmful algae blooms (HAB's) can release poisons that are harmful to the environment and human health. Not all municipalities have the budget or foresight to measure nitrogen in their water supply. However, it is much more common for muncipalities to measure properties like BOD5, Suspended Solids, and dissolved oxygen.   
We want to use these chemical measurements and others that are present in the water to predict the concentration of nitrogen. This is useful in both understand which chemicals correlated with nitrogen, and make an inferences about concentration of nitrogen when it is absent from the data.  


### Data Sources
We are going to work on a wastewater dataset with about 13,000 observations.    
The [raw data](http://www.mwrd.org/irj/portal/anonymous?NavigationTarget=navurl://9f766d4f820e9482d016681c86031b76) is available online at the website in the CSV files. We plan to use final effluents and raw effluents based on seven locations from 2011 to 2020.  
  
  
Demographic information based on different location  
[Stickney](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Stickney.pdf),
[Calumet](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Calumet.pdf),
[O'Brien](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_O'Brien.pdf),
[Kirie](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Kirie.pdf),
[Egan](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Egan.pdf),
[Hanover_Park](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Hanover_Park.pdf), 
[Lemont](http://www.mwrd.org/irj/go/km/docs/documents/MWRD/internet/protecting_the_environment/Water_Reclamation_Plants/pdfs/FactSheet_WRPs_Lemont.pdf)  
  We plan on adding the [daily rainfall](https://drive.google.com/file/d/1BHuq89bgyt7kC_Paf1_CjnWiG4uBgm2d/view) to our data set obtained from Wolfram Alpha
  
### Pre-processing steps 
1. Clean data for further analysis. Data tables will be combined first.   
2. Then we will summarize the data. 
3. Missing values or other value errors will be processed.  
4. Data may be transformed before analysis. 
5. Random sampling will be used to draw samples.   
6. Dataset will be split into training and testing data set.     
 

### Data Analysis Steps
1. We plan to analysis the population, manufacturing facilities in the 10 miles range, and daily rainfalls(inch) to see their relationships with the attributes. 
2. We will show the summary statistics and scattering plot of every attributes at different locations and years interval. we wanna exam the distributions and see the change first.
3. We will use T-tests p-approach to compare each pair of the locations at same years for each attributes.
use ANOVA test to compare the attributes of different years at same location.
4. We will create dummy variables based on the ANOVA as needed for future modeling.
    
 
  
### Results Evaluation
__Regression__ __classification__ and __clustering model__ would be used in this project.      
__Cross-validation__ will be used in building models.       
Thresholds would be given after several tests.      
Several metrics like __recall__, __precision__ and __F1 Score__ will be used to evaluate the models.     
__ROC curve__, __AUC__ and __confusion matrix__ would be used as success metrics so far.    
  

### Final Deliverables
Final report will be delivered to summarize all analysis results and possible predictions.   
Figures will be used to visualize the results and provide a direct impression.   
Presentation will be given as a complementary to the report to show the work to audiences.  
