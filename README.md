# 18SMATH571 Final Project
## Preliminary Project Proposal


### Members
- Travis Boltz
- Yitao Ma
- Yue Ning
- Yuqing Zhao
***
### Problem Definition  
  Water waste can be a serious problem to the greater Chicago area. Without careful waste water processing, it will be harmful to the environment and threaten the future water quality.During the waste water processing, chemicals need to be eliminated and reduced to a safety level.   
  By comparing the chemicals in the waste water before and after processing, we can know how the process performed.We would also like to predict the present of certain chemicals based on other chemicals levels. Based on this, we can prepare for future waste water processing requirements.  


### Data Sources
We are going to work on a wastewater dataset with about 13,000 observations.    
The [raw data](http://www.mwrd.org/irj/portal/anonymous?NavigationTarget=navurl://9f766d4f820e9482d016681c86031b76) is available online at the website in the CSV files.  
  
  
### Pre-processing steps 
Clean data for further analysis. Data tables will be combined first.   Then we will summarize the data. Missing values or other value errors will be processed.  
Data may be transformed before analysis. Random sampling will be used to draw samples.   
Dataset will be split into training and testing data set.     
 

### Data Analysis Steps
We will explore the relationships among all attributes.   
Group the data with attributes having dependence.   
Remove unrelated attributes.   
It is possible to perform principal component analysis here to identify the key features.   
Building various regression models on training data set. Building classification models as well.     
 
  
### Results Evaluation
__Regression, classification and clustering model__ would be used in this project.  
__Cross-validation__ will be used in building models.  
Thresholds would be given after several tests.  
Several methods like __recall, precision and F1 Score__ will be used to evaluate the models.   
__ROC, AUC and confusion matrix__ would be used as success metrics so far.  
  

##### Final Deliverables:
A final report will be delivered to summarize all analysis results and possible predictions.   
Figures will be used to visualize the results and provide a direct impression.   
Presentation will be given as a complementary to the report to show the work to audiences.  
